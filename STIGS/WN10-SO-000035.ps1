<#
.SYNOPSIS
    This PowerShell script sets the RequireSignOrSeal registry value to 1, which enforces secure channel signing and sealing in NetLogon.

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-06-16
    Last Modified   : 2025-06-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000035


.USAGE
  
    PS C:\> .\STIG-ID-WN10-SO-000035.ps1 
#>


# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\NetLogon\Parameters"

# Check if the path exists, create if not
if (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set RequireSignOrSeal to 1 (DWORD)
New-ItemProperty -Path $regPath -Name "RequireSignOrSeal" -Value 1 -PropertyType DWORD -Force

Write-Output "NetLogon RequireSignOrSeal set to 1 successfully."
