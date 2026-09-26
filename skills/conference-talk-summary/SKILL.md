---
name: conference-talk-summary
description: Convert a conference talk outline into a submission-ready summary (title, abstract, notes) for a CFP. Use when the user points at a talk outline or notes and asks for a talk summary, abstract, session description, or CFP submission text.
---

# Conference Talk Summary

Takes a talk outline and produces the text fields a CFP form needs.

## Venue Guide

Ask whether a submission guide exists for the target conference — a URL, a local file, or the CFP page itself. If one is available, read it first and let it override the defaults below: field lengths, tense, tone, required sections, blind-review rules, anything it specifies. If none is available, state that and proceed on the CodeMash-style defaults in this skill.

## Input

Read the outline the user names. If the outline uses the Problem / Context / Connection / Solution structure, each section maps directly onto the abstract. If not, extract those four moves from whatever structure exists before drafting.

## Output

Produce, in order:

1. **Title** — reuse the outline's title if it is catchy AND descriptive on its own. Otherwise propose a better one and say why.
2. **Abstract** — one to two paragraphs, present tense, following the four moves below.
3. **Notes to the content team** — background, prior deliveries, feedback. Only if the source material or conversation supplies them; otherwise list what the user should gather.

## The Abstract

Compress the outline into the four moves:

1. **Problem** — first. One to two sentences. Make the reader feel it.
2. **Context** — the circumstances that produced the problem.
3. **Connection** — why it matters now, and who it affects. Name the audience here ("If you run AD CS or cross-platform Kerberos…").
4. **Solution** — what the talk covers, as specific items, and what attendees leave with ("You'll leave with…").

Rules (all overridable by the venue guide):

- **Present tense** throughout. "I walk through", not "I will walk through".
- **Blind-safe.** No name, no links that identify the author, no employer, no tool names the author created. CodeMash's first round is blind; an identity leak is a first-round elimination.
- **Concise.** Hook first, value propositions in the body, closer that makes the reader want the seat. Two paragraphs maximum — the abstract is the tasting spoon, not the pot.
- **Complete.** Audience, specific coverage items, and takeaway must all three appear. Short veteran-style abstracts score poorly in a blind round.
- **Coherent.** Short sentences, active voice, simple words, no emojis. Fix typos from the source outline silently; flag anything that changes meaning.

Worked example of the four moves lives in `references/problem-context-connection-solution.md` — load it if the draft stalls.

## Scope check

Before finalizing, check the talk itself against venue fit, and flag violations rather than silently narrowing the talk:

- Concept over vendor technology ("durable messaging" with Azure/SQS examples, not "Introduction to Azure Queues").
- Specific enough for the slot — one problem, not a survey.
- No product pitch.
- Content fills the slot with 5–10 minutes for Q&A.

## Completion

Done when title + abstract + notes (or a gather-list for notes) are written into the talk's folder as `Abstract.md`, or presented inline if the user prefers. Every rule above — plus anything the venue guide adds — checked against the final text.
