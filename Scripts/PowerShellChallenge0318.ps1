# Simple Software Inventory Tool-Project 3

$software = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
Where-Object { $_.DisplayName }

$software | Select-Object DisplayName, DisplayVersion, Publisher |
Sort-Object DisplayName |
Format-Table -AutoSize

# Service Restart Automation Tool-Project 9

$services = Get-Service | Where-Object { $_.Status -eq "Stopped" }

$services | Select-Object Name, DisplayName, Status |
Format-Table -AutoSize