export function isAiAgentEnabled() {
  // This repository is the AI-enabled distribution. Keep an explicit kill switch for staged
  // rollouts, but do not silently hide every AI surface when engineers run it without copying
  // .env.example first.
  return String(import.meta.env.VITE_FEATURE_AI_AGENT ?? "true").toLowerCase() !== "false";
}
