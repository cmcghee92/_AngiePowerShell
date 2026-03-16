$fortunes = @(
    "Yes, definitely."
    "No, not today."
    "The signs point to success."
    "Ask again later."
    "A surprise is coming your way."
)

$question = Read-Host "Ask the Fortune Teller a question"

if ($question -ne "") {
    $answer = Get-Random -InputObject $fortunes
    Write-Host "$answer"
}
else {
    Write-Host "You must ask a question first."
}