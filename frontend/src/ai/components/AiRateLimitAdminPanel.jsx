import { useEffect, useRef, useState } from "react";
import { Setting2 } from "iconsax-reactjs";
import { listAiRateLimits, resetAiRateLimit, updateAiRateLimit } from "../api/aiClient";
import { t } from "../i18n";

function isAdmin(role) {
  const normalized = String(role ?? "").toUpperCase();
  return normalized.includes("SUPER_ADMIN") || normalized.includes("ADMIN");
}

function withDraft(item) {
  return {
    ...item,
    rpmDraft: String(item.effectiveRequestsPerMinute ?? 0),
    budgetDraft: String(item.effectiveDailyTokenBudget ?? 0),
    pending: false,
  };
}

function userLabel(item) {
  return item.username || item.userSub;
}

export default function AiRateLimitAdminPanel({ role }) {
  const [open, setOpen] = useState(false);
  const [rows, setRows] = useState([]);
  const [status, setStatus] = useState("idle");
  const [error, setError] = useState(null);
  const loadControllerRef = useRef(null);

  useEffect(() => () => loadControllerRef.current?.abort(), []);

  const togglePanel = () => {
    if (open) {
      loadControllerRef.current?.abort();
      loadControllerRef.current = null;
      setOpen(false);
      return;
    }
    const controller = new AbortController();
    loadControllerRef.current = controller;
    setOpen(true);
    setStatus("loading");
    setError(null);
    listAiRateLimits({ signal: controller.signal })
      .then((items) => {
        if (controller.signal.aborted) return;
        setRows((Array.isArray(items) ? items : []).map(withDraft));
        setStatus("ready");
      })
      .catch((requestError) => {
        if (controller.signal.aborted || requestError?.code === "ERR_CANCELED") return;
        setError(requestError?.message || t("admin.rateLimits.error"));
        setStatus("error");
      })
      .finally(() => {
        if (loadControllerRef.current === controller) loadControllerRef.current = null;
      });
  };

  if (!isAdmin(role)) return null;

  const updateRow = (userSub, changes) => {
    setRows((current) => current.map((row) => (
      row.userSub === userSub ? { ...row, ...changes } : row
    )));
  };

  const save = async (row) => {
    const requestsPerMinute = Number(row.rpmDraft);
    const dailyTokenBudget = Number(row.budgetDraft);
    if (!Number.isInteger(requestsPerMinute) || requestsPerMinute < 0 || requestsPerMinute > 10000) {
      setError(t("admin.rateLimits.invalidRpm"));
      return;
    }
    if (!Number.isInteger(dailyTokenBudget) || dailyTokenBudget < 0 || dailyTokenBudget > 100000000) {
      setError(t("admin.rateLimits.invalidBudget"));
      return;
    }
    setError(null);
    updateRow(row.userSub, { pending: true });
    try {
      const saved = await updateAiRateLimit(row.userSub, { requestsPerMinute, dailyTokenBudget });
      updateRow(row.userSub, withDraft(saved));
    } catch (requestError) {
      updateRow(row.userSub, { pending: false });
      setError(requestError?.message || t("admin.rateLimits.error"));
    }
  };

  const reset = async (row) => {
    setError(null);
    updateRow(row.userSub, { pending: true });
    try {
      const saved = await resetAiRateLimit(row.userSub);
      updateRow(row.userSub, withDraft(saved));
    } catch (requestError) {
      updateRow(row.userSub, { pending: false });
      setError(requestError?.message || t("admin.rateLimits.error"));
    }
  };

  return (
    <section className="mb-4 overflow-hidden rounded-2xl border border-ink-100 bg-white dark:border-[#1C1C1C] dark:bg-[#0D0D0D]">
      <button
        type="button"
        onClick={togglePanel}
        aria-expanded={open}
        className="flex w-full items-center justify-between gap-3 px-4 py-3 text-left text-sm font-semibold text-ink-800 transition-colors hover:bg-ink-50 dark:text-white dark:hover:bg-[#151515]"
      >
        <span className="flex items-center gap-2">
          <Setting2 size={18} />
          {t("admin.rateLimits.title")}
        </span>
        <span className="text-xs font-normal text-ink-400">
          {open ? t("admin.rateLimits.close") : t("admin.rateLimits.open")}
        </span>
      </button>

      {open && (
        <div className="border-t border-ink-100 px-4 py-4 dark:border-[#1C1C1C]">
          <p className="mb-3 text-xs leading-relaxed text-ink-500 dark:text-ink-400">
            {t("admin.rateLimits.help")}
          </p>

          {status === "loading" && (
            <p role="status" className="py-3 text-sm text-ink-400">{t("admin.rateLimits.loading")}</p>
          )}

          {status === "ready" && rows.length === 0 && (
            <p className="py-3 text-sm text-ink-400">{t("admin.rateLimits.empty")}</p>
          )}

          {status === "ready" && rows.length > 0 && (
            <div className="max-h-64 space-y-2 overflow-y-auto pr-1">
              {rows.map((row) => (
                <div
                  key={row.userSub}
                  className="grid gap-3 rounded-xl border border-ink-100 p-3 dark:border-[#242424] lg:grid-cols-[minmax(0,1fr)_120px_170px_auto] lg:items-center"
                >
                  <div className="min-w-0">
                    <p className="truncate text-sm font-semibold text-ink-800 dark:text-white">
                      {userLabel(row)}
                    </p>
                    {row.username && (
                      <p className="truncate text-[10px] text-ink-400" title={row.userSub}>{row.userSub}</p>
                    )}
                  </div>
                  <label className="grid gap-1 text-[10px] font-medium text-ink-500">
                    <span>{t("admin.rateLimits.rpmLabel")}</span>
                    <input
                      type="number"
                      min="0"
                      max="10000"
                      value={row.rpmDraft}
                      disabled={row.pending}
                      aria-label={t("admin.rateLimits.inputLabel", { user: userLabel(row) })}
                      onChange={(event) => updateRow(row.userSub, { rpmDraft: event.target.value })}
                      className="w-full rounded-lg border border-ink-200 bg-transparent px-2 py-1.5 text-sm text-ink-900 outline-none focus:border-brand-500 dark:border-[#333] dark:text-white"
                    />
                  </label>
                  <label className="grid gap-1 text-[10px] font-medium text-ink-500">
                    <span>{t("admin.rateLimits.budgetLabel")}</span>
                    <input
                      type="number"
                      min="0"
                      max="100000000"
                      step="10000"
                      value={row.budgetDraft}
                      disabled={row.pending}
                      aria-label={t("admin.rateLimits.budgetInputLabel", { user: userLabel(row) })}
                      onChange={(event) => updateRow(row.userSub, { budgetDraft: event.target.value })}
                      className="w-full rounded-lg border border-ink-200 bg-transparent px-2 py-1.5 text-sm text-ink-900 outline-none focus:border-brand-500 dark:border-[#333] dark:text-white"
                    />
                    <span className="font-normal text-ink-400">
                      {t("admin.rateLimits.usage", {
                        used: Number(row.usedTokensToday ?? 0).toLocaleString(),
                        remaining: Number(row.remainingTokensToday ?? 0).toLocaleString(),
                      })}
                    </span>
                  </label>
                  <div className="flex gap-2">
                    <button
                      type="button"
                      disabled={row.pending}
                      onClick={() => save(row)}
                      className="rounded-lg bg-brand-600 px-3 py-1.5 text-xs font-semibold text-white hover:bg-brand-700 disabled:opacity-50"
                    >
                      {t("admin.rateLimits.save")}
                    </button>
                    {(row.requestsPerMinute !== null && row.requestsPerMinute !== undefined
                      || row.dailyTokenBudget !== null && row.dailyTokenBudget !== undefined) && (
                      <button
                        type="button"
                        disabled={row.pending}
                        onClick={() => reset(row)}
                        className="rounded-lg border border-ink-200 px-3 py-1.5 text-xs font-semibold text-ink-600 hover:bg-ink-50 disabled:opacity-50 dark:border-[#333] dark:text-ink-300 dark:hover:bg-[#171717]"
                      >
                        {t("admin.rateLimits.reset")}
                      </button>
                    )}
                  </div>
                </div>
              ))}
            </div>
          )}

          {error && <p role="alert" className="mt-3 text-xs text-danger-600">{error}</p>}
        </div>
      )}
    </section>
  );
}
