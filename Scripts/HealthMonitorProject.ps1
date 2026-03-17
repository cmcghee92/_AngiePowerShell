function Show-Menu {
    Write-Host ""
    Write-Host "===== HELP DESK TOOL =====" -ForegroundColor Cyan
    Write-Host "1. Show IP address"
    Write-Host "2. Check disk space"
    Write-Host "3. List stopped services"
    Write-Host "4. Show recent event log errors"
    Write-Host "5. Test network connection"
    Write-Host "6. Exit"
    Write-Host ""
}

function Show-IPInfo {
    Write-Host ""
    Write-Host "IP Address Information:" -ForegroundColor Yellow
    Get-NetIPAddress -AddressFamily IPv4 |
        Where-Object { $_.IPAddress -ne "127.0.0.1" } |
        Select-Object InterfaceAlias, IPAddress
}

function Show-DiskSpace {
    Write-Host ""
    Write-Host "Disk Space Information:" -ForegroundColor Yellow
    Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
        Select-Object DeviceID,
                      @{Name="Size(GB)";Expression={[math]::Round($_.Size / 1GB, 2)}},
                      @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}
}

function Show-StoppedServices {
    Write-Host ""
    Write-Host "Stopped Services:" -ForegroundColor Yellow
    Get-Service |
        Where-Object { $_.Status -eq "Stopped" } |
        Select-Object Name, DisplayName, Status
}

function Show-RecentErrors {
    Write-Host ""
    Write-Host "Recent System Event Log Errors:" -ForegroundColor Yellow
    Get-EventLog -LogName System -EntryType Error -Newest 5 |
        Select-Object TimeGenerated, Source, EventID, Message
}

function Test-Network {
    Write-Host ""
    $target = Read-Host "Enter a computer name or website to test"

    if ([string]::IsNullOrWhiteSpace($target)) {
        Write-Host "You must enter a target." -ForegroundColor Red
    }
    else {
        Write-Host ""
        Write-Host "Testing connection to $target ..." -ForegroundColor Yellow
        Test-Connection -ComputerName $target -Count 2
    }
}

function Read-Host {
    Read-Host "Press Enter to return to the menu"
    
}

do {
    Show-Menu
    $choice = Read-Host "Choose an option"

    switch ($choice) {
        "1" {
            Show-IPInfo
            Read-Host
        }
        "2" {
            Show-DiskSpace
            Read-Host
        }
        "3" {
            Show-StoppedServices
            Read-Host
        }
        "4" {
            Show-RecentErrors
            Read-Host
        }
        "5" {
            Test-Network
            Read-Host
        }
        "6" {
            Write-Host "Exiting Help Desk Tool..." -ForegroundColor Magenta
        }
        default {
            Write-Host "Invalid choice. Please select 1 through 6." -ForegroundColor Red
            Read-Host
        }
    }

} while ($choice -ne "6")