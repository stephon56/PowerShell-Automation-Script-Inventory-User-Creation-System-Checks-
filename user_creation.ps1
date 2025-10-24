# PowerShell User Creation Script
$username = Read-Host "Enter new username"
$password = Read-Host "Enter password" -AsSecureString
New-LocalUser -Name $username -Password $password -FullName "$username User" -Description "Created via script"
Add-LocalGroupMember -Group "Administrators" -Member $username
Write-Host "User $username created successfully"
