$sourceUrl = "https://antizapret.prostovpn.org/domains-export.txt"
$destinationPath = "$PWD\russia-blacklist.txt"
$userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0"

$webClient = New-Object System.Net.WebClient
$webClient.Headers.Add("User-Agent", $userAgent)

try {
    $webClient.DownloadFile($sourceUrl, $destinationPath)
    Write-Host "File downloaded successfully in $destinationPath."
} catch {
    Write-Host "Error downloading file: $_"
}
