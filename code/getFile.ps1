param([string]$source, [string]$output="out.txt")

$client = (New-Object System.Net.WebClient)
#Specify Security Version. From https://stackoverflow.com/a/41618979/5694221
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
$client.DownloadFile($source, $output)