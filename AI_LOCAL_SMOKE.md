# AI dashboard local smoke check

Use this after restoring marketplace databases locally.

1. Pull the latest `main` of this repository and rebuild both `ai-service` and the frontend.
2. Do not set `VITE_FEATURE_AI_AGENT=false`. The AI distribution is enabled by default.
3. Start the normal gateway/product/company/auth services plus `ai-db` and `ai-service`.
4. Set a valid `GEMINI_API_KEY` for semantic search and recommendations. A missing key no longer
   hides exact dashboard catalog/company matches, but vector recommendations cannot work without it.
5. Log in, open `/`, and type at least two characters into the home search box. The right-side
   **AI smart matches** panel must appear after the short debounce.
6. With an admin JWT, check:
   - `GET /api/v1/ai/admin/reindex/status`
   - `GET /api/v1/ai/admin/business-reindex/status`
   A restored marketplace DB does not populate these separate AI indexes. Trigger the matching
   `POST` endpoints if their status is `NEVER_RUN`, `FAILURE`, or their index size is zero.

Quick diagnosis:

- No AI panel at all: old frontend build, logged-out test, or `VITE_FEATURE_AI_AGENT=false`.
- AI panel shows an HTTP/auth error: API Gateway route or `ai-service` was not rebuilt/running.
- Exact product/company matches appear but semantic matches and recommendations do not: AI index
  is still empty, `GEMINI_API_KEY` is missing/invalid, or reindex has not completed.
- Normal search is empty after a database restore: verify the ordinary product/company service
  restore and its own search dependencies; that is outside the AI index.
