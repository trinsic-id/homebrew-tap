param([string]$ReleaseVersion = "1.9.0", [string]$Version = "1.9.0")

$ReleaseVersion = $ReleaseVersion.Replace("v","")
$Version = $Version.Replace("v","")
Write-Host "Updating bottle .tar.gz to $Version"

# TODO - Refactor this if needed elsewhere?
Set-Location $PSScriptRoot/../../Formula
$TargetFile = "trinsic-cli.rb"

$ContainerInformation = (Get-Content -Path $TargetFile -Raw)
# Update both container version and release version - the leading space prevents matching root_url
$DownloadUrl = " url `"https://github.com/trinsic-id/sdk/releases/download/v$ReleaseVersion/trinsic-cli-$Version.tar.gz`""
$UpdatedContainerInfo = ([Regex]"\surl\s`"(.*)`"").Replace($ContainerInformation, $DownloadUrl)
#Write-Host $UpdatedContainerInfo
Set-Content $UpdatedContainerInfo -Path $TargetFile -NoNewline

# Download relevant file
$Match = Select-String "\surl\s`"(.*)`"" -Path $TargetFile
$MatchString = $Match.Matches.Groups[1].Value
Write-Host "Downloading: $MatchString"

# Get hash of downloaded file
$TargetTarGz = "trinsic-cli.tar.gz"
Invoke-WebRequest -URI $MatchString -OutFile $TargetTarGz
$FileHash = (Get-FileHash $TargetTarGz -Algorithm SHA256).Hash.ToLowerInvariant()
Remove-Item $TargetTarGz

# Update with the latest hash
$NewHash = "sha256 `"$FileHash`""
$ContainerInformation = (Get-Content -Path $TargetFile -Raw)
$UpdatedContainerInfo = ([Regex]'sha256 "[\w\d]*"').Replace($ContainerInformation, $NewHash)
Set-Content $UpdatedContainerInfo -Path $TargetFile -NoNewline