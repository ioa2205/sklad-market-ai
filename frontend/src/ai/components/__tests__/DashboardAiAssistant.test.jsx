import { beforeEach, describe, expect, it, vi } from "vitest";
import { fireEvent, render, screen } from "@testing-library/react";
import { MemoryRouter, useLocation } from "react-router-dom";
import DashboardAiAssistant from "../DashboardAiAssistant";
import { setAiLocale } from "../../i18n";

vi.mock("../../flag", () => ({ isAiAgentEnabled: () => true }));

function LocationProbe() {
  const location = useLocation();
  return <output data-testid="location">{`${location.pathname}${location.search}`}</output>;
}

describe("DashboardAiAssistant", () => {
  beforeEach(() => {
    localStorage.clear();
    setAiLocale("en");
  });

  it("welcomes the logged-in user and opens a suggested AI task", () => {
    render(
      <MemoryRouter>
        <DashboardAiAssistant
          user={{ firstName: "Alex", role: "BUYER" }}
          isLoggedIn
        />
        <LocationProbe />
      </MemoryRouter>
    );

    expect(screen.getByText("Hi, Alex!")).toBeInTheDocument();
    fireEvent.click(screen.getByRole("button", { name: "Recommend suitable suppliers" }));

    const location = screen.getByTestId("location").textContent;
    expect(location).toMatch(/^\/ai-agent\?prompt=/);
    expect(decodeURIComponent(location)).toContain("Recommend suitable suppliers");
  });

  it("does not expose the authenticated dashboard helper to a logged-out visitor", () => {
    render(
      <MemoryRouter>
        <DashboardAiAssistant user={null} isLoggedIn={false} />
      </MemoryRouter>
    );

    expect(screen.queryByLabelText("AI assistant")).not.toBeInTheDocument();
  });
});
