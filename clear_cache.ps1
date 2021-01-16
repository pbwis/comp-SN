<#
Clear cache script in particular folder.

in case script doesn't run: Set-ExecutionPolicy RemoteSigned
set back: Set-ExecutionPolicy Restricted
#>

$folder_link = "C:\!Test_PowerShell\folder1"
$days_back = 2


if((Get-ChildItem $folder_link -force | Select-Object -First 1 | Measure-Object).Count -ne 0)
{
    Get-ChildItem –Path $folder_link -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$days_back))} | Remove-Item
    Clear-RecycleBin -DriveLetter C -Force
}

else
{
    Write-Host "Folder Empty"
    Exit
}