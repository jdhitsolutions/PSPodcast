function Out-PodView {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, HelpMessage = "The episode object to display.")]
        [object] $Episode,

        [Parameter(HelpMessage = "The color of the description text.")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string] $TextColor = "GreenYellow",

        [Parameter(HelpMessage = "The color of the border.")]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({[Spectre.Console.Color].GetProperties().name -contains $_},ErrorMessage = "The value '{0}' is not a valid SpectreConsole color.")]
        [string] $BorderColor = "Gold1"
    )
    begin {
        # simulate format padding
        Write-Host "`n" -NoNewline
    }
    process {

        $YouTubeLink = [uri]$Episode.YouTube
        $Thumbnail = Get-SpectreImage -ImagePath ('https://img.youtube.com/vi/{0}/hqdefault.jpg' -f $YouTubeLink.Segments[-1]) -Width 35
        # image + padding
        $textArea = $host.UI.RawUI.WindowSize.Width - 40
        $Logo = Get-SpectreImage $PSScriptRoot\..\images\podcast-logo-thumbnail.jpg -MaxWidth 12
        $desc = $Episode.Description -split "(.{1,$textArea})(\s|$)" | ForEach-Object { if (-not [string]::IsNullOrWhiteSpace($_)) { $_.Trim() } } | Out-String
        $R1 = '[italic {0}]{1}[/]' -f $TextColor, $desc
        $info = @"
Youtube       : [$BorderColor link={0}]Youtube Episode #{1}[/]
Date          : {2}
Length        : {3}
Link          : [link={4}]powershellpodcast.podbean.com[/]
"@ -f $Episode.YouTube,$Episode.Episode, $Episode.Date?.ToString(), $Episode.Length, $Episode.Link

        $R2 = @($info,$Logo) | Format-SpectreColumns -Padding 5 | Format-SpectreRows
        $data = @($R1,$R2) | Format-SpectreColumns
        @($Thumbnail,$data) | Format-SpectreColumns | Format-SpectrePanel -Title $Episode.Title -Color $BorderColor -Expand | Out-SpectreHost
    }
    end {
        # simulate format padding
        Write-Host "`n" -NoNewline
    }
}
