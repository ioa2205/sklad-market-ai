package org.example.ai.tool.impl;

import org.example.ai.gateway.GatewayClient;
import org.example.ai.gateway.GatewayNotFoundException;
import org.example.ai.gateway.GatewayUnavailableException;
import org.example.ai.gateway.dto.GatewayEnvelope;
import org.example.ai.gateway.dto.RemoteProductDetailDto;
import org.example.ai.tool.AgentTool;
import org.example.ai.tool.PlatformLanguage;
import org.example.ai.tool.ToolArgs;
import org.example.ai.tool.ToolExecutionContext;
import org.example.ai.tool.ToolResult;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * {@code GET /api/v1/products/slug/{slug}} (verified in {@code ProductController} on {@code
 * main}): filters to {@code moderationStatus=APPROVED} (unlike {@code GET /products/all}, PLAN.md
 * §7 item 12), and is the only product endpoint exposing the category name (§7 item 12). A live
 * probe of an unknown slug against skladmarket.uz on 2026-07-08 returned HTTP 400 with a JSON body
 * {@code {success:false,message:"...",errors:{},trace_id:"..."}} (§7 item 10 confirmed: 400, never
 * 404) — handled uniformly via {@link org.example.ai.gateway.GatewayNotFoundException}.
 */
@Component
public class GetProductTool implements AgentTool {

    private static final int MAX_DESCRIPTION_CHARS = 500;

    private final GatewayClient gatewayClient;

    public GetProductTool(GatewayClient gatewayClient) {
        this.gatewayClient = gatewayClient;
    }

    @Override
    public String name() {
        return "get_product";
    }

    @Override
    public String description() {
        return "Fetch full details for one product by its exact slug (obtained from search_products "
                + "results or a /product/<slug> link). Returns name, price, currency, description, "
                + "status, seller company, and category.";
    }

    @Override
    public Map<String, Object> parametersSchema() {
        Map<String, Object> properties = Map.of("slug", Map.of("type", "STRING", "description", "Exact product slug."));
        return Map.of("type", "OBJECT", "properties", properties, "required", List.of("slug"));
    }

    @Override
    public Set<String> allowedRoles() {
        return Set.of();
    }

    @Override
    public ToolResult execute(Map<String, Object> args, ToolExecutionContext context) {
        String slug = ToolArgs.asString(args.get("slug"));
        if (slug == null) {
            return ToolResult.error("slug is required", null);
        }
        try {
            GatewayEnvelope<RemoteProductDetailDto> envelope = gatewayClient.get(
                    "/api/v1/products/slug/{slug}",
                    null,
                    context.bearerToken(),
                    PlatformLanguage.header(context.acceptLanguage()),
                    new ParameterizedTypeReference<GatewayEnvelope<RemoteProductDetailDto>>() {
                    },
                    slug);
            RemoteProductDetailDto product = envelope == null ? null : envelope.data();
            if (product == null) {
                return ToolResult.notFound("Product not found: " + slug);
            }
            return ToolResult.ok(project(product));
        } catch (GatewayNotFoundException e) {
            return ToolResult.notFound("Product not found: " + slug);
        } catch (GatewayUnavailableException e) {
            return ToolResult.error("The product service is temporarily unavailable", null);
        }
    }

    private Map<String, Object> project(RemoteProductDetailDto product) {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("name", product.name());
        result.put("slug", product.slug());
        result.put("price", product.price());
        result.put("currency", product.currency());
        result.put("status", product.status());
        String description = product.description() != null ? product.description() : product.shortDescription();
        result.put("description", ToolArgs.truncate(description, MAX_DESCRIPTION_CHARS));
        if (product.company() != null) {
            Map<String, Object> company = new LinkedHashMap<>();
            company.put("name", product.company().name());
            company.put("slug", product.company().slug());
            result.put("company", company);
        }
        if (product.category() != null) {
            Map<String, Object> category = new LinkedHashMap<>();
            category.put("name", product.category().name());
            category.put("slug", product.category().slug());
            result.put("category", category);
        }
        result.put("regionId", product.regionId());
        result.put("districtId", product.districtId());
        return result;
    }
}
