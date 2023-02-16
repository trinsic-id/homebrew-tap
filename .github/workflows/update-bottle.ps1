param([string]$Version = "v1.8.0")

$Version = $Version.Replace("v","")
Write-Host "Updating bottle .tar.gz to $Version"

# TODO - Refactor this if needed elsewhere?
Set-Location $PSScriptRoot/../../Formula
$TargetFile = "trinsic-cli.rb"

$ContainerInformation = (Get-Content -Path $TargetFile -Raw)
$UpdatedContainerInfo = ([Regex]'(\d+\.\d+\.\d+)').Replace($ContainerInformation, $Version)
Set-Content $UpdatedContainerInfo -Path $TargetFile -NoNewline

# Download relevant file
$Match = Select-String "\surl\s`"(.*)`"$" -Path $TargetFile
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