# PSPodcast Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

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

[Unreleased]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.4.0..HEAD
[0.4.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.3.0..v0.4.0
[0.3.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.2.0..v0.3.0