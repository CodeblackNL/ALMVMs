# VM details
$vmName = "vs11almvm"
$vmUrl = "http://aka.ms/$vmName"
Write-Host "Downloading ALM VM '$vmName' from '$vmUrl'" -ForegroundColor Yellow

# determine file-location
$targetDirectory = "$env:USERPROFILE\Downloads\$vmName"
Write-Host "Writing files to '$targetDirectory'"
mkdir $targetDirectory -ErrorAction SilentlyContinue | Out-Null

# get the HTML containing the url's for the VM
Write-Host "Downloading web-page containing url's"
$html = (new-object net.webclient).DownloadString($vmUrl)

# get the url's from the page
$match = [regex]::Match($html, '###[^\n]*Do Not Include[^\n]*###(?<urls>.*)###[^\n]*Do Not Include[^\n]*###')
if ($match.Success) {
    # split the url's into an array
    $urls = $match.Groups["urls"].Value -split "<br\s*/>"
    Write-Host "Found $($urls.Length) url's on the page"
    
    # process each url
    foreach($url in $urls) {
        $url = $url.Trim()

        # determine the local path
        $targetPath = Join-Path $targetDirectory ([System.IO.Path]::GetFileName($url))

        # download the file, if it doesn't yet exist
        if(!(Test-Path $targetPath)) {
            Write-Host "Downloading '$targetPath'"
            (new-object net.webclient).DownloadFile($url, $targetPath)
        }
    }
}
else {
    Write-Host "Sorry, couldn't find the url's on the web-page" -BackgroundColor Red -ForegroundColor White
}
