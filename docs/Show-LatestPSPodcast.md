---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/dc7824
schema: 2.0.0
---

# Show-LatestPSPodcast

## SYNOPSIS

Display the most recent PowerShell Podcast episode.

## SYNTAX

```yaml
Show-LatestPSPodcast [[-TitleColor] <String>] [[-LinkColor] <String>] [[-BorderColor] <String>] [-Profile] [-Full] [-Last <Int32>]  [<CommonParameters>]
```

## DESCRIPTION

Use this command to display the most recent episode of the PowerShell Podcast. The default output is custom formatted using tools from the pwshSpectreConsole module. This command has an alias of pspod. You should treat this command like a formatting command. You cannot pipe output from this command to another command like Save-PSPodcast.

This command was written with the idea that you would use it in your PowerShell profile script. If you think you don't have the most current information, run Get-PSPodcast -Last 1 -Force to force downloading the latest episode information.

## EXAMPLES

### Example 1

```powershell
PS C:\> Show-LatestPSPodcast
```

This will display a formatted Spectre console panel. You can adjust the colors using the command parameters.

### Example 2

```powershell
PS C:\> Show-LatestPSPodcast -full
```

Display the most recent episode with the full description.

### Example 3

```powershell
PS C:\> Show-LatestPSPodcast -profile
```

Only show the podcast information once every 24 hours. Use this when running this command in your profile script.

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

### -LinkColor

The color of the link text. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: DeepSkyBlue2
Accept pipeline input: False
Accept wildcard characters: False
```

### -Profile

Display the podcast information once every 24 hours.
Use this when running this command in your profile script. When you use this parameter, the command will create a flag file in $HOME. The LastWriteTime property is checked to determine if the command should run again. When used in a profile script, this will prevent the command from running every time you open a new PowerShell session.

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

### -TitleColor

The color of the title text. Use a Spectre.Console color name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: SpringGreen2
Accept pipeline input: False
Accept wildcard characters: False
```

### -Last

The number of most recent episodes to display.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Newest

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Full

Display the full show description. The default is to show the first paragraph of the episode description. This parameter was added in version 0.7.0.

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

### Spectre.Console.Panel

## NOTES

This command has an alias of pspod.

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-PSPodcast](Get-PSPodcast.md)

[Get-SpectreDemoColors]()
