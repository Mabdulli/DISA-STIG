<#
.SYNOPSIS
    This PowerShell script modifies the Windows Registry to disable ICMP redirect processing by setting the EnableICMPRedirect value to 0

.NOTES
    Author          : Mohamed Abdullahi
    GitHub          : https://github.com/Mabdulli
    Date Created    : 2025-07-06
    Last Modified   : 2025-07-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  
    PS C:\> .\STIG-ID-WN10-CC-000030.ps1 
#>

# Set EnableICMPRedirect to 0 to disable ICMP redirect processing

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "EnableICMPRedirect"
$desiredValue = 0

# Ensure the path exists
if (-not (Test-Path $regPath)) {
    Write-Error "Registry path does not exist: $regPath"
} else {
    try {
        Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
        Write-Output "Successfully set $regName to $desiredValue at $regPath"
    } catch {
        Write-Error "Failed to set registry value: $_"
    }
}
