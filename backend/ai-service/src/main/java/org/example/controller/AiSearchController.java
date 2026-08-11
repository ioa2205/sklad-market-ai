package org.example.controller;

import org.example.ai.embedding.EmbeddingSearchService;
import org.example.ai.error.AiChatException;
import org.example.ai.error.AiErrorCode;
import org.example.ai.guardrail.RpmRateLimiter;
import org.example.ai.guardrail.TokenBudgetGuard;
import org.example.ai.guardrail.UsageLedgerService;
import org.example.ai.observability.AiMetrics;
import org.example.security.AiSecurityUtil;
import org.example.dto.ApiResponse;
import org.example.dto.SearchResultItem;
import org.example.dto.SemanticSearchResponse;
import org.example.dto.SimilarProductsResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Vector-index read endpoints (PLAN.md Phase 5). Both are authenticated (SecurityConfig's
 * {@code anyRequest().authenticated()}), owner-agnostic (the catalog is public data), and never
 * call downstream services — they query the local {@code product_embedding} table only. The
 * "similar products" endpoint is documented in README.md as a consumable API for the frontend team;
 * wiring it into ProductPage is deferred to them (PLAN.md §8).
 */
@RestController
@RequestMapping("/api/v1/ai")
public class AiSearchController {

    private final EmbeddingSearchService searchService;
    private final RpmRateLimiter rateLimiter;
    private final TokenBudgetGuard budgetGuard;
    private final UsageLedgerService usageLedgerService;
    private final AiMetrics metrics;

    public AiSearchController(
            EmbeddingSearchService searchService,
            RpmRateLimiter rateLimiter,
            TokenBudgetGuard budgetGuard,
            UsageLedgerService usageLedgerService,
            AiMetrics metrics) {
        this.searchService = searchService;
        this.rateLimiter = rateLimiter;
        this.budgetGuard = budgetGuard;
        this.usageLedgerService = usageLedgerService;
        this.metrics = metrics;
    }

    @GetMapping("/search")
    public ApiResponse<SemanticSearchResponse> search(
            @RequestParam("q") String query,
            @RequestParam(value = "limit", required = false) Integer limit) {
        String userSub = AiSecurityUtil.requireSub();
        guardRate("search", userSub);
        if (!budgetGuard.hasRemainingBudget(userSub)) {
            throw new AiChatException(AiErrorCode.BUDGET_EXCEEDED, "Daily usage limit reached.");
        }
        long startedAt = System.currentTimeMillis();
        try {
            List<SearchResultItem> items = searchService.search(query, limit);
            usageLedgerService.recordEmbeddingRequest(userSub, query);
            metrics.recordSemanticSearch("search", "ok", System.currentTimeMillis() - startedAt);
            return ApiResponse.successResponse(new SemanticSearchResponse(query, items.size(), items));
        } catch (RuntimeException e) {
            metrics.recordSemanticSearch("search", "error", System.currentTimeMillis() - startedAt);
            throw e;
        }
    }

    @GetMapping("/similar/{productId}")
    public ApiResponse<SimilarProductsResponse> similar(
            @PathVariable long productId,
            @RequestParam(value = "limit", required = false) Integer limit) {
        guardRate("similar", AiSecurityUtil.requireSub());
        long startedAt = System.currentTimeMillis();
        try {
            List<SearchResultItem> items = searchService.similar(productId, limit);
            metrics.recordSemanticSearch("similar", "ok", System.currentTimeMillis() - startedAt);
            return ApiResponse.successResponse(new SimilarProductsResponse(productId, items.size(), items));
        } catch (RuntimeException e) {
            metrics.recordSemanticSearch("similar", "error", System.currentTimeMillis() - startedAt);
            throw e;
        }
    }

    private void guardRate(String operation, String userSub) {
        // Prefixing keeps direct API traffic from consuming the chat endpoint's per-user bucket.
        if (!rateLimiter.tryConsume("rest-" + operation + ":" + userSub)) {
            throw new AiChatException(AiErrorCode.RATE_LIMITED, "Too many requests, please slow down.");
        }
    }
}
