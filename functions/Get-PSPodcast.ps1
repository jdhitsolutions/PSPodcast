Function Get-PSPodcast {
    [cmdletbinding(DefaultParameterSetName = 'last')]
    [OutputType('PSPodcastInfo')]
    [alias("gpod")]
    Param(
        [Parameter(
            Position = 0,
            HelpMessage = 'The number of most recent episodes to show. The default is 5.',
            ParameterSetName = 'last'
        )]
        [alias('Newest')]
        [int]$Last = 5,

        [Parameter(
            ParameterSetName = 'all',
            HelpMessage = 'Show all released episodes.'
        )]
        [switch]$All,

        [Parameter(
            ParameterSetName = 'episode',
            HelpMessage = 'The episode number to show.'
        )]
        [int]$Episode,

        [Parameter(
            ParameterSetName = 'query',
            HelpMessage = 'Enter a name or term to search for in the episode title or description. You will get better results with a case-sensitive query.'
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Query,

        [Parameter(HelpMessage = "Display the full show description.")]
        [switch]$Full,

        [Parameter(HelpMessage = 'Force downloading the RSS feed.')]
        [switch]$Force
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
    if ($MyInvocation.CommandOrigin -eq 'Runspace') {
        #Hide this metadata when the command is called from another command
        Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    }

    #download the RSS feed if the XML temp file does not exist or is more than 24 hours old
    # 27 April 2025 JH - moved this code to a private helper function
    _getFeed -Force:$Force
    if (Test-Path $tmpXml) {
        Try {
            #validate the file is valid XML
            [xml]$feed = Get-Content -Path $tmpXml -ErrorAction Stop
            Write-Information -MessageData $feed -tag raw
            #26 April 2025 JH show the data of the tmpXML file in the Verbose message
            $dt = (Get-Item $tmpXml).LastWriteTime
            Write-Verbose "[$((Get-Date).TimeOfDay)] Using data from $tmpXml [$dt]"
        }
        Catch {
            Write-Error "$tmpXML is an invalid XML file. You might try deleting the file and trying again. $($_.Exception.Message)"
        }
        if ($feed.rss) {
        Switch ($PSCmdlet.ParameterSetName) {
            'query' {
                $ns = @{
                    itunes = "http://www.itunes.com/dtds/podcast-1.0.dtd"
                    content = "http://purl.org/rss/1.0/modules/content/"
                }
                Write-Verbose "[$((Get-Date).TimeOfDay)] Searching for '$Query' in the RSS feed"
                #this is a case-insensitive search
                $xPath = "//item[contains(translate(title, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '$($query.ToLower())') or contains(translate(description, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), '$($Query.ToLower())')]"
                #"//item[contains(title, '$query') or contains(description, '$query')]"
                Write-Information -MessageData $xPath -tag raw
                $data = (Select-Xml -Xml $feed -XPath $xPath -Namespace $ns).Node
            }
            'last' {
                #get the last $Last episodes
                Write-Verbose "[$((Get-Date).TimeOfDay)] Retrieving the last $Last episodes"
                $data = $feed.rss.channel.item | Select-Object -First $Last
            }
            'episode' {
                 Write-Verbose "[$((Get-Date).TimeOfDay)] Searching for episode $Episode"
                $ns = @{
                    itunes = "http://www.itunes.com/dtds/podcast-1.0.dtd"
                }
                  $xPath = "//item[itunes:episode=$Episode]"
                  Write-Information -MessageData $xPath -tag raw
                  $data = (Select-Xml -Xml $feed -XPath $xPath -Namespace $ns).Node
            }
            'all' {
                #get all episodes
                Write-Verbose "[$((Get-Date).TimeOfDay)] Retrieving all episodes from the RSS feed $tmpXml"
                $data = $feed.rss.channel.item
            }
        } #Switch

        If ($data.count -gt 0) {
            Write-Verbose "[$((Get-Date).TimeOfDay)] Processing $($data.count) episodes"
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
                $Links = $link.Matches($item.summary.'#cdata-section').value.Foreach({ $_.trim() })
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

                # 12 May 2025 JH - added a parameter to display the full episode description
                if ($Full) {
                    $summary = $item.summary.'#cdata-section'
                }
                else {
                    $summary = ($item.summary.'#cdata-section' -split "`n")[0]

                }
                [PSCustomObject]@{
                    PSTypeName   = 'PSPodcastInfo'
                    Title        = $item.title[0]
                    Date         = $item.pubDate -as [datetime]
                    Description  = $summary
                    Length       = $runTime
                    Link         = $item.link
                    Episode      = $item.episode
                    DownloadLink = $item.enclosure.url
                    ShowLinks    = $Links -split ' '
                    YouTube      = $YouTubeLink
                }
            } #foreach item
            #clean up the temp file
        } #if data
        else {
            Write-Warning 'No matching episode(s) found.'
        }
    } #if valid feed
    } #if Test-Path
    else {
        Write-Warning "The RSS feed $rssFeed is not available. Please check your internet connection."
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"

} #close function




