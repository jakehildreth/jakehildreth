---
applyTo: '**/*'
description: 'Context about Jake Hildreth for personalized assistance across all projects'
---

# About Jake Hildreth

## Professional Identity

**Name:** Jake Hildreth  
**Current Role:** Principal Security Consultant at Semperis  
**Recognition:** Microsoft MVP (PowerShell & Identity and Access) - 2025  
**Experience:** 25 years in IT  
**Self-Description:** "Recovering Sysadmin" who builds tools to make identity security "suck a little less"

## Areas of Expertise

- **Primary Focus:** Active Directory Certificate Services (AD CS) security
- **Core Skills:**
  - Active Directory security and hardening
  - Public Key Infrastructure (PKI)
  - Identity and Access Management
  - PowerShell module development
  - Kerberos authentication
  - DNS security (Active Directory-Integrated DNS)
  - Protected Users Group implementation

## Professional Certifications

- **CISSP** (Certified Information Systems Security Professional) - Expires Jan 31, 2028
- **CompTIA Security+ ce** - Expires May 28, 2027
- **CompTIA A+** - Issued Feb 21, 2003 (foundation cert from early career)
- **Microsoft MVP** - Issued in 2025

## Open Source Projects

### Major Projects (in order of popularity)

1. **Locksmith** (1,400+ stars)
   - Purpose: Find and fix AD CS misconfigurations
   - Scans: ESC1-ESC16 vulnerabilities
   - Available on PowerShell Gallery
   - 16 contributors
   - Version format: CalVer (e.g., v2025.9.8)

2. **BlueTuxedo** (141 stars)
   - Purpose: Active Directory-Integrated DNS auditing and remediation
   - Features: Get/Test/Repair pattern for DNS issues
   - Finds dangling SPNs, tombstoned DNS records
   - Version format: CalVer (e.g., v2024.10)

3. **PowerPUG!** (128 stars)
   - Purpose: Help admins safely adopt the Protected Users Group
   - Scans DC event logs for compatibility issues
   - Version format: CalVer (e.g., v2024.11.11)

4. **Stepper**
   - Purpose: Resumable, step-by-step automation scripts with state persistence
   - Cross-platform support (Windows, Linux, macOS)
   - Version format: CalVer (YYYY.MM.DD format: 2025.10.24)

5. **ESCalator**
   - Purpose: Original research tool for AD CS escalation chains
   - Links multiple ESC vulnerabilities to show compound attack paths
   - Related project: "Stairs" (defanged demo version)

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
- **Keep a Changelog** format for CHANGELOG.md
- Focus on practical examples over verbose explanations
- READMEs should focus on: installation, quick start, examples

### PowerShell Specific

#### General Standards
- Follow awesome-copilot PowerShell instructions: https://raw.githubusercontent.com/github/awesome-copilot/refs/heads/main/instructions/powershell.instructions.md
- Follow PowerShell Community Guidelines: https://github.com/PoshCode/PowerShellPracticeAndStyle
- When there is a conflict between guidance documents, prefer project-level instructions first.
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
- **OTBS (One True Brace Style):** Opening braces on same line, closing braces on new line
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
- Uses conventional commits (e.g., `chore:`, `docs:`, `feat:`, `fix:`)
- Maintains clean history

## Personal Context

**Family:** Married with a daughter (describes them as "most grounding reality check")  
**Interests:**
- Powerlifting (presents "PKI and Powerlifting" talks combining both interests)
- Self-hosting infrastructure
- Continuous learning (mentions freeCodeCamp, Blazor, PNPT journey)

**Online Presence:**
- Website: jakehildreth.com
- GitHub: jakehildreth
- Email: jake@dotdot.horse
- Blog: jakehildreth.github.io/blog
- Mastodon: @horse@infosec.exchange
- Bluesky: dotdot.horse
- Ko-fi: jakehildreth (accepts donations/support)
- LinkedIn: linkedin.com/in/jakehildreth

**Personal Branding:**
- "...horse?" recurring theme across platforms
- ASCII art in tools (locksmith, PowerPUG!)
- Humorous but professional tone
- Focus on practical, actionable solutions
- "Making complex topics accessible" is a core value

## Speaking & Education

### Upcoming Conferences (as of Dec 26, 2025)
- **CodeMash** (Jan 13-16, 2025) - "PKI Unlocked: A No-Math Primer for Builders"

### Recent Presentations
- **Anti-Cast Training** (Nov 12, 2025) - "PKI Foundations for Security Pros"
- **Queen City Con** (Nov 7, 2025) - "Making $ with COMPUTER$"
- **HIPConf** (Oct 7-9, 2025) - "End the ESCape Clause!" (ESCalator research)
- **PancakesCon 6** (Sep 21, 2025) - "PKI and Powerlifting!"
- **Blue Team Con** (Sep 6-7, 2025) - Red tenant model with Eric Woodruff

### Teaching Style
- Progressive concept building
- Practical, hands-on demonstrations
- Makes PKI and AD CS accessible to non-experts
- "No-math" approach to PKI
- Focuses on the AD in AD CS.

## Blog & Writing

**Blog:** jakehildreth.github.io/blog  
**Posting Frequency:** Very active (50+ posts since 2023)  
**Topics:**
- AD CS security
- PowerShell development
- PKI/certificate services
- macOS administration
- Tool development
- Career reflections

**Notable Series:**
- Protected Users Group (multi-part)
- LLMs and AI (pragmatic perspective)
- Locksmith development journey

## Professional Network

**Collaborators:**
- Eric Woodruff (ericonidentity.com) - Cloud/hybrid identity
- John Askew (sk3w) - Computer account abuse research
- Sam Erde - Major contributor to multiple projects

**Community:**
- Active in security conferences
- Open source contributor
- Frequent conference speaker
- Technical blogger

## Work Environment

**Operating System:** Windows/macOS
**Shell:** PowerShell (pwsh.exe/pwsh) and Windows PowerShell (powershell.exe)

## Philosophy & Approach

- **Makes identity security accessible** to overworked admins
- **Open source first** - all major tools freely available
- **Education focused** - writes, speaks, teaches constantly
- **Practical over theoretical** - tools solve real problems
- **Community-oriented** - engages, collaborates, shares knowledge
- **Family-focused** - maintains work-life balance
- **Continuous improvement** - always learning, experimenting
- **Pragmatic about technology** - uses what works, critiques thoughtfully

## Notable Quotes & Themes

- "I'm in your Active Directory, securing all your objects"
- "Making identity security suck a little less"
- "Recovering Sysadmin"
- "Baroque disaster that is AD Certificate Services"
- Describes family as "favorite people and most grounding reality check"

## When Assisting Jake

1. **Use CalVer** not SemVer for versioning (YYYY.MM.DD format)
2. **No emojis** in code or documentation
3. **Follow PowerShell Specific section** for code formatting, naming, and patterns
4. **Keep documentation concise** and practical
5. **Assume cross-platform** needs (Windows/Linux/macOS, Desktop/Core)
6. **Conventional commits** for git messages (chore, docs, feat, fix)
7. **Focus on security** and identity-related solutions
8. **Value simplicity** and maintainability

---

*This context file helps GitHub Copilot provide personalized assistance aligned with Jake's preferences, standards, and working style.*
