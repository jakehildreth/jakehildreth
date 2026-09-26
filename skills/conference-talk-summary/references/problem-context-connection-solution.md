# Problem → Context → Connection → Solution: Worked Example

The four-move abstract structure, applied:

**Present the problem first.** The coding standards we originally developed no longer scale well across our different languages, and attempting to maintain those standards slows us down and creates animosity between our teams.

**Provide context.** Our coding standards were developed in a different time and place. Originally, our goal was primarily to make our code more readable, so our standards focused on naming conventions for variables and functions. Over time, we developed basic standards for modularization to try to address the code bloat we were experiencing in some critical sections of the code.

**Connect the context to the problem.** But back then, we all used a single coding language: C#. Today, the organization has evolved into a polyglot, with a large code base of C#, a large code base of JavaScript, and a growing code base of Python within the DevOps engineering teams.

**Offer a solution.** I suggest that it is time to rethink the purpose of coding standards, what value they bring to us, and how we achieve that value in our current environment. And rather than the top-down approach we used in the past, I would argue that a more collaborative approach would give everyone, and every team, a stake in the discussion.

## Why it works

- The problem lands in the first sentence — the reader feels the pain before hearing any history.
- Context explains how things got this way, so the problem reads as systemic, not as blame.
- The connection names the specific change that broke the old approach (one language → polyglot).
- The solution states what the talk argues and what the audience takes away.
