#
# Module manifest for module 'PSPodcast'
#
@{
    RootModule           = 'PSPodcast.psm1'
    ModuleVersion        = '0.1.0'
    CompatiblePSEditions = 'Core'
    GUID                 = '3618f898-6fe7-4d94-82e3-23926498ff6d'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '2025 JDH Information Technology Solutions, Inc.'
    Description          = 'A few commands to get and display information of episodes of The PowerShell Podcast. This module is not officially affiliated with the podcast or PDQ.com. The module requires PowerShell 7.'
    PowerShellVersion    = '7.4'
    TypesToProcess       = @()
    FormatsToProcess     = @()
    FunctionsToExport    = 'Get-PSPodcast', 'Show-LatestPSPodcast'
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = 'pspod'
    PrivateData          = @{
        PSData = @{
            Tags                       = @('podcast', 'powershell', 'pdq')
            LicenseUri                 = 'https://github.com/jdhitsolutions/PSPodcast/blob/main/LICENSE.txt'
            ProjectUri                 = 'https://github.com/jdhitsolutions/PSPodcast'
            # IconUri = ''
            # ReleaseNotes = ''
            ExternalModuleDependencies = @('pwshSpectreConsole')
        } # End of PSData hashtable
    } # End of PrivateData hashtable

}
