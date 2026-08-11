import { useEffect, useRef } from "react";
import { AnimatePresence } from "framer-motion";
import MessageBubble from "./MessageBubble";

export default function ChatMessages({
  messages,
  onConfirmDraft,
  onCancelDraft,
  onPublishIntent,
  onCloseIntent,
}) {
  const bottomRef = useRef(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView?.({ behavior: "smooth", block: "end" });
  }, [messages]);

  return (
    <div className="flex flex-col gap-3 py-4">
      <AnimatePresence>
        {messages.map((m) => (
          <MessageBubble
            key={m.id}
            message={m}
            onConfirmDraft={onConfirmDraft}
            onCancelDraft={onCancelDraft}
            onPublishIntent={onPublishIntent}
            onCloseIntent={onCloseIntent}
          />
        ))}
      </AnimatePresence>
      <div ref={bottomRef} />
    </div>
  );
}
