##Write a PowerShell script that: Creates an Organizational Unit (OU) named "London" if it does not exist. If it does exist, Write a message to the console stating that it already exists. HINT: Use IF ELSE logic##

$OUName = "London" 

$DomainDN = "DC=Adatum,DC=com" 

$OUPath = "OU=$OUName,$DomainDN" 

$OU = Get-ADOrganizationalUnit -Filter "Name -eq '$OUName'" -ErrorAction SilentlyContinue
#Part 1
if ($OU) {
    Write-Host "$OUName OU already exists."
}
else {
    New-ADOrganizationalUnit -Name $OUName -Path $DomainDN
    Write-Host "$OUName OU created."
}
#Part 2 
New-ADGroup -Name "London Users" -GroupScope Global -GroupCategory Security -Path $OUPath
Write-Host "London Users group created in $OUName OU."
Get-ADGroup -Filter "Name -eq 'London Users'" -ErrorAction SilentlyContinue 
Get-ADGroup "London Users" | Select-Object Name, DistinguishedName

#Part 3
Get-ADOrganizationalUnit -Filter "Name -eq 'Sales'" | Select-Object Name, DistinguishedName
$SalesOU = "OU=Sales,DC=Adatum,DC=com"
Get-ADUser -SearchBase $SalesOU -Filter "City -eq 'London'" -Properties City | Select-Object Name, SamAccountName, City, DistinguishedName
Get-ADUser -SearchBase $OUPath -Filter * | Select-Object Name, SamAccountName

#Part 4
Get-ADUser -SearchBase $OUPath -Filter * | Select-Object SamAccountName
Get-ADUser -SearchBase $OUPath -Filter * | Select-Object SamAccountName | ForEach-Object {Add-ADGroupMember -Identity "London Users" -Members $_.SamAccountName}
Write-Host "All users in $OUName OU have been added to the London Users group."
Get-ADGroupMember "London Users" | Select-Object Name, SamAccountName
