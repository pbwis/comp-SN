<#
Clear cache script for selected folder.
Requirements: PowerShell version >= 5
in case a script doesn't run: Set-ExecutionPolicy RemoteSigned
set back: Set-ExecutionPolicy Restricted
#>

$folder_link = "C:\Windows\System32\config\systemprofile\TOSHIBA\eSTUDIOX\UNIDRV\cache"

#  Set a amount of days you would like to keep the cache.
$days_back = 5

#  If a folder contains minimum 1 item: run a script.
if((Get-ChildItem $folder_link -force | Select-Object -First 1 | Measure-Object).Count -ne 0)
    {
        Get-ChildItem –Path $folder_link -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$days_back))} | Remove-Item
        Clear-RecycleBin -DriveLetter C -Force  # Empty recycle bin on C drive.
    }

#  Otherwise: exit.
else
    {
        Write-Host "Folder Empty"
        Exit
    }