import { describe, it, expect, beforeEach } from "vitest";
import { render, screen, fireEvent } from "@testing-library/react";
import LanguageSwitcher from "../LanguageSwitcher";
import { getAiLocale } from "../../i18n";

describe("LanguageSwitcher", () => {
  beforeEach(() => {
    localStorage.clear();
  });

  it("highlights the current locale and re-renders on switch", () => {
    render(<LanguageSwitcher />);

    const ruButton = screen.getByRole("button", { name: "RU" });
    const enButton = screen.getByRole("button", { name: "EN" });
    expect(ruButton).toHaveAttribute("aria-pressed", "true");
    expect(enButton).toHaveAttribute("aria-pressed", "false");

    fireEvent.click(enButton);

    expect(getAiLocale()).toBe("en");
    expect(enButton).toHaveAttribute("aria-pressed", "true");
    expect(ruButton).toHaveAttribute("aria-pressed", "false");
  });

  it("persists the switch across independently-mounted instances", () => {
    const { unmount } = render(<LanguageSwitcher />);
    fireEvent.click(screen.getByRole("button", { name: "UZ" }));
    unmount();

    render(<LanguageSwitcher />);
    expect(screen.getByRole("button", { name: "UZ" })).toHaveAttribute("aria-pressed", "true");
  });
});
