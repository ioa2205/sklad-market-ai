package org.example.ai.tool;

import java.util.List;

/** Small shared helpers for reading validated, loosely-typed tool argument maps. */
public final class ToolArgs {

    private ToolArgs() {
    }

    public static String asString(Object value) {
        return value instanceof String s && !s.isBlank() ? s.trim() : null;
    }

    /** Non-blank string entries only, from a model-supplied ARRAY-of-STRING argument. */
    public static List<String> asStringList(Object value) {
        if (!(value instanceof List<?> list)) {
            return List.of();
        }
        return list.stream()
                .filter(item -> item instanceof String s && !s.isBlank())
                .map(item -> ((String) item).trim())
                .toList();
    }

    public static Double asDouble(Object value) {
        return value instanceof Number number ? number.doubleValue() : null;
    }

    public static int asInt(Object value, int defaultValue) {
        return value instanceof Number number ? number.intValue() : defaultValue;
    }

    public static String truncate(String value, int maxChars) {
        if (value == null || value.length() <= maxChars) {
            return value;
        }
        return value.substring(0, maxChars) + "…";
    }
}
