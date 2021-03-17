# First version TEMP for tests
# Quiet uninstall

$app = Get-WmiObject -Class Win32_Product -Filter "Name = 'Name of product'"

$app.Uninstall()

# Install new version

Start-Process -FilePath "location to file.exe" -Verb runAs -ArgumentList '/s','/v"/qn"'


Copy-Item -Path "Z:\path to file" -Destination "C:\!Test_PowerShell\path to folder" -Recurse


Start-Process ((Resolve-Path "C:\!Test_PowerShell\folder3\aaaaaa").Path)

$file = "C:\!Test_PowerShell\folder3\path to file"
if (Test-Path -path $file)
    {

        Start-Process ((Resolve-Path "C:\!Test_PowerShell\folder3\path to file").Path)
    }

else
    {
        return None
    }

"notepad","calc","wmplayer", "explorer" | ForEach-Object {Start-Process $_} | Wait-Process ;dir