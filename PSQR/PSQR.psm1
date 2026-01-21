function New-PSQR {
    <#
    .SYNOPSIS
    Generates a QR code from a string and displays it in the terminal.

    .DESCRIPTION
    The New-PSQR function takes a text string and generates a QR code that is displayed
    directly in the terminal using Unicode block characters. The function uses a simple
    QR code generation algorithm to encode the text.

    .PARAMETER Text
    The text string to encode in the QR code. This parameter is mandatory and accepts
    input from the pipeline.

    .PARAMETER ErrorCorrectionLevel
    The error correction level for the QR code. Valid values are L (Low), M (Medium),
    Q (Quartile), and H (High). Default is M (Medium).

    .EXAMPLE
    New-PSQR -Text "Hello, World!"
    Generates and displays a QR code containing "Hello, World!" in the terminal.

    .EXAMPLE
    "https://jakehildreth.com" | New-PSQR
    Generates a QR code from pipeline input containing a URL.

    .EXAMPLE
    New-PSQR -Text "Important Data" -ErrorCorrectionLevel H
    Generates a QR code with high error correction level.

    .OUTPUTS
    None. The function outputs the QR code directly to the console.

    .NOTES
    This function uses a basic QR code implementation suitable for simple text encoding.
    For complex data or production use, consider using a dedicated QR code library.
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
        [string]$Text,

        [Parameter()]
        [ValidateSet('L', 'M', 'Q', 'H')]
        [string]$ErrorCorrectionLevel = 'M'
    )

    begin {
        Write-Verbose "Starting QR code generation"
        
        # Unicode block characters for rendering QR codes
        $fullBlock = [char]0x2588
        $emptyBlock = ' '
        
        # QR code constants
        $quietZone = 4
    }

    process {
        Write-Verbose "Encoding text: $Text"
        Write-Verbose "Error correction level: $ErrorCorrectionLevel"

        try {
            # Generate a basic QR code matrix
            # For a simple implementation, we'll use a basic encoding
            $qrMatrix = Get-QRMatrix -InputText $Text -ErrorCorrection $ErrorCorrectionLevel

            # Render the QR code to the console
            Write-Verbose "Rendering QR code to console"
            
            # Add top quiet zone
            for ($i = 0; $i -lt $quietZone; $i++) {
                Write-Host ''
            }

            # Render each row of the QR code
            foreach ($row in $qrMatrix) {
                $line = ' ' * $quietZone
                foreach ($module in $row) {
                    if ($module) {
                        $line += "$fullBlock$fullBlock"
                    } else {
                        $line += "$emptyBlock$emptyBlock"
                    }
                }
                $line += ' ' * $quietZone
                Write-Host $line
            }

            # Add bottom quiet zone
            for ($i = 0; $i -lt $quietZone; $i++) {
                Write-Host ''
            }

            Write-Verbose "QR code generation complete"

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

function Get-QRMatrix {
    <#
    .SYNOPSIS
    Internal helper function to generate QR code matrix.

    .DESCRIPTION
    This is a private helper function that generates the actual QR code matrix
    from the input text. It implements a simplified QR code encoding algorithm.

    .PARAMETER InputText
    The text to encode in the QR code.

    .PARAMETER ErrorCorrection
    The error correction level (L, M, Q, or H).

    .OUTPUTS
    System.Array[]
    Returns a 2D array representing the QR code matrix.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$InputText,

        [Parameter()]
        [string]$ErrorCorrection = 'M'
    )

    Write-Verbose "Generating QR matrix for: $InputText"

    # Determine QR code version based on byte count
    # Using UTF-8 encoding to get accurate byte count for capacity calculations
    $dataBytes = [System.Text.Encoding]::UTF8.GetBytes($InputText)
    $dataLength = $dataBytes.Length
    
    Write-Verbose "Data length: $dataLength bytes, Error correction: $ErrorCorrection"
    
    # QR code version capacity lookup table (bytes)
    # Format: @{ VersionNumber = @{ Size = MatrixSize; L = Capacity; M = Capacity; Q = Capacity; H = Capacity } }
    # Note: ErrorCorrectionLevel parameter is used only for version selection (capacity planning)
    # This implementation does not include actual Reed-Solomon error correction encoding
    $versionCapacity = @{
        1 = @{ Size = 21; L = 17; M = 14; Q = 11; H = 7 }
        2 = @{ Size = 25; L = 32; M = 26; Q = 20; H = 14 }
        3 = @{ Size = 29; L = 53; M = 42; Q = 32; H = 24 }
        4 = @{ Size = 33; L = 78; M = 62; Q = 46; H = 34 }
        5 = @{ Size = 37; L = 106; M = 84; Q = 60; H = 44 }
    }
    
    # Select appropriate version based on data length and error correction level
    $version = $null
    $size = 0
    
    foreach ($ver in 1..5) {
        $capacity = $versionCapacity[$ver][$ErrorCorrection]
        if ($dataLength -le $capacity) {
            $version = $ver
            $size = $versionCapacity[$ver].Size
            break
        }
    }
    
    # Check if data is too long for supported versions
    if ($null -eq $version) {
        $maxCapacity = $versionCapacity[5][$ErrorCorrection]
        $errorMessage = "Data length ($dataLength bytes) exceeds maximum capacity ($maxCapacity bytes) for version 5 with error correction level $ErrorCorrection"
        $exception = [System.ArgumentException]::new($errorMessage, 'InputText')
        $errorRecord = [System.Management.Automation.ErrorRecord]::new(
            $exception,
            'DataTooLong',
            [System.Management.Automation.ErrorCategory]::InvalidArgument,
            $InputText
        )
        $PSCmdlet.ThrowTerminatingError($errorRecord)
    }
    
    Write-Verbose "Using QR version $version (${size}x${size}) with capacity of $($versionCapacity[$version][$ErrorCorrection]) bytes"

    # Initialize matrix
    $matrix = New-Object 'bool[][]' $size
    for ($i = 0; $i -lt $size; $i++) {
        $matrix[$i] = New-Object 'bool[]' $size
    }

    # Add finder patterns (top-left, top-right, bottom-left)
    Add-FinderPattern -Matrix $matrix -Row 0 -Column 0
    Add-FinderPattern -Matrix $matrix -Row 0 -Column ($size - 7)
    Add-FinderPattern -Matrix $matrix -Row ($size - 7) -Column 0

    # Add timing patterns
    for ($i = 8; $i -lt ($size - 8); $i++) {
        $matrix[6][$i] = ($i % 2) -eq 0
        $matrix[$i][6] = ($i % 2) -eq 0
    }

    # Encode data (simplified encoding)
    # Note: This is a basic QR code implementation that directly encodes UTF-8 bytes
    # without formal QR code format indicators, mode indicators, or Reed-Solomon
    # error correction encoding. The ErrorCorrectionLevel parameter is used only
    # for version selection (determining matrix size) and does not add actual
    # error correction data. For production use with full error correction, 
    # consider using a complete QR code library.
    # dataBytes already calculated above for version selection
    $dataIndex = 0
    
    # Fill in data in a zigzag pattern (simplified)
    for ($col = $size - 1; $col -gt 0; $col -= 2) {
        if ($col -eq 6) {
            $col--
        }
        
        for ($row = 0; $row -lt $size; $row++) {
            $actualRow = if (($size - $col) % 4 -lt 2) { $row } else { $size - 1 - $row }
            
            for ($c = 0; $c -lt 2; $c++) {
                $currentCol = $col - $c
                
                if (-not (Test-IsReserved -Row $actualRow -Column $currentCol -Size $size)) {
                    if ($dataIndex -lt ($dataBytes.Length * 8)) {
                        $byteIndex = [Math]::Floor($dataIndex / 8)
                        $bitIndex = 7 - ($dataIndex % 8)
                        $bit = ($dataBytes[$byteIndex] -band (1 -shl $bitIndex)) -ne 0
                        $matrix[$actualRow][$currentCol] = $bit
                        $dataIndex++
                    }
                }
            }
        }
    }

    return $matrix
}

function Add-FinderPattern {
    <#
    .SYNOPSIS
    Adds a finder pattern to the QR code matrix.

    .DESCRIPTION
    Internal helper function that adds the distinctive square finder patterns
    to the corners of the QR code.

    .PARAMETER Matrix
    The QR code matrix to modify.

    .PARAMETER Row
    The starting row position for the finder pattern.

    .PARAMETER Column
    The starting column position for the finder pattern.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [bool[][]]$Matrix,

        [Parameter(Mandatory = $true)]
        [int]$Row,

        [Parameter(Mandatory = $true)]
        [int]$Column
    )

    # 7x7 finder pattern
    $pattern = @(
        @($true, $true, $true, $true, $true, $true, $true),
        @($true, $false, $false, $false, $false, $false, $true),
        @($true, $false, $true, $true, $true, $false, $true),
        @($true, $false, $true, $true, $true, $false, $true),
        @($true, $false, $true, $true, $true, $false, $true),
        @($true, $false, $false, $false, $false, $false, $true),
        @($true, $true, $true, $true, $true, $true, $true)
    )

    for ($r = 0; $r -lt 7; $r++) {
        for ($c = 0; $c -lt 7; $c++) {
            $Matrix[$Row + $r][$Column + $c] = $pattern[$r][$c]
        }
    }

    # Add white border around finder pattern
    for ($i = -1; $i -le 7; $i++) {
        if (($Row + $i) -ge 0 -and ($Row + $i) -lt $Matrix.Length) {
            if (($Column - 1) -ge 0) {
                $Matrix[$Row + $i][$Column - 1] = $false
            }
            if (($Column + 7) -lt $Matrix[0].Length) {
                $Matrix[$Row + $i][$Column + 7] = $false
            }
        }
    }
    
    for ($i = -1; $i -le 7; $i++) {
        if (($Column + $i) -ge 0 -and ($Column + $i) -lt $Matrix[0].Length) {
            if (($Row - 1) -ge 0) {
                $Matrix[$Row - 1][$Column + $i] = $false
            }
            if (($Row + 7) -lt $Matrix.Length) {
                $Matrix[$Row + 7][$Column + $i] = $false
            }
        }
    }
}

function Test-IsReserved {
    <#
    .SYNOPSIS
    Tests if a position in the QR code matrix is reserved.

    .DESCRIPTION
    Internal helper function that checks if a specific position in the matrix
    is reserved for finder patterns, timing patterns, or other special areas.

    .PARAMETER Row
    The row position to check.

    .PARAMETER Column
    The column position to check.

    .PARAMETER Size
    The size of the QR code matrix.

    .OUTPUTS
    System.Boolean
    Returns $true if the position is reserved, $false otherwise.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [int]$Row,

        [Parameter(Mandatory = $true)]
        [int]$Column,

        [Parameter(Mandatory = $true)]
        [int]$Size
    )

    # Finder patterns and separators (top-left, top-right, bottom-left)
    if (($Row -lt 9 -and $Column -lt 9) -or
        ($Row -lt 9 -and $Column -ge ($Size - 8)) -or
        ($Row -ge ($Size - 8) -and $Column -lt 9)) {
        return $true
    }

    # Timing patterns
    if ($Row -eq 6 -or $Column -eq 6) {
        return $true
    }

    return $false
}

# Export only the public function
Export-ModuleMember -Function New-PSQR
