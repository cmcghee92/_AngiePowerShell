# Simple Software Inventory Tool

$software = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
Where-Object { $_.DisplayName }

$software | Select-Object DisplayName, DisplayVersion, Publisher |
Sort-Object DisplayName |
Format-Table -AutoSize