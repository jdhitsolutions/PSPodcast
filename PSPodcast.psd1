#
# Module manifest for module 'PSPodcast'
#
@{
    RootModule           = 'PSPodcast.psm1'
    ModuleVersion        = '0.6.0'
    CompatiblePSEditions = 'Core'
    GUID                 = '3618f898-6fe7-4d94-82e3-23926498ff6d'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '2025 JDH Information Technology Solutions, Inc.'
    Description          = 'A few PowerShell commands to get and display information for episodes of The PowerShell Podcast. This module is not officially affiliated with the podcast or PDQ.com. The module requires PowerShell 7 and the pwshSpectreConsole module.'
    PowerShellVersion    = '7.4'
    TypesToProcess       = @('types/PSPodcastInfo.types.ps1xml')
    FormatsToProcess     = @('formats/PSPodcastInfo.format.ps1xml')
    FunctionsToExport    = @(
        'Get-PSPodcast',
        'Show-LatestPSPodcast',
        'Save-PSPodcast',
        'Get-PSPodcastShowNotes',
        'Get-PSPodcastModule',
        'Get-AboutPSPodcast'
    )
    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @('gpod', 'pspod', 'ShowNotes')
    RequiredModules      = @(
        @{ ModuleName = 'pwshSpectreConsole'; ModuleVersion = '2.3.0' }
    )
    PrivateData          = @{
        PSData = @{
            Tags                       = @('podcast', 'powershell', 'pdq')
            LicenseUri                 = 'https://github.com/jdhitsolutions/PSPodcast/blob/main/LICENSE.txt'
            ProjectUri                 = 'https://github.com/jdhitsolutions/PSPodcast'
            # IconUri = ''
            ReleaseNotes = @"
# PSPodcast Changelog

## v0.6.0 - 2025-05-12 11:22:44

### Changed

- Minor help revisions.
- Updated `README.md`.
- Updated `Get-AboutPSPodcast` to include an image of Andrew Pla.
- Updated `Get-PSPodcastModule` to display aliases in the same color as the box.

### Fixed

- Fixed incorrect link to module repository in `Get-PSPodcastModule`.

"@
            ExternalModuleDependencies = @('pwshSpectreConsole')
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}
