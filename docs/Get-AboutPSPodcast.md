---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/7129c6
schema: 2.0.0
---

# Get-AboutPSPodcast

## SYNOPSIS

Display podcast About information.

## SYNTAX

```yaml
Get-AboutPSPodcast [[-TextColor] <String>] [[-BorderColor] <String>] [-Force]
 [<CommonParameters>]
```

## DESCRIPTION

This is a simple function to display information about The PowerShell Podcast.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-AboutPSPodcast
```

The default output should have clickable links.

## PARAMETERS

### -BorderColor

The color of the border. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Gold1
Accept pipeline input: False
Accept wildcard characters: False
```

### -TextColor

The color of the description text. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force

Force downloading the RSS feed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String formatted as a Spectre.Console Panel

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS
