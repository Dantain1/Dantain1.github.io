# Get IP Addresses PowerShell Script

function Get-LocalIPAddress {
    try {
        $localIP = (Get-NetIPAddress | Where-Object {
            $_.AddressFamily -eq "IPv4" -and 
            $_.PrefixOrigin -eq "Dhcp" -and 
            $_.SuffixOrigin -eq "Dhcp"
        }).IPAddress

        if (-not $localIP) {
            $localIP = "Unable to determine local IP address"
        }
    }
    catch {
        $localIP = "Error: $($_.Exception.Message)"
    }
    return $localIP
}

function Get-PublicIPAddress {
    try {
        $publicIP = (Invoke-WebRequest -Uri "http://ifconfig.me/ip" -UseBasicParsing).Content.Trim()
        if (-not $publicIP) {
            $publicIP = "Unable to determine public IP address"
        }
    }
    catch {
        $publicIP = "Error: $($_.Exception.Message)"
    }
    return $publicIP
}

Write-Host "Fetching IP Addresses..." -ForegroundColor Cyan

$localIP = Get-LocalIPAddress
$publicIP = Get-PublicIPAddress

Write-Host "`nLocal IP Address:  $localIP" -ForegroundColor Green
Write-Host "Public IP Address: $publicIP" -ForegroundColor Yellow

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
