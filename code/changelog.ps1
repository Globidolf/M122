param([string]$source)
$changelogversion = "clv1.0"

$dateFormat = "yyyy-MM-dd-HH-mm-ss-ffff";

$log = "clv1.0`n$source`n$(Get-Date -Format $dateFormat )" 

function Recourse-ChangeLog-Folders ([string]$folder) {
	$log = "$folder`nSUB"
	foreach ($file in Get-ChildItem $folder -File ) {
		$log = "$log`n`"$file`" $(Get-Date $file.LastWriteTime -Format $dateFormat )"
	}
	foreach ($sub in Get-ChildItem $folder -Directory) {
		$log = "$log $(Recourse-ChangeLog-Folders $sub)"
	}
	$log = "$log`nEND"
	return $log
}


foreach ($file in Get-ChildItem $source -File ) {
	$log = "$log`n`"$file`" $(Get-Date $file.LastWriteTime -Format $dateFormat )"
}
foreach ($sub in Get-ChildItem $source -Directory ) {
	$log = "$log`n$(Recourse-ChangeLog-Folders $sub)"
}

$log > .changelog