# PSQR

A simple PowerShell module for generating QR codes in the terminal.

## Installation

### From Source

1. Clone or download this repository
2. Import the module:

```powershell
Import-Module ./PSQR/PSQR.psd1
```

### Manual Installation

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

Specify error correction level:

```powershell
New-PSQR -Text "Critical data" -ErrorCorrectionLevel H
```

## Usage

### New-PSQR

Generates a QR code from a string and displays it in the terminal.

#### Parameters

- **Text** (Mandatory): The text string to encode in the QR code
  - Accepts pipeline input
  - Position 0

- **ErrorCorrectionLevel** (Optional): The error correction level
  - Valid values: L (Low), M (Medium), Q (Quartile), H (High)
  - Default: M (Medium)

#### Examples

```powershell
# Basic usage
New-PSQR -Text "https://github.com/jakehildreth"

# With high error correction
New-PSQR -Text "Important data" -ErrorCorrectionLevel H

# From pipeline
"Scan me!" | New-PSQR

# Verbose output
New-PSQR -Text "Debug this" -Verbose
```

## Error Correction Levels

- **L (Low)**: ~7% error correction
- **M (Medium)**: ~15% error correction (default)
- **Q (Quartile)**: ~25% error correction
- **H (High)**: ~30% error correction

Higher error correction levels make the QR code more resilient to damage but may require larger QR codes for the same data.

## Requirements

- PowerShell 5.1 or higher
- Cross-platform compatible (Windows, Linux, macOS)

## Notes

This module implements a basic QR code generation algorithm suitable for simple text encoding. The QR codes are displayed using Unicode block characters directly in the terminal.

**Important:** The generated QR codes may not be scannable by all readers due to missing standard QR format components (format information, version information, etc.). For production use with guaranteed scannability, consider using a dedicated QR code library with full format support.

## License

Copyright (c) 2026 Jake Hildreth. All rights reserved.
