$client = (New-Object System.Net.WebClient)
$source = "https://docs.google.com/spreadsheets/d/e/2PACX-1vRRryVKqCmKEQ_TQVK_YBKXJMWz7W5XcadctnAr1ulUcPs1WereylFA-p-YHF1f6JKXCa1uKrJznU8C/pub?gid=0&single=true&output=csv"
$target = "./out.csv"
$client.DownloadString($source) > $target