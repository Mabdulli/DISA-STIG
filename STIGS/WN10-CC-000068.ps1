<#
.SYNOPSIS
    This PowerShell script enables support for Restricted Admin mode or Remote Credential Guard by setting AllowProtectedCreds to 1, as required by STIG ID: WN10-CC-000068.

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-07-06
    Last Modified   : 2025-07-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000068

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  
    PS C:\> .\STIG-ID-WN10-CC-000068.ps1 
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"
$regName = "AllowProtectedCreds"
$desiredValue = 1

# Create the registry key if it does not exist
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
