# PowerShell System Inventory Script
$computers = Get-ComputerInfo | Select-Object CsName, WindowsVersion, OsArchitecture, CsManufacturer, CsModel, CsTotalPhysicalMemory
$outputPath = ".\SystemInventory.csv"
$computers | Export-Csv -Path $outputPath -NoTypeInformation
Write-Host "System inventory saved to $outputPath"
