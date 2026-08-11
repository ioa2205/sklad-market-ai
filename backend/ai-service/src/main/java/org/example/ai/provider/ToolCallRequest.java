package org.example.ai.provider;

import java.util.Map;

/** A single model-requested tool invocation, vendor-neutral. */
public record ToolCallRequest(String callId, String name, Map<String, Object> args) {
}
