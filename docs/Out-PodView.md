---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/
schema: 2.0.0
---

# Out-PodView

## SYNOPSIS

Display PowerShell Podcast episode information with rich formatting.

## SYNTAX

```yaml
Out-PodView [-Episode] <Object> [[-TextColor] <String>] [[-BorderColor] <String>] [<CommonParameters>]
```

## DESCRIPTION

Use this command to display PowerShell Podcast episode information with rich formatting using Spectre.Console.
The command displays the YouTube thumbnail, episode description, metadata, and links in a formatted panel.
This command is designed to be used in a pipeline with Get-PSPodcast to provide an attractive visual display of episode information.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSPodcast -Last 1 | Out-PodView
```

Display the most recent podcast episode with default colors.

### Example 2

```powershell
PS C:\> Get-PSPodcast -Episode 169 | Out-PodView -TextColor Cyan1 -BorderColor SpringGreen2
```

Display a specific episode with custom text and border colors.

### Example 3

```powershell
PS C:\> Get-PSPodcast -Query "Summit" | Out-PodView
```

Display all episodes matching a query with formatted output for each episode.

## PARAMETERS

### -Episode

The episode object to display. This parameter accepts pipeline input and should be an object with properties including Title, Description, YouTube, Episode, Date, Length, and Link.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TextColor

The color of the description text. Use a Spectre.Console color name. The default is GreenYellow.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: GreenYellow
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderColor

The color of the border. Use a Spectre.Console color name. The default is Gold1.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Gold1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSPodcastInfo

## OUTPUTS

### Spectre.Console.Panel

## NOTES

This command requires the PwshSpectreConsole module for rich terminal formatting.

The YouTube thumbnail is retrieved from YouTube's image service and displayed alongside the episode information.

The description text is automatically wrapped to fit within the available terminal width.

Learn more about PowerShell: <http://jdhitsolutions.com/yourls/newsletter>

## RELATED LINKS

[Get-PSPodcast](Get-PSPodcast.md)

[Show-LatestPSPodcast](Show-LatestPSPodcast.md)
