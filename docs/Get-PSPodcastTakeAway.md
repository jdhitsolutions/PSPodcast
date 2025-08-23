---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/ccb338
schema: 2.0.0
---

# Get-PSPodcastTakeAway

## SYNOPSIS

Show episode key points.

## SYNTAX

```yaml
Get-PSPodcastTakeAway [-PSPodcastInfo] <Object> [[-TitleColor] <String>] [[-LinkColor] <String>]
 [[-BorderColor] <String>] [<CommonParameters>]
```

## DESCRIPTION

Pipe a PSPodcastInfo object to this cmdlet to show the key points from the episode in a formatted panel. This command has an alias of takeaway. You can also view the key points by viewing the KeyPoints property of the PSPodcastInfo object.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSPodcast -Last 1 | Get-PSPodcastTakeAway
```

The output is a formatted Spectre.Console panel. You can adjust the colors using the command parameters.

## PARAMETERS

### -BorderColor

The color of the border.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkColor

The color of the link text.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSPodcastInfo

The PSPodcastInfo object.

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

The color of the title text.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### Spectre.Console.Panel

## NOTES

This command has aliases of takeaway and podpoints.

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-PSPodcast](Get-PSPodcast.md)

[Get-PSPodcastShowNotes](Get-PSPodcastShowNotes.md)
