#These are private, internal functions

#define a private function for testing availability of podbean.com
function _testFeed {
    Write-Verbose "[$((Get-Date).TimeOfDay)] Testing https://feed.podbean.com"
    $r = Invoke-RestMethod -Uri 'https://feed.podbean.com'
    if ($r -eq 'OK') {
        return $true
    }
    else {
        return $false
    }
}


function _getFeed {
    [cmdletbinding()]
    param([switch]$Force)

    if ($Force -or (-not (Test-Path -Path $tmpXml)) -or ((Get-Date) - (Get-Item $tmpXml).LastWriteTime).TotalHours -gt 24) {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Downloading the podcast RSS feed from $rssFeed"
        $runningJob = $dlJob | where { $_.State -eq 'Run' }
        if ($runningJob) {
            #wait for job to complete
            Write-Verbose "[$((Get-Date).TimeOfDay)] Waiting for job to complete"
            $runningJob | Wait-Job
        }
        else {
            try {
                Write-Verbose "[$((Get-Date).TimeOfDay)] Saving the RSS feed to $tmpXml"
                #This is faster than using Invoke-RestMethod
                Invoke-WebRequest -Uri $rssFeed -OutFile $tmpXml -ErrorAction Stop
            }
            catch {
                throw "Cannot retrieve XML feed from $rssFeed. $($_.Exception.Message)"
            }
        }
    }
}