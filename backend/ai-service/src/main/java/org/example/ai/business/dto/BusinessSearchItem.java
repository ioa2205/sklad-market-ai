package org.example.ai.business.dto;

import java.util.List;

/** A typed, grounded business-discovery result suitable for both REST and structured SSE cards. */
public record BusinessSearchItem(
        BusinessResultType type,
        Long id,
        String slug,
        String name,
        Long categoryId,
        Long regionId,
        Double price,
        String currency,
        String verificationStatus,
        List<Long> categoryIds,
        List<Long> regionIds,
        Integer productCount,
        Double minPrice,
        Double maxPrice,
        double relevance,
        List<String> reasons,
        BusinessContactStatus contactStatus,
        BusinessContact contact) {
}
