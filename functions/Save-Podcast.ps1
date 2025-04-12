Function Save-PSPodcast {
    [CmdletBinding()]
    Param(
        [Parameter(
           Position = 0,
           HelpMessage = 'The path or folder where the podcast will be saved.'
        )]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_},ErrorMessage = 'The location {0} cannot be found.')]
        [string]$Path = $Home,

        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage = 'The PSPodcastInfo object'
        )]
        [ValidateNotNullOrEmpty()]
        [Object]$PSPodcastInfo,

        [Parameter(HelpMessage = 'Show the downloaded file.')]
        [switch]$Passthru
    )

    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
        Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    }
    Process {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Saving Episode $($PSPodcastInfo.Episode) to $Path"
        $PSPodcastInfo.DownloadShow($Path)
        if ($Passthru) {
            $file = Join-Path -Path $Path -ChildPath "PowerShellPodcast-$($PSPodcastInfo.Episode).mp3"
            Get-Item -path $file
        }
    }
    End {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
    }
}