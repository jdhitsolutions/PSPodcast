Function Get-PSPodcastShowNotes {
    [cmdletbinding()]
    [OutputType('Spectre.Console.Panel')]
    [Alias('ShowNotes')]

    Param(
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage = 'The PSPodcastInfo object'
        )]
        [ValidateNotNullOrEmpty()]
        [Object]$PSPodcastInfo,
        [Parameter(HelpMessage = "The color of the title text.")]
        [string]$TitleColor = "Yellow",
        [Parameter(HelpMessage = "The color of the border.")]
        [string]$BorderColor = "GreenYellow"
    )
    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
        Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    }
    Process {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Getting show notes for $($PSPodcastInfo.Episode)"
        #create a clickable link for the episode
        Write-Verbose "[$((Get-Date).TimeOfDay)] Defining a link to $($PSPodcastInfo.Link)"
        $episodeLink = "[link=$($PSPodcastInfo.Link)]$($PSPodcastInfo.Title)[/]"

        $data= @"

[italic $TitleColor]$episodeLink[/]

$($PSPodcastInfo.ShowLinks | Out-String)
"@

        $title = "Show Notes {0:d}" -f $PSPodcastInfo.Date

        Format-SpectrePanel -data $data -title $title -Color $BorderColor -Width 75 | Out-SpectreHost
    }
    End {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
    }
}