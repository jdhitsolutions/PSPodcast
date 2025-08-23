Function Get-PSPodcastTakeAway {
    [cmdletbinding()]
    [alias('takeaway','podpoints')]
    [OutputType('Spectre.Console.Panel')]
    Param(
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            HelpMessage = 'The PSPodcastInfo object'
        )]
        [ValidateNotNullOrEmpty()]
        [Object]$PSPodcastInfo,

        [Parameter(HelpMessage = "The color of the title text.")]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},
        ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string]$TitleColor = "SpringGreen2",

        [Parameter(HelpMessage = "The color of the link text.")]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},
        ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]

        [string]$LinkColor = "DeepSkyBlue2",

        [Parameter(HelpMessage = "The color of the border.")]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},
        ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string]$BorderColor = "GreenYellow"
    )

    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand) [$modVer]"
        Write-Verbose "[$((Get-Date).TimeOfDay)] Using PowerShell version $($PSVersionTable.PSVersion) on $($PSVersionTable.OS)"
        Write-Verbose "[$((Get-Date).TimeOfDay)] Using pwshSpectreConsole version $((Get-Module pwshSpectreConsole).version)"
    } #begin
    Process {
         Write-Verbose "[$((Get-Date).TimeOfDay)] Getting key takeaways from episode $($PSPodcastInfo.Episode)"
         Write-Information ($PSPodcastInfo | Select Title,Episode,KeyPoints | ConvertTo-Json)
        $show = @"
[bold $TitleColor]$($PSPodcastInfo.title) :microphone: $($PSPodcastInfo.Length)[/]
[italic]$($PSPodcastInfo.KeyPoints | ForEach-Object -begin {"`n"} -process {"* $($_.trim())`n"})[/]
[underline $LinkColor link]$($PSPodcastInfo.Link)[/]
"@

        $title = "Key TakeAways: Episode {0} {1}" -f $PSPodcastInfo.Episode, $PSPodcastInfo.Date.ToShortDateString()
        Write-Verbose "[$((Get-Date).TimeOfDay)] $title"
        $paramHash = @{
            Data    = $show
            Header  = $title
            Border  = 'Rounded'
            Color   = $BorderColor
        }

        Format-SpectrePanel @paramHash | Out-SpectreHost

    } #process
     End {
         Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
     }
} #close function

