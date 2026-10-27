#!/usr/bin/env bash
# preToolUse hook: deny git commit / gh pr commands that add AI attribution.
# Always exits 0; command preToolUse hooks are fail-closed on crashes.

input="$(cat)"

if printf '%s' "$input" | grep -Eiq 'git[^"]{0,200}commit|gh[^"]{0,50}pr[^"]{0,50}(create|edit)' \
  && printf '%s' "$input" | grep -Eiq 'co-authored-by:[^"]{0,80}(copilot|claude|anthropic|openai|gpt|gemini|codex|cursor)|generated-by:|generated with'; then
  printf '%s\n' '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: Jake forbids AI attribution (Co-authored-by Copilot/Claude, Generated-By, Generated with) in commits and PRs. Re-run the same command without that line."}'
fi
exit 0
