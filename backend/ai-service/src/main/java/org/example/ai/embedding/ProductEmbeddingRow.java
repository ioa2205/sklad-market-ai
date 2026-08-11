package org.example.ai.embedding;

/**
 * A product's row in {@code product_embedding} — the projection fields kept for result rendering
 * plus the content hash (skip-unchanged) and the normalized vector. Built by the indexer from the
 * public {@code /api/v1/products/all} list fields only.
 */
public record ProductEmbeddingRow(
        long productId,
        String slug,
        String name,
        Long categoryId,
        Long regionId,
        Double price,
        String currency,
        String contentHash,
        float[] embedding) {
}
