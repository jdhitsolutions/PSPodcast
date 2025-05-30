# PSPodcast Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and is maintained using the [ChangelogManagement](https://github.com/natescherer/ChangelogManagement) module.

## [Unreleased]

## [0.7.0] - 2025-05-13

### Added

- Added parameter alias `Newest` to the `Last` parameter on `Show-LatestPSPodcast`.

### Changed

- Updated `Get-PSPodcast` and `Show-LatestPSPodcast` with a `-Full` parameter which will display the full episode description. Previous versions only showed the first paragraph which is still the default to avoid a breaking change.
- Help updates.
- Updated `README.md`.

## [0.6.0] - 2025-05-12

### Changed

- Minor help revisions.
- Updated `README.md`.
- Updated `Get-AboutPSPodcast` to include an image of Andrew Pla.
- Updated `Get-PSPodcastModule` to display aliases in the same color as the box.

### Fixed

- Fixed incorrect link to module repository in `Get-PSPodcastModule`.

## [0.5.0] - 2025-04-27

### Added

- Added ValidateScript() attribute to parameters that accept SpectreConsole color values
- Added command `Get-AboutPSPodcast`.
- Added alias `savepod` for `Save-PSPodcast`.

### Changed

- Moved code to test and download the RSS file to a private helper function.
- Moved private functions to a separate file.
- Modified `Show-LatestPSPodcast` to let the user specify the number of recent podcast episodes. The default is 1.
- Updated module and `Get-PSPodcast` to test and verify the website and validity of the XML feed file. This should hopefully fix the problem with [Issue #1](https://github.com/jdhitsolutions/PSPodcast/issues/1).
- Revised exception message in `Get-PSPodcast` with additional information.
- Updated `README`.

### Fixed

- Fixed a bug in `Get-PSPodcastModule` that was including internal and private functions.

## [0.4.0] - 2025-04-14

### Added

- Added command `Get-PSPodcastModule`.
- Added table view `List` for `PSPodcastInfo`.
- Added property set `List` to the `PSPodcastInfo`.
- Added command alias `gpod` for `Get-PSPodcast`.
- Added the alias `Newest` to the `Last` parameter of `Get-PSPodcast`.
- Added the ability to get a show by episode number to `Get-PSPodcast`.
- Added the `Query` parameter to `Get-PSPodcast` to search for text, such as a guest or topic, in the episode title or description.
- Added a `-Force` parameter to `Get-PSPodast` to force downloading the XML feed.
- Added a parameter to get all episodes with `Get-PSPodcast`. This change included setting up multiple parameter sets.

### Changed

- Moved type extensions for `PSPodcastInfo` to the types ps1xml file.
- Changed the default minimum of episodes to 5 in `Get-PSPodcast` and removed range validation.
- Modified module to download the XML feed to a temporary file on module import if it doesn't exist or if it is older than 24 hours. `Get-PSPodcast` has been revised to use the downloaded file if exists. If it is older than 24 hours, it will be re-downloaded. __This is a potential breaking change.__

## [0.3.0] - 2025-04-12

### Added

- Added command `Get-PSPodcastShowNotes` with an alias of `ShowNotes`.
- Added property set `Links`.
- Added `Save-PSPodcast` command to download an episode MP3 file.
- Added default formatted list view for `PSPodcastInfo`.
- Added alias property of `Online` for `Link` on `PSPodcastInfo` objects.
- Added a script method, `DownloadShow`, to `PSPodcastInfo` to download the episode MP3.
- Added properties to the `PSPodcastInfo` object to include the audio download link, the YouTube link, and a collection of links from the show notes.

### Changed

- Added verbose output to `Show-LatestPSPodcast`.
- Changed the default number of episodes to retrieve with `Get-PSPodcast` to 4.
- First public release to the PowerShell Gallery.
- Updated `README`.

## 0.2.0 - 2025-04-11

### Added

- Added default table formatting for `Get-PSPodcast`.
- Updated `README`.
- Added help documentation.

### Changed

- Updated argument completer to show values for color parameters in `Show-LatestPSPodcast` using the color.

## 0.1.0 - 2025-04-11

This is an unpublished version.

### Added

- Added initial commands and aliases.

[Unreleased]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.7.0..HEAD
[0.7.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.6.0..v0.7.0
[0.6.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.5.0..v0.6.0
[0.5.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.4.0..v0.5.0
[0.4.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.3.0..v0.4.0
[0.3.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.2.0..v0.3.0