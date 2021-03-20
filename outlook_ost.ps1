# Close Outlook before change ost/pst

$outlook = Get-Process OUTLOOK -ErrorAction SilentlyContinue
if ($outlook) {
    $outlook.CloseMainWindow()
    Start-Sleep 5
    if (!$outlook.HasExited) {
        $outlook | Stop-Process -Force
    }
}
Remove-Variable $outlook

# Find ost folder and file
$location = 'C:\Users\%username%\AppData\Local\Microsoft\Outlook'
$file = Get-ChildItem *.ost
$size = 10GB
