<#
.SYNOPSIS
    This PowerShell script modifies the Windows Registry to enforce a minimum PIN length of 6 digits for BitLocker pre-boot authentication by setting MinimumPIN to 6

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-07-07
    Last Modified   : 2025-07-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000032



.USAGE
  
    PS C:\> .\STIG-ID-WN10-00-000032.ps1 
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$regName = "MinimumPIN"
$minPinLength = 6

# Create registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MinimumPIN value
try {
    Set-ItemProperty -Path $regPath -Name $regName -Value $minPinLength -Type DWord
    Write-Output "Successfully set $regName to $minPinLength at $regPath"
} catch {
    Write-Error "Failed to set registry value: $_"
}
