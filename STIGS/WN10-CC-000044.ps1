<#
.SYNOPSIS
    This PowerShell script disables the UI for Internet Connection Sharing (ICS) by setting NC_ShowSharedAccessUI to 0, as required

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-07-06
    Last Modified   : 2025-07-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  
    PS C:\> .\STIG-ID-WN10-CC-000044.ps1 
#>



$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"
$regName = "NC_ShowSharedAccessUI"
$desiredValue = 0

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the required registry value
try {
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
    Write-Output "Successfully set $regName to $desiredValue at $regPath"
} catch {
    Write-Error "Failed to set registry value: $_"
}
