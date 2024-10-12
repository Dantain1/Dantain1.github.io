# Updated Cool PowerShell Menu Script with GitHub Integration

$scriptUrl = "https://raw.githubusercontent.com/Dantain1/Dantain1.github.io/refs/heads/main/Whatismyip.ps1"

function Show-Menu {
    Clear-Host
    Write-Host @"
    =======================================
    |                                     |
    |        IP Address Checker           |
    |                                     |
    =======================================
    |                                     |
    |  [1] Check My IP Addresses          |
    |  [Q] Quit                           |
    |                                     |
    =======================================
"@ -ForegroundColor Cyan
}

function Run-GitHubScript {
    Write-Host "Fetching and running IP address script from GitHub..." -ForegroundColor Yellow
    try {
        $scriptContent = Invoke-WebRequest -Uri $scriptUrl -UseBasicParsing | Select-Object -ExpandProperty Content
        Invoke-Expression $scriptContent
    }
    catch {
        Write-Host "Error: Unable to fetch or run the script from GitHub." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Write-Host "`nPress any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    
    switch ($choice) {
        '1' { Run-GitHubScript }
        'Q' { 
            Write-Host "Exiting..." -ForegroundColor Red
            return
        }
        default {
            Write-Host "Invalid choice. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
} while ($choice -ne 'Q')
