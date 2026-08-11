import { motion } from "framer-motion";
import Markdown from "../lib/markdown";
import ToolStatusChip from "./ToolStatusChip";
import DraftLeadCard from "./DraftLeadCard";
import StructuredResults from "./StructuredResults";

export default function MessageBubble({
  message,
  onConfirmDraft,
  onCancelDraft,
  onPublishIntent,
  onCloseIntent,
}) {
  const isUser = message.role === "user";
  const hasResults = !isUser && message.resultSets?.length > 0;

  return (
    <motion.div
      initial={{ opacity: 0, y: 8 }}
      animate={{ opacity: 1, y: 0 }}
      className={`${hasResults ? "max-w-[98%] sm:max-w-[95%]" : "max-w-[85%] sm:max-w-[80%]"} px-4 py-3 rounded-2xl text-sm leading-relaxed ${
        isUser
          ? "bg-brand-600 text-white self-end"
          : "bg-white dark:bg-[#0D0D0D] border border-ink-100 dark:border-[#1C1C1C] text-ink-700 dark:text-ink-200 self-start"
      }`}
    >
      {!isUser && message.toolEvents?.length > 0 && (
        <div className="flex flex-wrap gap-1.5 mb-2">
          {message.toolEvents.map((te, i) => (
            <ToolStatusChip key={i} tool={te.tool} status={te.status} summary={te.summary} />
          ))}
        </div>
      )}

      {isUser ? (
        <span className="whitespace-pre-wrap break-words">{message.text}</span>
      ) : (
        <Markdown text={message.text} />
      )}

      {!isUser && message.draft && (
        <DraftLeadCard
          draft={message.draft}
          onConfirm={(overrides) => onConfirmDraft?.(message.id, message.draft.draftId, overrides)}
          onCancel={() => onCancelDraft?.(message.id, message.draft.draftId)}
        />
      )}

      {hasResults && (
        <StructuredResults
          resultSets={message.resultSets}
          onPublishIntent={(resultSetIndex, intentId) =>
            onPublishIntent?.(message.id, resultSetIndex, intentId)
          }
          onCloseIntent={(resultSetIndex, intentId) =>
            onCloseIntent?.(message.id, resultSetIndex, intentId)
          }
        />
      )}

      {message.streaming && !message.text && (
        <span className="inline-flex gap-1 items-center text-ink-400" aria-label="typing">
          <span className="w-1.5 h-1.5 rounded-full bg-current animate-bounce [animation-delay:-0.3s]" />
          <span className="w-1.5 h-1.5 rounded-full bg-current animate-bounce [animation-delay:-0.15s]" />
          <span className="w-1.5 h-1.5 rounded-full bg-current animate-bounce" />
        </span>
      )}
    </motion.div>
  );
}
