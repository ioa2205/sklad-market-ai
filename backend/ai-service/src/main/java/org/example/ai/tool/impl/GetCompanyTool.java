package org.example.ai.tool.impl;

import org.example.ai.gateway.GatewayClient;
import org.example.ai.gateway.GatewayNotFoundException;
import org.example.ai.gateway.GatewayUnavailableException;
import org.example.ai.gateway.dto.GatewayEnvelope;
import org.example.ai.gateway.dto.RemoteCompanyDto;
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
 * {@code GET /api/v1/companies/{slug}} (verified live in {@code CompanyController} on {@code
 * main}, {@code @PermitAll}): returns the public {@code CompanySlugMapResponse}. The projection is
 * an explicit allowlist containing identity/location plus public business phones, website, and
 * establishment date; unknown or future wire fields are not forwarded. A live
 * probe of an unknown slug against skladmarket.uz on 2026-07-08 returned HTTP 400 with a
 * plain-text body ("companiya topilmadi") — different from product-service's JSON error shape,
 * confirming §7 item 10's "treat every 4xx uniformly" guidance is still the right approach.
 */
@Component
public class GetCompanyTool implements AgentTool {

    private final GatewayClient gatewayClient;

    public GetCompanyTool(GatewayClient gatewayClient) {
        this.gatewayClient = gatewayClient;
    }

    @Override
    public String name() {
        return "get_company";
    }

    @Override
    public String description() {
        return "Fetch a seller company's public profile by slug (from a product's company info or a "
                + "/company/<slug> link): name, verification status, location, public business "
                + "phone numbers, website, and establishment date.";
    }

    @Override
    public Map<String, Object> parametersSchema() {
        Map<String, Object> properties = Map.of("slug", Map.of("type", "STRING", "description", "Exact company slug."));
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
            GatewayEnvelope<RemoteCompanyDto> envelope = gatewayClient.get(
                    "/api/v1/companies/{slug}",
                    null,
                    context.bearerToken(),
                    PlatformLanguage.header(context.acceptLanguage()),
                    new ParameterizedTypeReference<GatewayEnvelope<RemoteCompanyDto>>() {
                    },
                    slug);
            RemoteCompanyDto company = envelope == null ? null : envelope.data();
            if (company == null) {
                return ToolResult.notFound("Company not found: " + slug);
            }
            Map<String, Object> result = new LinkedHashMap<>();
            result.put("name", company.name());
            result.put("slug", company.slug());
            result.put("status", company.status());
            result.put("regionId", company.regionId());
            result.put("districtId", company.districtId());
            result.put("address", company.address());
            result.put("phonePrimary", company.phonePrimary());
            result.put("phoneSecondary", company.phoneSecondary());
            result.put("website", company.website());
            result.put("companyCreatedDate", company.companyCreatedDate());
            return ToolResult.ok(result);
        } catch (GatewayNotFoundException e) {
            return ToolResult.notFound("Company not found: " + slug);
        } catch (GatewayUnavailableException e) {
            return ToolResult.error("The company service is temporarily unavailable", null);
        }
    }
}
