# Cool PowerShell Menu Script

function Show-Menu {
    Clear-Host
    Write-Host @"
    =======================================
    |                                     |
    |  [1] What is my IP?                 |
    |                                     |
    |  [Q] Quit                           |
    |                                     |
    |                                     |
    |                                     |
    =======================================
"@ -ForegroundColor Cyan
}

function Run-Script {
    param (
        [string]$ScriptName
    )
    Write-Host "Running $ScriptName..." -ForegroundColor Yellow
    # Replace the following line with the actual command to run your GitHub-hosted script
    Write-Host "Placeholder: Running $ScriptName from GitHub" -ForegroundColor Green
    Start-Sleep -Seconds 2
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    
    switch ($choice) {
        '1' { Run-Script "Script 1" }
        '2' { Run-Script "Script 2" }
        '3' { Run-Script "Script 3" }
        '4' { Run-Script "Script 4" }
        'Q' { 
            Write-Host "Exiting..." -ForegroundColor Red
            return
        }
        default {
            Write-Host "Invalid choice. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
    
    if ($choice -ne 'Q') {
        Write-Host "Press any key to continue..."
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    }
} while ($choice -ne 'Q')
