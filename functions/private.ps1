#These are private, internal functions

#define a private function for testing availability of podbean.com
function _testFeed {
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
    Param([switch]$Force)

    If ($Force -OR (-Not (Test-Path -Path $tmpXml)) -OR ((Get-Date) - (Get-Item $tmpXml).LastWriteTime).TotalHours -gt 24) {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Downloading the podcast RSS feed from $rssFeed"
        Try {
            Write-Verbose "[$((Get-Date).TimeOfDay)] Saving the RSS feed to $tmpXml"
            #This is faster than using Invoke-RestMethod
            Invoke-WebRequest -Uri $rssFeed -OutFile $tmpXml -ErrorAction Stop
        }
        Catch {
            Throw "Cannot retrieve XML feed from $rssFeed. $($_.Exception.Message)"
        }
    }
}