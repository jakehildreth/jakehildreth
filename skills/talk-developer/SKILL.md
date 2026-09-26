---
name: talk-developer
description: Develop a conference talk from idea to outline using the Problem → Context → Connection → Solution structure. Use when the user wants to brainstorm, structure, outline, or build out a new talk or presentation, or flesh out a talk idea into sections.
---

# Talk Developer

Develops a talk from an idea into a full outline built on four moves: **Problem → Context → Connection → Solution**. The structure comes from Jake's reference material; it is the skeleton of every talk in this vault.

## The Four Moves

1. **Problem** — present the problem first. Make the audience feel it before they hear any history or mechanics. One to two sentences that land the pain.
2. **Context** — provide the context. The history and circumstances that produced the problem. Written so the problem reads as systemic, not as blame.
3. **Connection** — connect the context to the problem. Name the specific change that made the old approach break. This is the pivot of the talk — the moment the audience sees why what worked before fails now.
4. **Solution** — offer the solution. What to rethink, what to do differently, and how. State the argument, then what the audience takes away.

The worked example from the vault's reference material lives in `references/problem-context-connection-solution.md` — read it when the user is new to the structure or a move stalls.

## Process

1. **Interview before outlining.** Ask until you can fill one line per move: What is the problem? What produced it? What changed? What is the answer? Skip questions the source material already answers.
2. **Draft the skeleton.** One or two sentences per move, in the user's voice. Get approval on the skeleton before expanding — a broken move is cheap to fix here and expensive after expansion.
3. **Expand each move into outline sections.** Under each of the four headings, develop the points the talk will make, in delivery order. Problem and Connection are usually short; Context and Solution usually carry the demos and detail.
4. **Pressure-test.** For each move, one check:
   - Problem: would the target audience feel this in the first two minutes?
   - Context: is it only what the Connection needs? Cut history the talk never uses.
   - Connection: does it name a concrete change, not a vague trend?
   - Solution: can the audience act on it Monday morning?

## Conventions

- Outline file: `Outline.md` in the talk's folder, with `#` title and `## Problem` / `## Context` / `## Connection` / `## Solution` headings. This layout is what `/conference-talk-summary` consumes later.
- Talk folder: `<Conference> <Year>/<Talk Title>/` under the vault root.
- Short sentences, active voice, simple words, no emojis.

## Completion

Done when `Outline.md` holds all four sections expanded past the skeleton, and each section passes its pressure-test check.
