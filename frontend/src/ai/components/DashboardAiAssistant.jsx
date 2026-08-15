import { motion } from "framer-motion";
import { ArrowRight2 } from "iconsax-reactjs";
import { useTranslation } from "react-i18next";
import { Link, useNavigate } from "react-router-dom";
import { isAiAgentEnabled } from "../flag";

function SparkleMark() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" className="h-5 w-5" fill="none">
      <path d="M12 2.75c.55 4.2 2.85 6.5 7.25 7.25-4.4.75-6.7 3.05-7.25 7.25C11.45 13.05 9.15 10.75 4.75 10 9.15 9.25 11.45 6.95 12 2.75Z" fill="currentColor" />
      <path d="M18.25 15.25c.25 1.9 1.35 3 3.25 3.25-1.9.25-3 1.35-3.25 3.25-.25-1.9-1.35-3-3.25-3.25 1.9-.25 3-1.35 3.25-3.25Z" fill="currentColor" opacity=".65" />
    </svg>
  );
}

function preferredName(user) {
  const value = user?.firstName || user?.name || user?.username;
  return String(value || "").trim().split(/\s+/)[0];
}

export default function DashboardAiAssistant({ user, isLoggedIn }) {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const suggestions = t("home.aiAssistant.suggestions", { returnObjects: true });

  if (!isAiAgentEnabled() || !isLoggedIn) return null;

  const openWithPrompt = (prompt) => {
    const cleanPrompt = String(prompt || "").trim();
    if (!cleanPrompt) {
      navigate("/ai-agent");
      return;
    }
    navigate(`/ai-agent?prompt=${encodeURIComponent(cleanPrompt)}`);
  };

  return (
    <motion.section
      initial={{ opacity: 0, y: 8 }}
      animate={{ opacity: 1, y: 0 }}
      aria-label={t("home.aiAssistant.badge")}
      className="relative mb-6 overflow-hidden rounded-2xl border border-brand-200/80 bg-gradient-to-br from-white via-brand-50/70 to-[#EEF3FF] p-4 shadow-card dark:border-brand-500/20 dark:from-[#0D0D0D] dark:via-[#10172A] dark:to-[#111827] sm:p-5"
    >
      <div className="pointer-events-none absolute -right-16 -top-20 h-44 w-44 rounded-full bg-brand-300/20 blur-3xl dark:bg-brand-500/10" />
      <div className="relative flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
        <div className="min-w-0">
          <div className="mb-2 flex items-center gap-2">
            <span className="inline-flex h-9 w-9 items-center justify-center rounded-xl bg-brand-600 text-white shadow-sm">
              <SparkleMark />
            </span>
            <span className="rounded-full border border-brand-200 bg-white/80 px-2.5 py-1 text-[11px] font-bold uppercase tracking-wide text-brand-700 dark:border-brand-500/25 dark:bg-white/5 dark:text-brand-300">
              {t("home.aiAssistant.badge")}
            </span>
          </div>
          <h2 className="font-display text-lg font-bold text-ink-900 dark:text-white sm:text-xl">
            {preferredName(user)
              ? t("home.aiAssistant.greeting", { name: preferredName(user) })
              : t("home.aiAssistant.title")}
          </h2>
          <p className="mt-1 max-w-2xl text-sm leading-relaxed text-ink-500 dark:text-ink-400">
            {t("home.aiAssistant.subtitle")}
          </p>
        </div>

        <div className="flex min-w-0 flex-col gap-2 lg:max-w-[46%] lg:items-end">
          <div className="flex flex-wrap gap-2 lg:justify-end">
            {(Array.isArray(suggestions) ? suggestions : []).map((suggestion) => (
              <button
                key={suggestion}
                type="button"
                onClick={() => openWithPrompt(suggestion)}
                className="rounded-full border border-brand-200 bg-white/85 px-3 py-2 text-xs font-semibold text-ink-700 transition-colors hover:border-brand-400 hover:text-brand-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-400 dark:border-brand-500/20 dark:bg-white/5 dark:text-ink-200 dark:hover:border-brand-400 dark:hover:text-brand-300"
              >
                {suggestion}
              </button>
            ))}
          </div>
          <Link
            to="/ai-agent"
            className="inline-flex items-center gap-1.5 self-start text-xs font-semibold text-brand-700 hover:text-brand-800 lg:self-auto dark:text-brand-300 dark:hover:text-brand-200"
          >
            {t("home.aiAssistant.open")}
            <ArrowRight2 size={14} />
          </Link>
        </div>
      </div>
    </motion.section>
  );
}
