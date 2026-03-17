$weapons = @("Baseball Bat", "Chainsaw", "Shotgun", "Frying Pan", "Crossbow", "Crowbar")
$teammates = @("A genius hacker", "A scared cat", "Your best friend", "A retired soldier", "A chaotic goblin", "A mysterious stranger")
$vehicles = @("Armored truck", "Bicycle", "Helicopter", "Shopping cart", "Motorcycle", "Old pickup truck")
$locations = @("Abandoned mall", "School rooftop", "Underground bunker", "Gas station", "Farmhouse", "Dark forest")
$survival = Get-Random -Minimum 1 -Maximum 101

Clear-Host
Write-Host "==============================" -ForegroundColor DarkGreen
Write-Host "     ZOMBIE SURVIVAL TOOL     " -ForegroundColor Green
Write-Host "==============================" -ForegroundColor DarkGreen

$name = Read-Host "Enter your name"

$weapon = Get-Random $weapons
$teammate = Get-Random $teammates
$vehicle = Get-Random $vehicles
$location = Get-Random $locations

Write-Host ""
Write-Host "$name, your zombie survival setup is:" -ForegroundColor Yellow
Write-Host "Weapon: $weapon" -ForegroundColor Cyan
Write-Host "Teammate: $teammate" -ForegroundColor Cyan
Write-Host "Vehicle: $vehicle" -ForegroundColor Cyan
Write-Host "Safe Location: $location" -ForegroundColor Cyan
Write-Host "Survival Chance: $survival%" -ForegroundColor Magenta

if ($survival -ge 75) {
    Write-Host "Result: You're built for the apocalypse." -ForegroundColor Green
}
elseif ($survival -ge 40) {
    Write-Host "Result: You might survive... if you stay alert." -ForegroundColor Yellow
}
else {
    Write-Host "Result: You're probably becoming zombie lunch." -ForegroundColor Red
}