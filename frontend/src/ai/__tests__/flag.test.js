import { afterEach, describe, expect, it, vi } from "vitest";
import { isAiAgentEnabled } from "../flag";

describe("AI distribution feature flag", () => {
  afterEach(() => vi.unstubAllEnvs());

  it("is enabled when no build-time flag is supplied", () => {
    vi.stubEnv("VITE_FEATURE_AI_AGENT", undefined);
    expect(isAiAgentEnabled()).toBe(true);
  });

  it("keeps an explicit emergency kill switch", () => {
    vi.stubEnv("VITE_FEATURE_AI_AGENT", "false");
    expect(isAiAgentEnabled()).toBe(false);
  });
});
