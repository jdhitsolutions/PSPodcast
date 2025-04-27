#region Main

Get-ChildItem -path $PSScriptRoot\functions\*.ps1 |
ForEach-Object {. $_.FullName }

#use the version value in module functions' verbose output
$modName = ($MyInvocation.MyCommand).name.split(".")[0]
$modVer = (Test-ModuleManifest $PSScriptRoot\$modName.psd1).Version

#save the feed XML to a temp file and use this as the data source
#for module commands.
$rssFeed = 'https://feed.podbean.com/powershellpodcast/feed.xml'

#Using .NET to support cross-platform
$tmp = [System.IO.Path]::GetTempPath()
#this will be module-scoped variable
$tmpXml = Join-Path -Path $tmp -ChildPath 'feed.xml'

#download the RSS feed if the XML temp file does not exist or is more than 24 hours old
If ((-Not (Test-Path -path $tmpXml)) -OR ((Get-Date) - (Get-Item $tmpXml).LastWriteTime).TotalHours -gt 24) {
    $r = _testFeed
    if ($r) {
        Try {
            #This is faster than using Invoke-RestMethod
            Invoke-WebRequest -Uri $rssFeed -OutFile $tmpXml -ErrorAction Stop
            #validate the file is valid XML
            Try {
                [xml]$test = Get-Content -Path $tmpXml -ErrorAction Stop
            }
            Catch {
                throw "Invalid XML file"
            }
        }
        Catch {
            #this should never get called
            $_
        }
    } #site is available
    else {
       throw "Cannot retrieve PSPodcast XML feed from $rssFeed."
    }
}

#endregion

#region add argument completers for these parameters
"BorderColor","TitleColor","LinkColor" | Foreach-Object {
    Register-ArgumentCompleter -CommandName Show-LatestPSPodcast -ParameterName $_ -ScriptBlock {
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        [Spectre.Console.Color] |
        Get-Member -Static -Type Properties |
        Where-Object name -like "$WordToComplete*"|
        Select-Object -ExpandProperty Name |
        ForEach-Object {
            $show = "[$_]$($_)[/]" | Out-SpectreHost
            [System.Management.Automation.CompletionResult]::new([Spectre.Console.Color]::$_, $show, 'ParameterValue', $_)
        }
    }
}

"BorderColor","TextColor" | Foreach-Object {
    Register-ArgumentCompleter -CommandName Get-AboutPSPodcast -ParameterName $_ -ScriptBlock {
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        [Spectre.Console.Color] |
        Get-Member -Static -Type Properties |
        Where-Object name -like "$WordToComplete*"|
        Select-Object -ExpandProperty Name |
        ForEach-Object {
            $show = "[$_]$($_)[/]" | Out-SpectreHost
            [System.Management.Automation.CompletionResult]::new([Spectre.Console.Color]::$_, $show, 'ParameterValue', $_)
        }
    }
}

"BorderColor","TitleColor" | Foreach-Object {
    Register-ArgumentCompleter -CommandName Get-PSPodcastShowNotes -ParameterName $_ -ScriptBlock {
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        [Spectre.Console.Color] |
        Get-Member -Static -Type Properties |
        Where-Object name -like "$WordToComplete*"|
        Select-Object -ExpandProperty Name |
        ForEach-Object {
            $show = "[$_]$($_)[/]" | Out-SpectreHost
            [System.Management.Automation.CompletionResult]::new([Spectre.Console.Color]::$_, $show, 'ParameterValue', $_)
        }
    }
}

#endregion

#region type extensions

# 13 April 2025 - These extensions are now in the types.ps1xml file
<#
Update-TypeData -MemberType ScriptMethod -TypeName 'PSPodcastInfo' -MemberName 'DownloadShow' -Value {
    Param([string]$Path = $Home)
    $file = Join-Path -Path $Path -ChildPath "PowerShellPodcast-$($this.Episode).mp3"
    Invoke-WebRequest -Uri $this.DownloadLink -OutFile $file -errorAction Stop
} -Force

Update-TypeData -MemberType AliasProperty -TypeName 'PSPodcastInfo' -MemberName 'Online' -Value 'Link' -Force
#>
#endregion