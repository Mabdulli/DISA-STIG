<#
.SYNOPSIS
    This PowerShell script disables camera access from the lock screen by setting NoLockScreenCamera to 1 

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-07-06
    Last Modified   : 2025-07-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005



.USAGE
  
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>



$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regName = "NoLockScreenCamera"
$desiredValue = 1

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
try {
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
    Write-Output "Successfully set $regName to $desiredValue at $regPath"
} catch {
    Write-Error "Failed to set registry value: $_"
}
