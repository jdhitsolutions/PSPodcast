---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/df3010
schema: 2.0.0
---

# Save-PSPodcast

## SYNOPSIS

Download a podcast episode

## SYNTAX

```yaml
Save-PSPodcast [[-Path] <String>] -PSPodcastInfo <Object> [-Passthru] [<CommonParameters>]
```

## DESCRIPTION

Use this command to download an MP3 file from a podcast episode. You will need to pass a result from Get-PSPodcast to download that episode. The default location is $HOME. The file name will be "PowerShellPodcast-<episode number>.mp3".

## EXAMPLES

### Example 1

```powershell
PS C:\> $r = Get-PSPodcast -Last 5
PS C:\> $r[0] | Save-PSPodcast -Path d:\ -Passthru

    Directory: D:\

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---           4/12/2025 12:41 PM       32255999 PowerShellPodcast-169.mp3
```

Save the most recent podcast episode to the D:\ drive.

## PARAMETERS

### -PSPodcastInfo

A PSPodcastInfo object.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Passthru

Show the downloaded file.

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

### -Path

The path or folder where the podcast will be saved.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: $HOME
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSPodcastInfo

## OUTPUTS

### None

### System.IO.FileInfo

## NOTES

This command has an alias of savepod.

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-PSPodcast](Get-PSPodcast.md)
