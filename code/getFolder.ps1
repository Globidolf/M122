<#param([string]$source, [string]$target)
.\code\getFile.ps1 "$source\.changelog" "$target\.templog"

foreach($line in Get-Content "$target\.templog"){
    $File = 
    .\code\getFile.ps1 "$source\$File" "$target\$File"
}#>

function getFolder ([string]$url, [string]$output) {
    #$wc = New-Object System.Net.WebClient
    #$wc.DownloadFile($folder, $destination)
    $uri = [System.Uri]($url)
    $directoryContentsList = Invoke-WebRequest -Uri $uri

    $uris = foreach($link in $directoryContentsList.Links.href) {
        $link_uri = [System.URI]($link)

        if($link_uri.IsAbsoluteUri) {
            $link_uri
        } else {
            if([System.Uri]::TryCreate($uri, $link,[ref]$link_uri)) {
                $link_uri
            }
        }
    }

    foreach($item in $uris) {
        if( $uri.Authority -eq $item.Authority ) {
            $file = $item.segments[-1]
            Write-Host $file
            Invoke-WebRequest -Uri $item -OutFile $file
        }
    }
}