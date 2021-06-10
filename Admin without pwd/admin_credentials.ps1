# Script for admin login without typing password

$pwd = Read-Host "Enter password" -AsSecureString
$encpwd = ConvertFrom-SecureString $pwd
$encpwd > $path\password.bin
