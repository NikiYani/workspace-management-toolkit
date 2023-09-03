<#
.Description
Ubuntu installation script
#>

param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$DistributionName,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$InstallLocation,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$UserName,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$UserPassword,

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [bool]$DevTools
)

Clear-Host
Write-Host "----------------------------------" -ForegroundColor blue
Write-Host "---Ubuntu distribution download---" -ForegroundColor blue
Write-Host "----------------------------------" -ForegroundColor blue
Write-Host

if (-Not (Test-Path -Path .\temp)) { 
    $tempDir = mkdir .\temp 
}

if (-Not (Test-Path -Path $tempDir\ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz)) {
    curl.exe --ssl-no-revoke -L -o $tempDir\ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz https://cloud-images.ubuntu.com/wsl/jammy/current/ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz
}

Clear-Host;
Write-Host "---------------------------------" -ForegroundColor blue
Write-Host "---Ubuntu installation process---" -ForegroundColor blue
Write-Host "---------------------------------" -ForegroundColor blue
Write-Host

if (-Not (Test-Path -Path $InstallLocation)) {
    mkdir $InstallLocation
}

wsl --import $DistributionName $InstallLocation $tempDir\ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz

Remove-Item -r $tempDir

wsl -d $DistributionName -u root bash -ic "apt update && sudo apt upgrade -y"

wsl -d $DistributionName -u root bash -ic "mkdir /home/scripts "
Copy-Item -Path ".\ubuntuSetup\*" -Destination "\\wsl.localhost\$DistributionName\home\scripts\"
wsl -d $DistributionName -u root bash -ic "chmod +x -R /home/scripts/"

wsl -d $DistributionName -u root bash -ic "/home/scripts/createUser.sh $UserName $UserPassword"

if($DevTools -eq $True) {
    wsl -d $DistributionName -u root bash -ic "/home/scripts/baseUtils.sh"
    wsl -d $DistributionName -u root bash -ic "/home/scripts/boost.sh"
    wsl -d $DistributionName -u root bash -ic "/home/scripts/qt.sh"
}

wsl -t $DistributionName

Remove-Item -r "\\wsl.localhost\$DistributionName\home\scripts\"