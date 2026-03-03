$logname = 'System'
$Newest=(Read-Host "Please enter your request here:")
Get-EventLog -LogName $logname -Newest 3 