import { AI_LOCALES, setAiLocale, useAiLocale, t } from "../i18n";

export default function LanguageSwitcher() {
  const locale = useAiLocale();

  return (
    <div
      className="inline-flex items-center gap-1 bg-ink-100 dark:bg-[#1C1C1C] rounded-full p-1"
      role="group"
      aria-label={t("lang.label")}
    >
      {AI_LOCALES.map((l) => (
        <button
          key={l}
          type="button"
          onClick={() => setAiLocale(l)}
          aria-pressed={locale === l}
          className={`px-2.5 py-1 text-xs font-semibold rounded-full transition-colors ${
            locale === l
              ? "bg-white dark:bg-[#0D0D0D] text-brand-600 dark:text-brand-400 shadow-card"
              : "text-ink-500 dark:text-ink-400 hover:text-ink-700 dark:hover:text-ink-200"
          }`}
        >
          {t(`lang.${l}`)}
        </button>
      ))}
    </div>
  );
}
