Function Get-PSPodcastModule {
    [cmdletbinding()]
    [OutputType("String")]
    [alias("podmod")]
    Param(
        [Parameter(HelpMessage = "Write raw, unformatted data to the pipeline.")]
        [Alias("Raw")]
        [switch]$DataOnly
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Using pwshSpectreConsole version $((Get-Module pwshSpectreConsole).version)"

    Write-Verbose "[$((Get-Date).TimeOfDay)] Getting PSPodcast module commands"

    # 26 April 2025 Modified to use Get-Module. Get-Command appears to be running in the module
    # scope and includes private, non-exported functions.
    #$cmds = Get-Command -module PSPodcast
    $cmds = (Get-Module -Name PSPodcast).ExportedFunctions.Keys | Get-Command

    Write-Verbose "[$((Get-Date).TimeOfDay)] Found $($cmds.count) commands in the module"

    if ($DataOnly) {
        $cmds | Select-Object -property Name,
        @{Name="Alias";Expression={(Get-Alias -Definition $_.Name -ErrorAction SilentlyContinue).Name -join ',' }},
        @{Name="Synopsis";Expression = { (Get-Help $_.name).Synopsis}}
    }
    else {
        $title = "`n[link=https://github.com/jdhitsolutions/PSPodcast]PSPodcast [[v$($cmds[0].version)]][/]"
        $cmds | Select-Object -property @{Name="Command";
        Expression = {
            $uri = (Get-Help $_.Name).relatedLinks.navigationLink.uri[0]
            if ($uri) {
                "[link=$uri]$($_.Name)[/]"
            } else {
                $_.Name
            }
        }},
        @{Name="Alias";Expression={
            $alias = (Get-Alias -Definition $_.Name -ErrorAction SilentlyContinue).Name -join ','
            "[Gold1 italic]$alias[/]"
        }},
        @{Name="Synopsis";Expression = { (Get-Help $_.name).Synopsis}} |
        Format-SpectreTable -Title $Title -Color gold1 -HeaderColor SpringGreen2 -AllowMarkup -wrap |
        Out-SpectreHost
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}