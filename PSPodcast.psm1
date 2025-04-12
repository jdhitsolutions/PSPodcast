#region Main

Get-ChildItem -path $PSScriptRoot\functions\*.ps1 |
ForEach-Object { . $_.FullName}

#use the version value in module functions' verbose output
$modName = ($MyInvocation.MyCommand).name.split(".")[0]
$modVer = (Test-ModuleManifest $PSScriptRoot\$modName.psd1).Version
#endregion

#region type extensions

Update-TypeData -MemberType ScriptMethod -TypeName 'PSPodcastInfo' -MemberName 'DownloadShow' -Value {
    Param([string]$Path = $Home)
    $file = Join-Path -Path $Path -ChildPath "PowerShellPodcast-$($this.Episode).mp3"
    Invoke-WebRequest -Uri $this.DownloadLink -OutFile $file -errorAction Stop
} -Force

Update-TypeData -MemberType AliasProperty -TypeName 'PSPodcastInfo' -MemberName 'Online' -Value 'Link' -Force

#endregion

#add argument completers for these parameters
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