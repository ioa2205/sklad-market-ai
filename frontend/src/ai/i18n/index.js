import { useSyncExternalStore } from "react";
import ru from "./ru";
import uz from "./uz";
import en from "./en";

const DICTS = { ru, uz, en };
export const AI_LOCALES = ["ru", "uz", "en"];
const DEFAULT_LOCALE = "ru";
const STORAGE_KEY = "skladx_ai_lang";
const ACCEPT_LANGUAGE = { ru: "RU", uz: "UZ", en: "EN" };

const listeners = new Set();

export function getAiLocale() {
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored && DICTS[stored]) return stored;
  } catch {
    // localStorage unavailable — fall back to default
  }
  return DEFAULT_LOCALE;
}

export function setAiLocale(locale) {
  if (!DICTS[locale]) return;
  try {
    localStorage.setItem(STORAGE_KEY, locale);
  } catch {
    // ignore — locale just won't persist across reloads
  }
  listeners.forEach((notify) => notify());
}

export function useAiLocale() {
  return useSyncExternalStore(
    (onStoreChange) => {
      listeners.add(onStoreChange);
      return () => listeners.delete(onStoreChange);
    },
    getAiLocale
  );
}

export function aiLocaleToAcceptLanguage(locale = getAiLocale()) {
  return ACCEPT_LANGUAGE[locale] ?? ACCEPT_LANGUAGE[DEFAULT_LOCALE];
}

function resolvePath(dict, path) {
  return path.split(".").reduce((acc, part) => (acc == null ? acc : acc[part]), dict);
}

export function t(key, params) {
  const locale = getAiLocale();
  let value = resolvePath(DICTS[locale], key);
  if (value === undefined) value = resolvePath(DICTS[DEFAULT_LOCALE], key);
  if (value === undefined) return key;
  if (typeof value === "string" && params) {
    return Object.keys(params).reduce(
      (str, p) => str.replaceAll(`{${p}}`, String(params[p])),
      value
    );
  }
  return value;
}

export { DICTS as __dicts };
