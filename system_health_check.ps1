# PowerShell System Health Check
$results = @{
    "ComputerName" = $env:COMPUTERNAME
    "LastBootUpTime" = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    "DiskFreeSpace(%)" = [math]::Round(((Get-PSDrive C).Free / (Get-PSDrive C).Used) * 100, 2)
    "FirewallStatus" = (Get-NetFirewallProfile | Where-Object {$_.Enabled -eq $true}).Name -join ", "
}
$results | ConvertTo-Json | Out-File ".\SystemHealth.json"
Write-Host "System health report generated at SystemHealth.json"
