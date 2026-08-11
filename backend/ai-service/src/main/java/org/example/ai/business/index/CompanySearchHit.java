package org.example.ai.business.index;

import java.util.List;

public record CompanySearchHit(
        long companyId,
        String slug,
        String name,
        String verificationStatus,
        List<Long> categoryIds,
        List<Long> regionIds,
        int productCount,
        Double minPrice,
        Double maxPrice,
        double score) {
}
