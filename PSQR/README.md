# PSQR

A simple PowerShell module for generating QR codes in the terminal.

## Installation

### Prerequisites

PSQR requires the `qrencode` utility to be installed on your system:

**Ubuntu/Debian:**
```bash
sudo apt-get install qrencode
```

**macOS:**
```bash
brew install qrencode
```

**Windows:**
```powershell
# Using Chocolatey
choco install qrencode

# Or using Scoop
scoop install qrencode
```

### Module Installation

#### From Source

1. Clone or download this repository
2. Import the module:

```powershell
Import-Module ./PSQR/PSQR.psd1
```

#### Manual Installation

Copy the PSQR folder to one of your PowerShell module paths:

```powershell
# View your module paths
$env:PSModulePath -split ';'

# Copy to user modules directory
Copy-Item -Path ./PSQR -Destination "$HOME\Documents\PowerShell\Modules\" -Recurse

# Import the module
Import-Module PSQR
```

## Quick Start

Generate a QR code from text:

```powershell
New-PSQR -Text "Hello, World!"
```

Generate a QR code from a URL:

```powershell
New-PSQR -Text "https://jakehildreth.com"
```

Use pipeline input:

```powershell
"Important message" | New-PSQR
```

## Usage

### New-PSQR

Generates a QR code from a string and displays it in the terminal.

#### Parameters

- **Text** (Mandatory): The text string to encode in the QR code
  - Accepts pipeline input
  - Position 0

#### Examples

```powershell
# Basic usage
New-PSQR -Text "https://github.com/jakehildreth"

# From pipeline
"Scan me!" | New-PSQR

# Verbose output
New-PSQR -Text "Debug this" -Verbose
```

## Requirements

- PowerShell 5.1 or higher
- qrencode utility (see Prerequisites above)
- Cross-platform compatible (Windows, Linux, macOS)

## Notes

This module uses the industry-standard `qrencode` utility to generate proper QR codes that are scannable by all standard QR code readers. The QR codes are displayed using Unicode block characters directly in the terminal.

## License

Copyright (c) 2026 Jake Hildreth. All rights reserved.
