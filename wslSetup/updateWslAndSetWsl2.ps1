<#
.Description
Update WSL and set WSL2 script
#> 

Clear-Host
Write-Host "-----------------------------" -ForegroundColor blue
Write-Host "---Update wsl and set WSL2---" -ForegroundColor blue
Write-Host "-----------------------------" -ForegroundColor blue
Write-Host

if (-Not (Test-Path -Path .\temp)) { 
    $dir = mkdir .\temp 
}

curl.exe -L -o .\temp\wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

.\temp\wsl_update_x64.msi /quiet

wsl --set-default-version 2