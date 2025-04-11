---
external help file: PSPodcast-help.xml
Module Name: pspodcast
online version: https://jdhitsolutions.com/yourls/188eea
schema: 2.0.0
---

# Get-PSPodcast

## SYNOPSIS

Get recent PowerShell Podcast episode information.

## SYNTAX

```yaml
Get-PSPodcast [[-Last] <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Use this command to get information about the most recent episodes of the PowerShell Podcast based on the podcast's RSS feed. You can get between 1 and 100 of the most recent episodes.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSPodcast -last 2

   Show: PowerShell Summit Bar Sessions 2025 - David R [Episode #169]

Date      Length   Description
----      ------   -----------
4/10/2025 00:13:26 In this casual bar-session chat recorded at the PowerShell + DevOps Global Summit 2025, host Andrew
                   Pla sits down with David R, a first-time attendee with a passion for learning PowerShell. David
                   shares how the PowerShell Podcast itself inspired him to attend and helped shape his scripting
                   journey. What began as a work assignment turned into a powerful learning path, community connection,
                   and a personal transformation.

   Show: PowerShell Summit Bar Sessions 2025 - Frank Lesniak [Episode #168]

Date     Length   Description
----     ------   -----------
4/9/2025 00:24:06 In this episode of the PowerShell Summit 2025 Bar Sessions, Frank Lesniak makes a triumphant return
                  to the podcast. Frank has taken the reigns In this two-sided interview, Frank flips the script and
                  interviews Andrew, but only after we talk about how his week is going, fine dining, how to grow in
                  your career and capitalize on opportunity, the value of empowering others, and more!
```

The default output is a table formatted with $PSStyle.

### Example 2

```powershell
PS C:\> Get-PSPodcast 1 | Format-List

Title       : PowerShell Summit Bar Sessions 2025 - David R
Date        : 4/10/2025 5:00:00 PM
Description : In this casual bar-session chat recorded at the PowerShell + DevOps Global Summit 2025, host Andrew Pla
              sits down with David R, a first-time attendee with a passion for learning PowerShell. David shares how
              the PowerShell Podcast itself inspired him to attend and helped shape his scripting journey. What began
              as a work assignment turned into a powerful learning path, community connection, and a personal
              transformation.
Length      : 00:13:26
Link        : https://powershellpodcast.podbean.com/e/powershell-summit-bar-sessions-2025-david-r/
Episode     : 169
```

When viewed in Windows Terminal, the link property should be clickable.

## PARAMETERS

### -Last

The number of most recent episodes to show.
The default is 1.
The maximum is 100.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### PSPodcastInfo

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Show-LatestPSPodcast](Show-LatestPSPodcast.md)
