$folder_link = "C:\!Test_PowerShell\folder1"
$days_back = 2

Get-ChildItem –Path $folder_link -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$days_back))} | Remove-Item
Clear-RecycleBin -DriveLetter C -Force