param([string]$source, [string]$target)
.\code\getFile.ps1 "$source\.changelog" "$target\.templog"

foreach($line in Get-Content "$target\.templog"){
    $File = #get filename from line
    .\code\getFile.ps1 "$source\$File" "$target\$File"
}