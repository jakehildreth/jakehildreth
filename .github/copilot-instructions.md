---
applyTo: '**/*'
description: 'Technical standards and preferences for Jake Hildreth projects'
---

# Jake Hildreth - Interaction Guidelines

1. Do not blindly agree with everything Jake says. Be firm but kind if Jake is doing something against best practices or otherwise insecurely.
2. Keep reponses short and tightly focused. Jake likes to interact with agents to learn and understand what they are doing - not just blindly accept their actions.
3. After every response, display the remaining context available as a percentage with no decimal places. Example: `Context Remaining: 42%`
4. When the remaining context gets below 20%, begin adding ⚠️ to the beginning of the context status message. Example: `⚠️ Context Remaining: 18%`
5. When the remaining context gets below 10%, begin adding ‼️ to the beginning of the context status message. Example: `‼️ Context Remaining: 4%`
6. Summarize the conversation whenever I ask, even if there's substantial context remaining.
7. DO NOT SUMMARIZE WITHOUT MY APPROVAL.
8. After every summarization, re-read https://raw.githubusercontent.com/jakehildreth/jakehildreth/refs/heads/main/.github/copilot-instructions.md and say "I've re-read your instructions, let's roll."

# Jake Hildreth - Development Standards

## Quick Reference

When assisting Jake, remember:

- [x] Use CalVer (YYYY.MM.DD) - see Versioning section
- [x] No emojis - see Code Style and Documentation Standards sections
- [x] Follow PowerShell standards - see PowerShell Specific section
- [x] Conventional commits with detailed bullets - see Git Workflow section
- [x] Cross-platform support (Windows/Linux/macOS)
- [x] Concise, practical documentation
- [x] Security and identity focus

## Development Preferences & Standards

### Versioning
- **Uses CalVer (Calendar Versioning):** YYYY.MM.DD format (e.g., 2025.10.24)
- **Does NOT use SemVer** (Semantic Versioning)
- Consistent across all projects (Locksmith, BlueTuxedo, PowerPUG!, Stepper)

### Code Style
- Follow instructions files provided in the project's .github/instructions folder/
- **No emojis** in code. Prefer simple visual indicators like [x], [+], [!], [i], [?], [>]

### Documentation Standards
- **No emojis** in documentation
- **Clean, concise** documentation style
- Focus on practical examples over verbose explanations
- READMEs should focus on: installation, quick start, examples
- Every README for Jake's project should end with the following sections:

```markdown
## License

MIT License w/Commons Clause - see [LICENSE](..\LICENSE) file for details.

---

Made with 💜 by [Jake Hildreth](https://jakehildreth.com)
```

### PowerShell Specific

#### General Standards
- Follow awesome-copilot PowerShell instructions: https://raw.githubusercontent.com/github/awesome-copilot/refs/heads/main/instructions/powershell.instructions.md
- Follow PowerShell Community Guidelines: https://github.com/PoshCode/PowerShellPracticeAndStyle
- When there is a conflict between guidance documents, prefer project-level instructions first.
- Tend toward verbose and descriptive variable names
- Follows Microsoft PowerShell best practices
- Uses approved verbs (Get-Verb compliance)
- Comment-based help for all functions
- Cross-platform compatibility (Windows, Linux, macOS)
- PowerShell 5.1+ support first, PowerShell Core support next

#### Naming and Style
- **Function Names:** Verb-Noun format using approved verbs, PascalCase, singular nouns
- **Parameters:** PascalCase, descriptive names, singular form unless always multiple
- **Variables:** PascalCase for public, camelCase for private, meaningful names
- **No Aliases:** Use full cmdlet names in scripts (Get-ChildItem not gci, Where-Object not ?, ForEach-Object not %)

#### Code Formatting
- **OTBS (One True Brace Style):**
  - Opening braces on same line as statement: `if ($condition) {`, `function Test-Thing {`
  - Closing braces on new line
  - `else`, `elseif`, `catch`, and `finally` keywords must be on same line as closing brace: `} else {`, `} elseif {`, `} catch {`, `} finally {`
  - Never put these keywords on their own line after a closing brace
- **Indentation:** 4 spaces (not tabs)
- **Line Breaks:** After pipeline operators for readability
- **Splatting:** Use splatting for multiple parameters instead of backticks
- **Backticks:** Avoid for line continuation; prefer splatting or natural break points
- **Quotes:** Single quotes for literals, double quotes when variables need expansion
- **Operators:** Spaces around operators (=, -eq, -ne, etc.)

#### Parameter Design
- **Standard Names:** Use common parameter names (Path, Name, Force, Confirm, WhatIf)
- **Validation:** ValidateNotNullOrEmpty, ValidateSet (enables tab completion), ValidateScript for complex validation
- **Switch Parameters:** Use [switch] for boolean flags (default to $false)
- **Pipeline Support:** 
  - Use ValueFromPipeline for direct object input
  - Use ValueFromPipelineByPropertyName for property mapping
  - Implement Begin/Process/End blocks for pipeline handling
  - Process one object at a time in process block (streaming, not collecting)

#### Output Patterns
- **Return Objects Not Text:** Return well-known .NET objects preferred, PSCustomObjects next, Hashtables and primitives last
- **No Write-Host for Data:** Only use Write-Host for UI elements, not data output
- **PassThru Pattern:** Default to no output for action cmdlets; implement -PassThru switch to return modified/created objects
- **Pipeline Streaming:** Output one object at a time; avoid collecting large arrays

#### Error Handling
- **Advanced Functions:** In functions with [CmdletBinding()]:
  - Prefer `$PSCmdlet.WriteError()` over `Write-Error`
  - Prefer `$PSCmdlet.ThrowTerminatingError()` over `throw`
  - Construct proper ErrorRecord objects with category, target, and exception details
- **Try/Catch:** Use try/catch blocks for error management
- **ShouldProcess:** 
  - Use `[CmdletBinding(SupportsShouldProcess = $true)]` for system-changing operations
  - Set ConfirmImpact appropriately (Low/Medium/High)
  - Call `$PSCmdlet.ShouldProcess()` before making changes
  - Use ShouldContinue() for additional confirmations when needed

#### Message Streams
- **Write-Verbose:** Operational details (available with -Verbose)
- **Write-Warning:** Warning conditions
- **Write-Error:** Non-terminating errors
- **throw:** Terminating errors (or $PSCmdlet.ThrowTerminatingError in advanced functions)
- **Write-Host:** Only for user interface text, never for data

#### Comment-Based Help
Include for all public functions:
- `.SYNOPSIS` - Brief description
- `.DESCRIPTION` - Detailed explanation
- `.PARAMETER` - Each parameter described
- `.EXAMPLE` - Practical usage examples (multiple examples preferred)
- `.OUTPUTS` - Type of output returned
- `.NOTES` - Additional information

### Git Workflow

Commit messages should be clear and descriptive using conventional commits format: `type(scope): message`

**Types:** feat, fix, docs, style, refactor, test, chore

**Examples:**
- `feat(detection): add ESC13 detection`
- `refactor(error-handling): use $PSCmdlet.WriteError in Get-AdcsObjects`
- `fix(validation): add null check for module version in Test-IsLatestVersion`

**Never use vague messages:**
- ❌ Bad: `refactor: update functions for improvements`
- ❌ Bad: `chore: update error handling`
- ✅ Good: `refactor(error-handling): replace Write-Error with $PSCmdlet.WriteError in 8 functions`
- ✅ Good: `fix(pipeline): add ValueFromPipeline support to Test-IsModuleAvailable`

**All commits must include detailed bullet points:**
1. What files were modified/created
2. What functionality was added/changed
3. What the code detects/does
4. Additional context about the implementation

**Example:**
```
feat(detection): add ESC11 detection for CA RPC encryption requirement

- Add ESC11 definition to ESCDefinitions.psd1
- Integrate ESC11 scan into Invoke-Locksmith2.ps1
- Detects CAs with IF_ENFORCEENCRYPTICERTREQUEST flag disabled
- Identifies NTLM relay attack vulnerability
- Provides fix/revert scripts using certutil
```

Keep commits atomic and focused.

## Work Environment

**Operating System:** Windows/macOS  
**Shell:** PowerShell (pwsh.exe/pwsh) and Windows PowerShell (powershell.exe)

## Domain Context

**Primary Focus:** Active Directory Certificate Services (AD CS) security, PKI, Identity and Access Management

**Major Projects:**
- **Locksmith** - Find and fix AD CS misconfigurations (ESC1-ESC16)
- **BlueTuxedo** - Active Directory-Integrated DNS auditing and remediation
- **PowerPUG!** - Protected Users Group adoption tooling
- **Stepper** - Resumable, step-by-step automation scripts
- **ESCalator** - AD CS escalation chain research tool

---

## LICENSE Guidance

Every project created by Jake should follow this format:

```
"Commons Clause" License Condition v1.0

The Software is provided to you by the Licensor under the License, as defined below, subject to the following condition.

Without limiting other conditions in the License, the grant of rights under the License will not include, and the License does not grant to you, the right to Sell the Software.

For purposes of the foregoing, "Sell" means practicing any or all of the rights granted to you under the License to provide to third parties, for a fee or other consideration (including without limitation fees for hosting or consulting/support services related to the Software), a product or service whose value derives, entirely or substantially, from the functionality of the Software. Any license notice or attribution required by the License must also include this Commons Clause License Condition notice.

Software: [PROJECT NAME HERE]
License: MIT
Licensor: Jake Hildreth, Gilmour Technologies Ltd

---

MIT License

Copyright (c) 2026 Jake Hildreth, Gilmour Technologies Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

*This context file helps GitHub Copilot provide personalized assistance aligned with Jake's preferences, standards, and working style.*
