$number = Get-Random -Minimum 1 -Maximum 21
$guess = 0

Write-Host "Welcome to Guess the Number!" -ForegroundColor Cyan
Write-Host "I'm thinking of a number between 1 and 20." -ForegroundColor Yellow

while ($guess -ne $number) {
    $guess = Read-Host "Enter your guess"

    if ([int]$guess -lt $number) {
        Write-Host "Too low!" -ForegroundColor Red
    }
    elseif ([int]$guess -gt $number) {
        Write-Host "Too high!" -ForegroundColor Red
    }
    else {
        Write-Host "Correct! You guessed it!" -ForegroundColor Green
    }
}