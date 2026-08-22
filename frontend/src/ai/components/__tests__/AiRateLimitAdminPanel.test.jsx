import { fireEvent, render, screen, waitFor } from "@testing-library/react";
import { beforeEach, describe, expect, it, vi } from "vitest";
import AiRateLimitAdminPanel from "../AiRateLimitAdminPanel";
import { setAiLocale } from "../../i18n";

const { listMock, updateMock, resetMock } = vi.hoisted(() => ({
  listMock: vi.fn(),
  updateMock: vi.fn(),
  resetMock: vi.fn(),
}));

vi.mock("../../api/aiClient", () => ({
  listAiRateLimits: listMock,
  updateAiRateLimit: updateMock,
  resetAiRateLimit: resetMock,
}));

describe("AiRateLimitAdminPanel", () => {
  beforeEach(() => {
    setAiLocale("en");
    listMock.mockReset();
    updateMock.mockReset();
    resetMock.mockReset();
  });

  it("is isolated from non-admin chat users", () => {
    render(<AiRateLimitAdminPanel role="BUYER" />);
    expect(screen.queryByText("AI chat request limits")).not.toBeInTheDocument();
    expect(listMock).not.toHaveBeenCalled();
  });

  it("lets an admin change one user's chat-only RPM", async () => {
    listMock.mockResolvedValue([
      {
        userSub: "user-sub-1",
        username: "buyer@example.com",
        requestsPerMinute: null,
        effectiveRequestsPerMinute: 10,
        dailyTokenBudget: null,
        effectiveDailyTokenBudget: 200000,
        usedTokensToday: 1000,
        remainingTokensToday: 199000,
      },
    ]);
    updateMock.mockResolvedValue({
      userSub: "user-sub-1",
      username: "buyer@example.com",
      requestsPerMinute: 30,
      effectiveRequestsPerMinute: 30,
      dailyTokenBudget: 2000000,
      effectiveDailyTokenBudget: 2000000,
      usedTokensToday: 1000,
      remainingTokensToday: 1999000,
    });

    render(<AiRateLimitAdminPanel role="SUPER_ADMIN" />);
    fireEvent.click(screen.getByRole("button", { name: /AI chat request limits/i }));

    const input = await screen.findByRole("spinbutton", {
      name: "Requests per minute for buyer@example.com",
    });
    const budgetInput = screen.getByRole("spinbutton", {
      name: "Daily token budget for buyer@example.com",
    });
    fireEvent.change(input, { target: { value: "30" } });
    fireEvent.change(budgetInput, { target: { value: "2000000" } });
    fireEvent.click(screen.getByRole("button", { name: "Save" }));

    await waitFor(() => expect(updateMock).toHaveBeenCalledWith("user-sub-1", {
      requestsPerMinute: 30,
      dailyTokenBudget: 2000000,
    }));
    expect(input).toHaveValue(30);
  });
});
