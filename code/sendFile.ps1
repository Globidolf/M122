param([string]$Dir,[stirng]$ftp,[string]$user, [string]$pass)

$webclient = New-Object System.Net.WebClient

$webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass)

#list every sql server trace file
foreach($item in (Get-ChildItem $Dir "*.trc")){
    Write-Output "Uploading $item..."
    $uri = New-Object System.Uri($ftp+$item.Name)
    $webclient.UploadFile($uri, $item.FullName)
}