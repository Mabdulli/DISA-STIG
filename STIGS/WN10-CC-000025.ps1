<#
.SYNOPSIS
   This PowerShell script modifies the Windows Registry to configure network security settings by disabling IP source routing. 

.NOTES
    Author          : Mohamed Abdullahi
    LinkedIn        : linkedin.com/in//
    GitHub          : github.com/Mabdulli
    Date Created    : 2025-07-06
    Last Modified   : 2025-07-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000025.ps1 
#>


$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "DisableIPSourceRouting"
$regValue = 2

# Check if the path exists
if (-not (Test-Path $regPath)) {
    Write-Error "Registry path does not exist: $regPath"
} else {
    try {
        Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
        Write-Output "Successfully set $regName to $regValue at $regPath"
    } catch {
        Write-Error "Failed to set registry value: $_"
    }
}
