# First version TEMP for tests
# Quiet uninstall

$app = Get-WmiObject -Class Win32_Product -Filter "Name = 'Name of product'"

$app.Uninstall()

# Install new version

Start-Process -FilePath "location to file.exe" -Verb runAs -ArgumentList '/s','/v"/qn"'