# First part of script

Install-Module -Name PSWindowsUpdate

Get-Command -Module PSWindowsUpdate

Get-WUList
Install-WindowsUpdate -AcceptAll -AutoReboot