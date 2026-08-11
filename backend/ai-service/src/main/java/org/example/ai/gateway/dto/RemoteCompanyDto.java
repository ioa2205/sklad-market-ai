package org.example.ai.gateway.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDate;

/** Mirrors company-service's {@code CompanySlugMapResponse}, as returned by {@code GET /api/v1/companies/{slug}}. */
@JsonIgnoreProperties(ignoreUnknown = true)
public record RemoteCompanyDto(
        Long id,
        String name,
        String slug,
        String status,
        Long regionId,
        Long districtId,
        String address,
        String phonePrimary,
        String phoneSecondary,
        String website,
        LocalDate companyCreatedDate) {
}
