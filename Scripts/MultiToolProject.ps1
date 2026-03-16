do {
    Clear-Host
    Write-Host "=============================" -ForegroundColor Cyan
    Write-Host "     PowerShell Utility App   " -ForegroundColor Yellow
    Write-Host "=============================" -ForegroundColor Cyan
    Write-Host "1. Disk Cleanup"
    Write-Host "2. Service Monitor"
    Write-Host "3. Guessing Game"
    Write-Host "4. Exit"
    Write-Host ""

    $choice = Read-Host "Enter your choice (1-4)"

    switch ($choice) {
        "1" {
            Write-Host ""
            Write-Host "DISK CLEANUP" -ForegroundColor Green

            $folder = Read-Host "Enter folder path"
            $days = Read-Host "Enter age in days"

            $oldFiles = Get-ChildItem -Path $folder -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-[int]$days) }

            if ($oldFiles.Count -gt 0) {
                Write-Host "Old files found:" -ForegroundColor Yellow
                $oldFiles | Select-Object Name, LastWriteTime

                $deleteChoice = Read-Host "Delete these files? (Y/N)"
                if ($deleteChoice -eq "Y") {
                    $oldFiles | Remove-Item -Force
                    Write-Host "Files deleted." -ForegroundColor Red
                }
                else {
                    Write-Host "No files were deleted." -ForegroundColor Cyan
                }
            }
            else {
                Write-Host "No old files found." -ForegroundColor Cyan
            }

            Pause
        }

        "2" {
            Write-Host ""
            Write-Host "SERVICE MONITOR" -ForegroundColor Green

            $services = "Spooler", "wuauserv", "BITS"

            foreach ($service in $services) {
                $result = Get-Service -Name $service -ErrorAction SilentlyContinue

                if ($result) {
                    if ($result.Status -eq "Running") {
                        Write-Host "$service is running." -ForegroundColor Green
                    }
                    else {
                        Write-Host "$service is stopped." -ForegroundColor Red
                    }
                }
                else {
                    Write-Host "$service was not found." -ForegroundColor Yellow
                }
            }

            Pause
        }

        "3" {
            Write-Host ""
            Write-Host "GUESSING GAME" -ForegroundColor Green

            $secretNumber = Get-Random -Minimum 1 -Maximum 11
            $guess = 0
            $tries = 0

            while ($guess -ne $secretNumber) {
                $guess = [int](Read-Host "Guess a number between 1 and 10")
                $tries++

                if ($guess -lt $secretNumber) {
                    Write-Host "Too low!" -ForegroundColor Yellow
                }
                elseif ($guess -gt $secretNumber) {
                    Write-Host "Too high!" -ForegroundColor Yellow
                }
                else {
                    Write-Host "Correct! You guessed it in $tries tries." -ForegroundColor Green
                }
            }

            Pause
        }

        "4" {
            Write-Host "Exiting program..." -ForegroundColor Cyan
        }

        default {
            Write-Host "Invalid choice. Please enter 1, 2, 3, or 4." -ForegroundColor Red
            Pause
        }
    }

} while ($choice -ne "4")