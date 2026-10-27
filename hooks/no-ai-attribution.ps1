# preToolUse hook: deny git commit / gh pr commands that add AI attribution.
# Always exits 0; command preToolUse hooks are fail-closed on crashes.

$raw = [Console]::In.ReadToEnd()

$isCommitOrPr = $raw -match 'git[^"]{0,200}commit|gh[^"]{0,50}pr[^"]{0,50}(create|edit)'
$hasAttribution = $raw -match 'co-authored-by:[^"]{0,80}(copilot|claude|anthropic|openai|gpt|gemini|codex|cursor)|generated-by:|generated with'

if ($isCommitOrPr -and $hasAttribution) {
    Write-Output '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: Jake forbids AI attribution (Co-authored-by Copilot/Claude, Generated-By, Generated with) in commits and PRs. Re-run the same command without that line."}'
}
exit 0
