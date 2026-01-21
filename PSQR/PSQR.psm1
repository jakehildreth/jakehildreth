function New-PSQR {
    <#
    .SYNOPSIS
    Generates a QR code from a string and displays it in the terminal.

    .DESCRIPTION
    The New-PSQR function takes a text string and generates a QR code that is displayed
    directly in the terminal using Unicode block characters. It uses the qrencode utility
    for QR code generation.

    .PARAMETER Text
    The text string to encode in the QR code. This parameter is mandatory and accepts
    input from the pipeline.

    .EXAMPLE
    New-PSQR -Text "Hello, World!"
    Generates and displays a QR code containing "Hello, World!" in the terminal.

    .EXAMPLE
    "https://jakehildreth.com" | New-PSQR
    Generates a QR code from pipeline input containing a URL.

    .OUTPUTS
    None. The function outputs the QR code directly to the console.

    .NOTES
    This function requires the qrencode utility to be installed.
    Install instructions:
      Ubuntu/Debian: sudo apt-get install qrencode
      macOS: brew install qrencode
      Windows: choco install qrencode or scoop install qrencode
    #>
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            Position = 0,
            HelpMessage = 'Enter the text to encode in the QR code'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Text
    )

    begin {
        Write-Verbose "Starting QR code generation"
        
        # Installation instructions (single source of truth)
        $script:InstallInstructions = @"
Ubuntu/Debian: sudo apt-get install qrencode
macOS: brew install qrencode
Windows: choco install qrencode or scoop install qrencode
"@
        
        # Check if qrencode is available
        $qrencodeCommand = Get-Command 'qrencode' -ErrorAction SilentlyContinue
        if (-not $qrencodeCommand) {
            $errorMessage = "qrencode utility not found. Please install it first:`n$script:InstallInstructions"
            $exception = [System.Management.Automation.ItemNotFoundException]::new($errorMessage)
            $errorRecord = [System.Management.Automation.ErrorRecord]::new(
                $exception,
                'QREncodeNotFound',
                [System.Management.Automation.ErrorCategory]::ObjectNotFound,
                'qrencode'
            )
            $PSCmdlet.ThrowTerminatingError($errorRecord)
        }
    }

    process {
        Write-Verbose "Encoding text: $Text"

        try {
            # Create a temporary file for the QR code output
            $tempFile = [System.IO.Path]::GetTempFileName()
            
            try {
                # Use qrencode to generate the QR code in ANSI UTF-8 format for terminal display
                # Build arguments array for safe parameter passing (prevents injection)
                $qrencodeArgs = @(
                    '-t', 'ANSIUTF8'  # Output format suitable for terminal display
                    '-m', '2'         # Add a 2-module margin (quiet zone)
                    '-l', 'M'         # Error correction level Medium
                    '-o', $tempFile   # Output to file
                    $Text             # Text to encode (passed as separate argument for safety)
                )
                
                $output = & qrencode $qrencodeArgs 2>&1
                
                if ($LASTEXITCODE -ne 0) {
                    $errorDetails = if ($output) { ": $output" } else { '' }
                    throw "qrencode command failed with exit code $LASTEXITCODE$errorDetails. This may indicate invalid input or a problem with the qrencode utility."
                }
                
                # Read and display the QR code
                Write-Verbose "Rendering QR code to console"
                Write-Host ""
                Get-Content $tempFile | ForEach-Object { Write-Host $_ }
                Write-Host ""
                
                Write-Verbose "QR code generation complete"
                
            } finally {
                # Clean up temp file
                if (Test-Path $tempFile) {
                    Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
                }
            }

        } catch {
            $errorRecord = [System.Management.Automation.ErrorRecord]::new(
                $_.Exception,
                'QRCodeGenerationFailed',
                [System.Management.Automation.ErrorCategory]::InvalidOperation,
                $Text
            )
            $PSCmdlet.WriteError($errorRecord)
        }
    }

    end {
        Write-Verbose "QR code generation process finished"
    }
}

# Export only the public function
Export-ModuleMember -Function New-PSQR
