#a function to display a brief summary about the podcast.

Function Get-AboutPSPodcast {
    [cmdletbinding()]
    [alias("aboutpod")]
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
        [switch]$Force,
        [Parameter(HelpMessage = "Write raw, unformatted data to the pipeline.")]
        [Alias("Raw")]
        [switch]$DataOnly
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using pwshSpectreConsole version $((Get-Module pwshSpectreConsole).version)"

    _getFeed -Force:$Force

    $dt = (Get-Item $tmpXml).LastWriteTime
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using data from $tmpXml [$dt]"
    [xml]$feed = Get-Content $tmpXml
    $channel = $feed.rss.channel

    $img = Get-SpectreImage (Join-Path $PSScriptRoot '..' 'images' 'podcast-logo-thumbnail.jpg') -MaxWidth 20

    #break $summary into a 80 character line but break spaces not the middle of a word
    $description = $channel.description -split '(.{1,80})(\s|$)' | Where-Object { $_ -ne "" } | ForEach-Object { $_.Trim() } | Where {$_} | Out-String
    [datetime]$lastUpdate =$channel.pubDate
    $homeLink = $feed.rss.channel.link[-1]
    $title = "[link=$homeLink]The PowerShell Podcast[/]"
    $totalEpisodes = $feed.rss.channel.item.count


# 12 May 2025 Revised to display an image of Andrew.
    $andrew = Get-SpectreImage (Join-Path $PSScriptRoot '..' 'images' 'andrew-pla.jpg') -MaxWidth 12
    $R1 = "[italic $TextColor]$description[/]"
$info = @"
Hosted by     : [$BorderColor link=https://andrewpla.tech/]Andrew Pla[/]
Last updated  : $($lastUpdate.ToLongDateString())
Total episodes: $totalEpisodes
Sponsored by  : [link=https://pdq.com]PDQ.com[/]

"@
    $R2 = @($info,$andrew) | Format-SpectreColumns -Padding 5  | Format-SpectreRows

    $data = @($R1,$R2) | Format-SpectreColumns

    if ($DataOnly) {
        [PSCustomObject]@{
            Host          = 'Andrew Pla'
            LastUpdate    = $lastUpdate
            TotalEpisodes = $totalEpisodes
            Online        = 'https://powershellpodcast.podbean.com/'
            Sponsor       = 'PDQ.com'
        }
    }
    else {
        #insert a return after the prompt
        Write-Host "`r"
        @($img,$data) | Format-SpectreColumns | Format-SpectrePanel -Title $title -Color $BorderColor | Out-SpectreHost
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}
