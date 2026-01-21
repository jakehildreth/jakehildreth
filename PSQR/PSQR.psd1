@{
    RootModule = 'PSQR.psm1'
    ModuleVersion = '2026.01.21'
    GUID = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890'
    Author = 'Jake Hildreth'
    CompanyName = 'jakehildreth'
    Copyright = '(c) 2026 Jake Hildreth. All rights reserved.'
    Description = 'A simple PowerShell module for generating QR codes in the terminal'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('New-PSQR')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('QRCode', 'Terminal', 'Console')
            LicenseUri = ''
            ProjectUri = 'https://github.com/jakehildreth/jakehildreth'
            ReleaseNotes = 'Initial release of PSQR module'
        }
    }
}
