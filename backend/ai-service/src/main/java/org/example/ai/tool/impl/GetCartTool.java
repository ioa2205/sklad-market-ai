package org.example.ai.tool.impl;

import org.example.ai.gateway.GatewayClient;
import org.example.ai.gateway.GatewayNotFoundException;
import org.example.ai.gateway.GatewayUnavailableException;
import org.example.ai.gateway.dto.GatewayEnvelope;
import org.example.ai.gateway.dto.RemoteCartDto;
import org.example.ai.tool.AgentTool;
import org.example.ai.tool.PlatformLanguage;
import org.example.ai.tool.ToolExecutionContext;
import org.example.ai.tool.ToolResult;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** {@code GET /api/v1/cart} (verified in {@code CartController}, class-level {@code hasRole('BUYER')}). */
@Component
public class GetCartTool implements AgentTool {

    private final GatewayClient gatewayClient;

    public GetCartTool(GatewayClient gatewayClient) {
        this.gatewayClient = gatewayClient;
    }

    @Override
    public String name() {
        return "get_cart";
    }

    @Override
    public String description() {
        return "Fetch the current buyer's shopping cart: items, quantities, and total item count.";
    }

    @Override
    public Map<String, Object> parametersSchema() {
        return Map.of("type", "OBJECT", "properties", Map.of(), "required", List.of());
    }

    @Override
    public Set<String> allowedRoles() {
        return Set.of("BUYER");
    }

    @Override
    public ToolResult execute(Map<String, Object> args, ToolExecutionContext context) {
        try {
            GatewayEnvelope<RemoteCartDto> envelope = gatewayClient.get(
                    "/api/v1/cart",
                    null,
                    context.bearerToken(),
                    PlatformLanguage.header(context.acceptLanguage()),
                    new ParameterizedTypeReference<GatewayEnvelope<RemoteCartDto>>() {
                    });
            RemoteCartDto cart = envelope == null ? null : envelope.data();
            if (cart == null) {
                return ToolResult.ok(Map.of("itemCount", 0, "totalQuantity", 0, "items", List.of()));
            }
            Map<String, Object> result = new LinkedHashMap<>();
            result.put("itemCount", cart.itemCount());
            result.put("totalQuantity", cart.totalQuantity());
            result.put("items", cart.items() == null ? List.of() : cart.items().stream().map(item -> {
                Map<String, Object> projected = new LinkedHashMap<>();
                projected.put("productName", item.productName());
                projected.put("productSlug", item.productSlug());
                projected.put("price", item.price());
                projected.put("currency", item.currency());
                projected.put("companyName", item.companyName());
                projected.put("quantity", item.quantity());
                return projected;
            }).toList());
            return ToolResult.ok(result);
        } catch (GatewayNotFoundException e) {
            return ToolResult.ok(Map.of("itemCount", 0, "totalQuantity", 0, "items", List.of()));
        } catch (GatewayUnavailableException e) {
            return ToolResult.error("The cart service is temporarily unavailable", null);
        }
    }
}
