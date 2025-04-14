---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/13ea3e
schema: 2.0.0
---

# Get-PSPodcastShowNotes

## SYNOPSIS

Get podcast show notes.

## SYNTAX

```yaml
Get-PSPodcastShowNotes [-PSPodcastInfo] <Object> [[-TitleColor] <String>] [[-BorderColor] <String>]
<CommonParameters>]
```

## DESCRIPTION

Use this command to display show notes for a given PowerShell Podcast episode in a formatted panel. The default output is custom formatted using tools from the pwshSpectreConsole module. This command has an alias of ShowNotes.

Even though the command has a verb of Get, you should treat this command like a formatting command. You cannot pipe output from this command to another command.

## EXAMPLES

### Example 1

```powershell
PS C:\> $r[3] | Get-PSPodcastShowNotes
```

Pipe a previously retrieved PSPodcastInfo object to this command. The output will be a formatted Spectre console panel. You can adjust the colors using the command parameters.

## PARAMETERS

### -BorderColor

The color of the border. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: GreenYellow
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSPodcastInfo

The PSPodcastInfo object

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

### -TitleColor

The color of the title text. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Yellow
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSPodcastInfo

## OUTPUTS

### Spectre.Console.Panel

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-PSPodcast](Get-PSPodcast.md)

[Show-LatestPSPodcast](Show-LatestPSPodcast.md)
