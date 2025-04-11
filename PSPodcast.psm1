#region Main

Get-ChildItem -path $PSScriptRoot\functions\*.ps1 |
ForEach-Object { . $_.FullName}

#use the version value in module functions' verbose output
$modName = ($MyInvocation.MyCommand).name.split(".")[0]
$modVer = (Test-ModuleManifest $PSScriptRoot\$modName.psd1).Version
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
            [System.Management.Automation.CompletionResult]::new([Spectre.Console.Color]::$_, [Spectre.Console.Color]::$_, 'ParameterValue', $_)
        }
    }
}