#
# Module manifest for module 'PSPodcast'
#
@{
    RootModule           = 'PSPodcast.psm1'
    ModuleVersion        = '0.7.0'
    CompatiblePSEditions = 'Core'
    GUID                 = '3618f898-6fe7-4d94-82e3-23926498ff6d'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '2025 JDH Information Technology Solutions, Inc.'
    Description          = 'A set of PowerShell commands to get and display information for episodes of The PowerShell Podcast. This module is not officially affiliated with the podcast or PDQ.com. The module requires PowerShell 7 and the pwshSpectreConsole module.'
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

## v[0.7.0] - 2025-05-13 10:50:08

### Added

- Added parameter alias `Newest` to the `Last` parameter on `Show-LatestPSPodcast`.

### Changed

- Updated `Get-PSPodcast` and `Show-LatestPSPodcast` with a `-Full` parameter which will display the full episode description. Previous versions only showed the first paragraph which is still the default to avoid a breaking change.
- Help updates.
- Updated `README.md`.

[0.7.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.6.0...v0.7.0
"@
            ExternalModuleDependencies = @('pwshSpectreConsole')
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}
