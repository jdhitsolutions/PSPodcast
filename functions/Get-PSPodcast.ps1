Function Get-PSPodcast {
    [cmdletbinding()]
    [OutputType('PSPodcastInfo')]
    Param(
        [Parameter(
            Position = 0,
            HelpMessage = 'The number of most recent episodes to show. The default is 1. The maximum is 100.'
        )]
        [ValidateRange(1, 100)]
        [int]$Last = 4
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"

    $rssFeed = 'https://feed.podbean.com/powershellpodcast/feed.xml'
    Write-Verbose "[$((Get-Date).TimeOfDay)] Downloading the podcast RSS feed from $rssFeed"

    #Using .NET to support cross-platform
    $tmp = [system.io.path]::GetTempPath()
    $tmpXml = Join-Path -Path $tmp -ChildPath 'feed.xml'
    Try {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Saving the RSS feed to $tmpXml"
        #This is faster than using Invoke-RestMethod
        Invoke-WebRequest -Uri $rssFeed -OutFile $tmpXml -ErrorAction Stop
    }
    Catch {
        Throw $_
    }
    if (Test-Path $tmpXml) {
        [xml]$feed = Get-Content -Path $tmpXml
        Write-Information -MessageData $feed -tag raw
        Write-Verbose "[$((Get-Date).TimeOfDay)] Retrieving the last $Last episodes from the RSS feed"
        $data = $feed.rss.channel.item | Select-Object -First $Last
        foreach ($item in $data) {
            Write-Information -MessageData $item -tag raw
            #convert the duration to a TimeSpan
            $timeElements = $item.duration -split ':'
            if ($timeElements.count -eq 3) {
                $runTime = New-TimeSpan -Hours $timeElements[0] -Minutes $timeElements[1] -Seconds $timeElements[2]
            }
            elseif ($timeElements.count -eq 2) {
                $runTime = New-TimeSpan -Minutes $timeElements[0] -Seconds $timeElements[1]
            }
            else {
                Write-Error "Invalid duration format: $($item.duration)"
            }

            [regex]$link = 'http(s)?:\/\/.*'
            #extract links
            $Links = $link.Matches($item.summary.'#cdata-section').value.Foreach({$_.trim()})
            #get the YouTube link if it exists
            [regex]$watchLink = 'Power[Ss]hell Podcast.*?(YouTube)?:\shttps:\/\/(www\.)?you.*'
            [regex]$YT = 'https:\/\/(www\.)?you.*\w'
            $linkMatch = $watchLink.Match($item.summary.'#cdata-section').value
            if ($linkMatch) {
                $YouTubeLink = $yt.match($linkMatch).value
            }
            else {
                $YouTubeLink = $null
            }
            [PSCustomObject]@{
                PSTypeName   = 'PSPodcastInfo'
                Title        = $item.title[0]
                Date         = $item.pubDate -as [datetime]
                Description  = ($item.summary.'#cdata-section' -split "`n")[0]
                Length       = $runTime
                Link         = $item.link
                Episode      = $item.episode
                DownloadLink = $item.enclosure.url
                ShowLinks    = $Links -split " "
                YouTube      = $YouTubeLink
            }
        } #foreach item
        #clean up the temp file
        Write-Verbose "[$((Get-Date).TimeOfDay)] Removing the temporary file $tmpXml"
        Remove-Item -Path $tmpXml
    } #if Test-Path

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"

} #close function




