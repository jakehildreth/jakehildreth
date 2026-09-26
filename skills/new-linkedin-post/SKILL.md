---
name: new-linkedin-post
description: Draft a LinkedIn post in Jake Hildreth's voice from source material — an idea, a full blog post, or a stupid meme. Use when Jake wants to write, draft, or polish a LinkedIn post, or promote something (blog post, talk, tool release, event) on LinkedIn.
---

# New LinkedIn Post

Write a LinkedIn post that is unmistakably Jake. First read `skill://writing-voice` — every rule there applies. This skill adds the LinkedIn-specific layer: what the platform does to the voice, and the failure modes to avoid.

## Step 1 — Get source material

Ask for the source if not already provided. Accept any of:

- **An idea** — a sentence or two. Build the post from scratch; ask one clarifying question max if the angle is unclear.
- **A full blog post** — a file path or URL. Read it. The post's job is distribution: mine it for the payload (see below).
- **A stupid meme** — an image, a screenshot, a joke. The post is the joke plus one line of substance; keep it tiny.

If the source is a blog post, also ask: is the post published (link available) or a draft (no link yet)? A post with no link to share must stand entirely alone.

## Step 2 — Find the payload

The payload is the single best moment of the source material: the finding, the number, the punchline. It goes IN the post body. This is the entire point of the skill.

Jake's known failure mode, stated plainly so it gets caught: **gesturing at the content vaguely and linking out.** "So, I wrote about it: [link]" as the whole pitch is a distribution failure. The reader scrolling past has never heard of Locksmith and owes no clicks. The post must deliver one complete insight on its own — written as if the link might 404 — plus one joke, plus a reason to click anyway.

How to find the payload by source type:

- **Blog post:** steal the single best sentence nearly verbatim. Candidates: the finding stated at full strength ("An attacker with physical access to your Mac can take control of the active remote user's session without authentication"), the one number or artifact ("a single registry value turns PKINIT from fail-closed to fail-open", "ESC1 through ESC16", "1666"), or the running gag's best line ("Take the time to address each layer, and you'll get to keep your pony").
- **Idea:** state the claim at full strength in one sentence. No winking qualifier. If it can't survive one sentence, the idea isn't ready — say so and ask what the actual point is.
- **Meme:** the payload IS the joke. Add at most one line of substance underneath.

Jake's headings are pre-written hooks. "Babby's First macOS Security Report", "authentication certificates that cannot be killed!" — use them as line one verbatim when they fit.

## Step 3 — Structure the post

Order matters:

1. **Payload first.** Not the process ("In late April, I noticed…"), not the context — the finding. Line one must work as a standalone hook in the feed preview.
2. **Vendor absurdity / stakes second**, delivered deadpan. The 🤷 goes here, after the reader knows what's at stake — never before.
3. **Link or CTA last.** If a blog link exists, the pivot is short: "So, I wrote about it:" works ONLY after the payload already landed.

Structure by source type:

- **Blog post promo:** payload (1–3 sentences) → absurdity or stakes (1–2 sentences) → link line. Total: under 150 words.
- **Idea:** hook → 3–8 short paragraphs, one idea each, heavy whitespace (LinkedIn's house style already matches Jake's) → CTA.
- **Meme:** joke → one line of substance → done. Often no CTA at all.
- **Event/community promo:** one punchy line of mock-formal hyperbole ("If you're in Ohio and regularly use PowerShell, you are legally obligated to attend this user group.") → details → done. NOTE: reshares with one-liners do work for other people's brands, not Jake's. Original posts only, unless Jake explicitly asks for a reshare caption.

## Hard rules

These come from the assessment of what's actually broken in Jake's LinkedIn. Enforce them:

1. **Never "So, I wrote about it: [link]" as the pitch.** That line is a fine pivot, never the payload.
2. **No winking qualifier on the finding.** On the blog Jake states things at full strength ("authentication certificates that cannot be killed!"). Do the same here. The refusal to do this is the conviction problem; don't reproduce it.
3. **Self-deprecation: confident, not reflexive.** "tell me how much I suck" and "mock my coding" work on the blog where readers know him. On LinkedIn, to strangers, reflexive self-deprecation reads as low-confidence. Keep exactly ONE self-deprecating beat per post, and make it the joke kind ("I'm ostensibly an expert (🤮) in this stuff"), not the apology kind.
4. **CTA stays Jake.** "email me @ jake@dotdot.horse", "tell me how it sucks" — fine. "Thoughts?" — banned, corporate register, flagged in the voice skill.
5. **One emoji or two, as punctuation** — 🤷 😭 😎. LinkedIn already tolerates this; Jake's usage is correct and shouldn't be inflated for the platform.
6. **Numbers beat adjectives.** Always include the concrete artifact if one exists.

## Output

Return the post text ready to paste, then one line each: the payload sentence used, the joke used, and the CTA used — so Jake can swap any of the three without a rewrite. If the source material has no payload worth stating at full strength, say that instead of drafting around the gap.
