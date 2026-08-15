# SKLAD Market AI

Public integration workspace containing the complete backend and frontend snapshots for the SKLAD Market AI feature.

## Source snapshots

- `backend/`: local `feature/ai-service` integration at `8b40119`
  - Includes backend `upstream/main` at `070a90e`
- `frontend/`: local `feature/ai-agent-latest` integration at `1a1ddfe`
  - Rebased by applying the AI feature commits onto frontend `origin/main` at `79ea740`

The original repositories' `.git` directories, local build output, IDE metadata, untracked files, and secrets are intentionally not included.

## What is included

- AI chat agent with RU/UZ/EN support
- Product and company semantic/hybrid search
- Public business-contact discovery
- Supplier recommendations based on explicit need and buyer-owned activity
- Buyer recommendations from seller-authorized leads
- Opt-in buying-intent discovery and matching
- Seller listing assistance and user-confirmed RFQ/lead drafts
- Separate PostgreSQL/pgvector AI database with Flyway V1-V7
- Gateway, Docker Compose, and additive category-attribute integration
- Frontend feature flag, structured result cards, safe auth refresh, and AI tests
- Clickable AI product/company result cards using existing platform detail routes
- Logged-in dashboard AI welcome, suggested prompts, and search-to-AI handoff
- Responsive right-side AI smart-results panel beside normal dashboard search results
- One shared website/AI i18next language state for UI and backend response locale

## Repository layout

```text
backend/   Spring Boot services, ai-service, gateway, and Docker Compose
frontend/  Vite/React frontend
```

## Before deployment

1. Read [`backend/ai-service/HANDOFF.md`](backend/ai-service/HANDOFF.md).
2. Configure a strong `AI_DB_PASSWORD` and a paid-tier `GEMINI_API_KEY` on the server. Never commit them.
3. Validate `AI_CHAT_MODEL`, `AI_CHAT_MODEL_ADVANCED`, and `AI_EMBEDDING_MODEL` against the team's Gemini account.
4. Deploy/rebuild the additive `category-service` endpoint, API Gateway route, `ai-db`, and `ai-service`.
5. Let Flyway apply V1-V7, then run the product and business reindex endpoints.
6. Complete the real JWT/gateway/nginx SSE smoke checklist in the handoff document.
7. Keep `VITE_FEATURE_AI_AGENT=false` until the backend smoke test passes. Set it to `true` at frontend build time to enable the real agent.

## Integration surface

Backend changes outside `ai-service` are intentionally small:

- `backend/docker-compose.yml`
- `backend/api-gateway/src/main/resources/application.yml`
- Four additive files in `backend/category-service` supporting `GET /api/v1/categories/{slug}/attributes`

The AI service reads existing product, company, category, lead, cart, favorite, chat, and attachment APIs through the gateway. Its external business write is limited to creating a lead after explicit user confirmation.

Frontend AI code lives primarily under `frontend/src/ai`. The shared files `frontend/src/api/http.js`, `api.js`, and `authRefresh.js` coordinate refresh-token rotation for ordinary and AI requests. `frontend/src/pages/HomePage.jsx` hosts the welcome and failure-isolated smart-results sidebar, while `frontend/src/i18n/index.js` registers the AI translations in the platform's single i18next instance. Frontend reviewers should include these integration files in their review.

## Recommendation scope

Current recommendations are semantic/content/activity based. Collaborative filtering is intentionally deferred until the platform has sufficient interaction data. Buyer discovery uses only seller-authorized leads and explicitly published buying intents; it is not a private global buyer directory.

## Local verification recorded at export

- Backend: 328-test inventory; all 325 runnable tests passed, with 3 provider-dependent skips
- PostgreSQL/pgvector: production Flyway V1-V7 and repository integration checks passed
- Frontend: 125/125 AI tests passed
- Frontend production build and AI-scope ESLint passed
- Current dashboard/clickable-result/shared-language focused suite: 34/34 passed
- Right-side dashboard AI panel focused suite: 11/11 passed
