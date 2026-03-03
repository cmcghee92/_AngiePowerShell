##Write a PowerShell script that: Creates an Organizational Unit (OU) named "London" if it does not exist. If it does exist, Write a message to the console stating that it already exists. HINT: Use IF ELSE logic##

$OUName = "London" 

$DomainDN = "DC=Adatum,DC=com" 

$OUPath = "OU=$OUName,$DomainDN" 

$OU = Get-ADOrganizationalUnit -Filter "Name -eq '$OUName'" -ErrorAction SilentlyContinue

if ($OU) {
    Write-Host "$OUName OU already exists."
}
else {
    New-ADOrganizationalUnit -Name $OUName -Path $DomainDN
    Write-Host "$OUName OU created."
}


