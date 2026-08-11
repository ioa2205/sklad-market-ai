package org.example.ai.guardrail;

import org.example.entity.UsageLedger;
import org.example.repository.UsageLedgerRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

/** Enforces {@code AI_DAILY_TOKEN_BUDGET} against the persisted {@code usage_ledger}. */
@Component
public class TokenBudgetGuard {

    private final UsageLedgerRepository usageLedgerRepository;
    private final long dailyBudget;

    public TokenBudgetGuard(
            UsageLedgerRepository usageLedgerRepository,
            @Value("${ai.limits.daily-token-budget:200000}") long dailyBudget) {
        this.usageLedgerRepository = usageLedgerRepository;
        this.dailyBudget = dailyBudget;
    }

    public boolean hasRemainingBudget(String userSub) {
        return remaining(userSub) > 0;
    }

    public long remaining(String userSub) {
        long used = usedToday(userSub);
        return Math.max(0L, dailyBudget - used);
    }

    private long usedToday(String userSub) {
        return usageLedgerRepository
                .findByUserSubAndDay(userSub, LocalDate.now())
                .map(entry -> entry.getTokensIn() + entry.getTokensOut())
                .orElse(0L);
    }
}
