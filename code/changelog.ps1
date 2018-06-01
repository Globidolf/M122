param([string]$source)
$changelogversion = "clv1.0"

$dateFormat = "yyyy-MM-dd-HH-mm-ss-ffff";

$log = "$changelogversion`n$source`n$(Get-Date -Format $dateFormat )" 

function Recourse-ChangeLog-Folders ([string]$folder) {
	$log = ""
	foreach ($file in Get-ChildItem $folder -File ) {
		$log = "$log`n`"$file`" $(Get-Date $file.LastWriteTime -Format $dateFormat )"
	}
	foreach ($sub in Get-ChildItem $folder -Directory) {
		$log = "$log`n`"$sub`"`nSUB$(Recourse-ChangeLog-Folders "$folder\$sub")`nEND"
	}
	return $log
}


foreach ($file in Get-ChildItem $source -File ) {
	$log = "$log`n`"$file`" $(Get-Date $file.LastWriteTime -Format $dateFormat )"
}
foreach ($sub in Get-ChildItem $source -Directory ) {
	$log = "$log`n`"$sub`"`nSUB$(Recourse-ChangeLog-Folders "$source\$sub")`nEND"
}

$log > "$source\.changelog"

Write-Output "success`noutput: $Source\.changelog"