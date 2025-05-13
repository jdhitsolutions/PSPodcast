---
external help file: PSPodcast-help.xml
Module Name: PSPodcast
online version: https://jdhitsolutions.com/yourls/188eea
schema: 2.0.0
---

# Get-PSPodcast

## SYNOPSIS

Get recent PowerShell Podcast episode information.

## SYNTAX

### last (Default)

```yaml
Get-PSPodcast [[-Last] <Int32>] [-Full] [-Force] [<CommonParameters>]
```

### all

```yaml
Get-PSPodcast [-All] [-Full] [-Force] [<CommonParameters>]
```

### episode

```yaml
Get-PSPodcast [-Episode <Int32>] [-Full] [-Force] [<CommonParameters>]
```

### query

```yaml
Get-PSPodcast [-Query <String>] [-Full] [-Force] [<CommonParameters>]
```

## DESCRIPTION

Use this command to get information about the most recent episodes of the PowerShell Podcast based on the podcast's RSS feed. The default is the 5 most recent episodes.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-PSPodcast -last 2

   Show: PowerShell Summit Bar Sessions 2025 - David R [Episode #169]

Date      Length   Description
----      ------   -----------
4/10/2025 00:13:26 In this casual bar-session chat recorded at the PowerShell +
                   DevOps Global Summit 2025, host Andrew Pla sits down with
                   David R, a first-time attendee with a passion for learning
                   PowerShell. David shares how the PowerShell Podcast itself
                   inspired him to attend and helped shape his scripting
                   journey. What began as a work assignment turned into a
                   powerful learning path, community connection, and a personal
                   transformation.

   Show: PowerShell Summit Bar Sessions 2025 - Frank Lesniak [Episode #168]

Date     Length   Description
----     ------   -----------
4/9/2025 00:24:06 In this episode of the PowerShell Summit 2025 Bar Sessions,
                  Frank Lesniak makes a triumphant return to the podcast. Frank
                  has taken the reigns In this two-sided interview, Frank flips
                  the script and interviews Andrew, but only after we talk
                  about how his week is going, fine dining, how to grow in your
                  career and capitalize on opportunity, the value of empowering
                  others, and more!
```

The default output is a table formatted with $PSStyle.

### Example 2

```powershell
PS C:\> Get-PSPodcast 1 | Format-List

Title       : PowerShell Summit Bar Sessions 2025 - David R
Date        : 4/10/2025
Description : In this casual bar-session chat recorded at the PowerShell +
              DevOps Global Summit 2025, host Andrew Pla sits down with David
              R, a first-time attendee with a passion for learning PowerShell.
              David shares how the PowerShell Podcast itself inspired him to
              attend and helped shape his scripting journey. What began as a
              work assignment turned into a powerful learning path, community
              connection, and a personal transformation.
Episode     : 169
Length      : 00:13:26
Online      : https://powershellpodcast.podbean.com/e/powershell-summit-bar-sess
              ions-2025-david-r/
ShowLinks   : {}
YouTube     :
```

When viewed in Windows Terminal, the link property should be clickable.

### Example 3

```powershell
PS C:\> $r[5] | Select-Object Links

Title     : How to Build an IT Career from the Ground Up with Kevin Apolinario
            (KevTech)
Date      : 3/24/2025 10:00:00 AM
Online    : https://powershellpodcast.podbean.com/e/how-to-build-an-it-career-fr
            om-the-ground-up-with-kevin-apolinario-kevtech/
YouTube   : https://youtu.be/RrNyh6EuD_Q
ShowLinks : {https://kevtechitsupport.com, http://discord.gg/pdq,
            https://pdq.com/the-powershell-podcast,
            https://youtu.be/RrNyh6EuD_Q}
```

The Links property is a property set. The variable $r holds the results of previously run Get-PSPodcast command.

### Example 4

```powershell
PS C:\> Get-PSPodcast -Episode 160

   Show: MS Graph and Stepping into Public Speaking with Morten Kristensen
[Episode #160]

Date      Length   Description
----      ------   -----------
2/24/2025 00:33:49 In this episode of the PowerShell Podcast,we sit down with
                   Morten Kristensen, an automation specialist and PowerShell
                   enthusiast, to discuss his journey with PowerShell, his
                   experience working with the Microsoft Graph API, and his
                   recent leap into public speaking. Morten shares insights
                   from his first-ever technical talk, the challenges of
                   working with Graph API, and how he's navigating his
                   professional growth.
```

If you know the episode number, you can use the `-Episode` parameter to get a specific episode.

### Example 5

```powershell
PS C:\> Get-PSPodcast -query Entra | Format-List Date,Title,Online

Date   : 11/11/2024 10:00:00 AM
Title  : PowerShell, Microsoft Graph, and MVP Wisdom with Christian Ritter
Online : https://powershellpodcast.podbean.com/e/powershell-microsoft-graph-and-
         mvp-wisdom-with-christian-ritter/

Date   : 7/8/2024 10:00:00 AM
Title  : Behind the Scenes at PSConf.EU: Harm Veenstra's Experience and Insights
Online : https://powershellpodcast.podbean.com/e/behind-the-scenes-at-psconfeu-h
         arm-veenstra-s-experience-and-insights/

Date   : 4/29/2024 10:00:00 AM
Title  : The PowerShell & Global DevOps Summit 2024 Bar session 4
Online : https://powershellpodcast.podbean.com/e/powershell-global-devops-summit
         -2024-bar-session-4/

Date   : 11/6/2023 10:00:00 AM
Title  : Entra Insights and Merill Fernando's Toolbox: Powering the Community
Online : https://powershellpodcast.podbean.com/e/entra-insights-and-merrill-fern
         ando-s-toolbox-powering-the-community/

Date   : 2/20/2023 10:00:00 AM
Title  : Learning by Doing with Don Jones
Online : https://powershellpodcast.podbean.com/e/learning-by-doing-with-don-jones/
```

You can find podcast episodes with a given keyword or phrase using the `-Query` parameter. This will search the title and description of each episode. The podcast XML feed does not have a specific entry for the guest, so this is the best way to find episodes with a specific guest.

## PARAMETERS

### -Last

The number of most recent episodes to show.
The default is 5


```yaml
Type: Int32
Parameter Sets: last
Aliases: Newest

Required: False
Position: 0
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### -All

Show all released episodes. This parameter was added in version 0.4.0.

```yaml
Type: SwitchParameter
Parameter Sets: all
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Episode

The episode number to show. This parameter was added in version 0.4.0.

```yaml
Type: Int32
Parameter Sets: episode
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force

Force downloading the RSS feed. When you import the module, the RSS feed is downloaded and cached. It is updated every 24 hours. If you want to force a refresh, use this parameter. This parameter was added in version 0.4.0.

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

### -Query

Enter a name or term to search for in the episode title or description. You will get better results with a case-sensitive query. This parameter was added in version 0.4.0.

```yaml
Type: String
Parameter Sets: query
Aliases:

Required: False
Position: Named
Default value: None
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

### PSPodcastInfo

## NOTES

This command has an alias of gpod.

Learn more about PowerShell: http://jdhitsolutions.com/yourls/newsletter

## RELATED LINKS

[Show-LatestPSPodcast](Show-LatestPSPodcast.md)

[Save-PSPodcast](Save-PSPodcast.md)
