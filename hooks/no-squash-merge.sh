#!/usr/bin/env bash
# preToolUse hook: deny squash/rebase PR merges. Jake merges PRs with a merge commit only.
# Always exits 0; command preToolUse hooks are fail-closed on crashes.

input="$(cat)"

deny() {
  printf '%s\n' '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: Jake merges PRs with a merge commit only. Use gh pr merge --merge (never --squash or --rebase) and never git merge --squash."}'
  exit 0
}

if printf '%s' "$input" | grep -Eiq 'gh[^"]{0,50}pr[^"]{0,50}merge'; then
  printf '%s' "$input" | grep -Eq -- '--merge|[ ]-m([ "]|$)' || deny
fi

printf '%s' "$input" | grep -Eiq 'git[^"]{0,50}merge[^"]{0,50}--squash' && deny
exit 0
