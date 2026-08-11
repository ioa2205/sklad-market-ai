package org.example.ai.business.remote;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
public record RemoteBusinessProduct(
        Long id,
        Long companyId,
        Long categoryId,
        String name,
        String slug,
        String shortDescription,
        String description,
        Double price,
        String currency,
        Long min,
        Long regionId,
        Long districtId,
        String status,
        Boolean isActive,
        Long viewsCountCache,
        Long favoritesCountCache,
        Map<String, Object> attributes) {

    public boolean publiclyVisible() {
        return id != null && companyId != null && "APPROVED".equals(status) && Boolean.TRUE.equals(isActive);
    }
}
