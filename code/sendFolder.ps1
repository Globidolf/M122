param([string]$source, [string]$server, [string]$user, [string]$pass)

$foldername = $source # TODO: extract folder name

#generate changelog before upload
.\changelog.ps1 $source

#download log from server
.\getFile.ps1 "$server\$foldername\.changelog" "$source\.templog"

#compare logs and get list of changed local files
$fileList = .\compare.ps1 "$source\.templog" "$source\.changelog"

#iterate files and upload them all
foreach ($file in $fileList){
	# also send credidentals if available
	.\sendFile.ps1 "$source\$file" "$server\$foldername\$file" $user $pass
}
