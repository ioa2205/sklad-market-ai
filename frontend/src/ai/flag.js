export function isAiAgentEnabled() {
  return import.meta.env.VITE_FEATURE_AI_AGENT === "true";
}
