$fortunes = @(
    "The logs suggest success is near."
    "A reboot may solve more than you expect."
    "Your script will work... after one small fix."
    "The cloud is uncertain today."
    "Proceed with caution and save your work."
)

Write-Host "Welcome to the IT Oracle!" -ForegroundColor Cyan

do {

    Write-Host ""
    Write-Host "===== IT ORACLE =====" -ForegroundColor Yellow
    Write-Host "1 - Ask the Oracle"
    Write-Host "2 - Exit"
    Write-Host ""

    $choice = Read-Host "Choose an option"

    switch ($choice) {

        "1" {
            $question = Read-Host "Ask your IT question"

            if ([string]::IsNullOrWhiteSpace($question)) {
                Write-Host "You must ask a question." -ForegroundColor Red
            }
            else {
                $answer = Get-Random -InputObject $fortunes
                Write-Host ""
                Write-Host "You asked: $question" -ForegroundColor Gray
                Write-Host "Oracle says: $answer" -ForegroundColor Green
            }
        }

        "2" {
            Write-Host "The Oracle has spoken. Goodbye." -ForegroundColor Magenta
        }

        default {
            Write-Host "Invalid choice. Try again." -ForegroundColor Red
        }

    }

} while ($choice -ne "2")
