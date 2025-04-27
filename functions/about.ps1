#a function to display a brief summary about the podcast.

Function Get-AboutPSPodcast {
    [cmdletbinding()]
    Param(
        [Parameter(HelpMessage = "The color of the description text.")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string]$TextColor = "GreenYellow",

        [Parameter(HelpMessage = "The color of the border.")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string]$BorderColor = "Gold1",

        [Parameter(HelpMessage = 'Force downloading the RSS feed.')]
        [switch]$Force
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using pwshSpectreConsole version $((Get-Module pwshSpectreConsole).version)"

    _getFeed -Force:$Force
    $dt = (Get-Item $tmpXml).LastWriteTime
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using data from $tmpXml [$dt]"
    [xml]$feed = Get-Content $tmpXml
    $channel = $feed.rss.channel

    $img = Get-SpectreImage $PSScriptRoot\..\images\podcast-logo-thumbnail.jpg -MaxWidth 20

    #break $summary into a 80 character line but break spaces not the middle of a word
    $description = $channel.description -split '(.{1,80})(\s|$)' | Where-Object { $_ -ne "" } | ForEach-Object { $_.Trim() } | Where {$_} | Out-String
    [datetime]$lastUpdate =$channel.pubDate
    $homeLink = $feed.rss.channel.link[-1]
    $title = "[link=$homeLink]The PowerShell Podcast[/]"
    $totalEpisodes = $feed.rss.channel.item.count

    $data = @"

[italic $TextColor]$description[/]
Hosted by     : [link=https://andrewpla.tech/]Andrew Pla[/]
Last updated  : $($lastUpdate.ToLongDateString())
Total Episodes: $totalEpisodes
Sponsored by  : [link=https://pdq.com]PDQ.com[/]

"@

#insert a return after the prompt
write-Host "`r"
@($img,$data) | Format-SpectreColumns| Format-SpectrePanel -Title $title -Color $BorderColor | Out-SpectreHost

 Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}

<# --> [link=https://www.linkedin.com/in/andrewplatech/]Find Andrew on LinkedIn[/]
--> [link=https://bsky.app/profile/andrewpla.tech]Find Andrew on Bluesky[/] #>
#@($img,$data) | Format-SpectreRows | Format-SpectrePanel -Title $title -Color Gold1 | Out-SpectreHost
#@($img,$data) | Format-SpectreColumns -Title $title -Color Gold1 | Out-SpectreHost