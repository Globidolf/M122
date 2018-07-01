param([string]$source, [string]$output)

#create webclient instance
$client = (New-Object System.Net.WebClient)

#Specify Security Version. Webclient doesnt do that automatically
#Learned from https://stackoverflow.com/a/41618979/5694221
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

#downlaod file to target output file
$client.DownloadFile($source, $output)