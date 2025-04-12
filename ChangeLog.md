# PSPodcast Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

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

[Unreleased]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.3.0..HEAD
[0.3.0]: https://github.com/jdhitsolutions/PSPodcast/compare/v0.2.0..v0.3.0
