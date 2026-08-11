package org.example.ai.embedding;

/**
 * One nearest-neighbour result from the vector index. {@code score} is cosine similarity in
 * {@code [-1, 1]} (1 = identical direction), computed as {@code 1 - (embedding <=> query)}.
 */
public record EmbeddingSearchHit(
        long productId,
        String slug,
        String name,
        Long categoryId,
        Long regionId,
        Double price,
        String currency,
        double score) {
}
