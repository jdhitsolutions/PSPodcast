Function Show-LatestPSPodcast {
    [cmdletbinding()]
    [alias('pspod')]
    [OutputType('Spectre.Console.Panel')]
    Param(
        [Parameter(HelpMessage = "The color of the title text.")]
        [string]$TitleColor = "SpringGreen2",
        [Parameter(HelpMessage = "The color of the link text.")]
        [string]$LinkColor = "DeepSkyBlue2",
        [Parameter(HelpMessage = "The color of the border.")]
        [string]$BorderColor = "GreenYellow",
        [Parameter(HelpMessage = "Display the podcast information once every 24 hours. Use this when running this command in your profile script.")]
        [switch]$Profile
    )

    <#
        The path to the flag file used with the -Profile parameter
        to limit display to once every 24 hours.
    #>
    $profileFlag = Join-Path -path $HOME -ChildPath pspod.flag
    #Test for flag file ignoring any errors if the file doesn't exist
    $flag = Get-Item -Path $profileFlag -ErrorAction Ignore

    #bail out if the flag is less than 24 hours old and the -Profile switch is used
    if ($profile -AND $flag) {
        $flagAge = New-TimeSpan -Start $flag.LastWriteTime -End (Get-Date)
        if ($flagAge.TotalHours -lt 24) {
            Return
        }
    }

    Try {
        $r = Get-PSPodcast -Last 1 -ErrorAction Stop
    }
    Catch {
        Write-Error "Failed to retrieve the latest episode of the PowerShell Podcast. $($_.Exception.Message)"
        return
    }

    if ($r) {

    #Define the text to display in the panel
    $show = @"
[bold $TitleColor]$($r.title) :microphone: $($r.Length)[/]

[italic]$($r.description)[/]

[underline $LinkColor]$($r.link)[/]
"@

        #define the panel title
        $title = "Latest from The PowerShell Podcast: Episode {0} {1}" -f $r.Episode, $r.Date.ToShortDateString()

        $paramHash = @{
            Data   = $show
            Header  = $title
            Border = 'Rounded'
            Color  = $BorderColor
        }

        Format-SpectrePanel @paramHash

        if ($Profile) {
            $r | ConvertTo-JSON | Out-File -FilePath $profileFlag -Force -Encoding utf8
        }
    } #if podcast data
} #close function

