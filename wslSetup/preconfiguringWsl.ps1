<#
.Description
Preconfiguring WSL script
#>

Clear-Host
Write-Host "-------------------------------------------" -ForegroundColor blue
Write-Host "---Enabling functionality for VM and WSL---" -ForegroundColor blue
Write-Host "-------------------------------------------" -ForegroundColor blue
Write-Host

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart