---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/df3a10
schema: 2.0.0
---

# Get-PSPodcastModule

## SYNOPSIS

Get the module information for the PSPodcast module.

## SYNTAX

```yaml
Get-PSPodcastModule [<CommonParameters>]
```

## DESCRIPTION

Use this simple command to display module command information. The output is formatted as a Spectre Console table with clickable links to the project's GitHub repository and online help.

This command was added in v0.4.0.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSPodcastModule
```

The output is an ANSI formatted table using the pswhSpectreConsole module. The display should have clickable links. Clicking the title should open the module's GitHub repository. The command links should open the online help for the command.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### String formatted as a Spectre console table.

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Get-Command]()
