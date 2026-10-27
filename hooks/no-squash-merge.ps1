# preToolUse hook: deny squash/rebase PR merges. Jake merges PRs with a merge commit only.
# Always exits 0; command preToolUse hooks are fail-closed on crashes.

$raw = [Console]::In.ReadToEnd()

$deny = '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: Jake merges PRs with a merge commit only. Use gh pr merge --merge (never --squash or --rebase) and never git merge --squash."}'

$ghMergeWithoutMergeFlag = ($raw -match 'gh[^"]{0,50}pr[^"]{0,50}merge') -and ($raw -cnotmatch '--merge|\s-m(\s|"|$)')
$gitSquash = $raw -match 'git[^"]{0,50}merge[^"]{0,50}--squash'

if ($ghMergeWithoutMergeFlag -or $gitSquash) {
    Write-Output $deny
}
exit 0
