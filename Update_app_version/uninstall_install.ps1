$software = "Adobe Acrobat";  # example for test
$computername = $env:COMPUTERNAME;
$installed = (Get-WmiObject Win32_Product -ComputerName $computername | Where { $_.Name -match $software })

If(-Not $installed) {
    Write-Host $software "is NOT installed on" $computername;
    Write-Host -NoNewLine 'Press any key to CLOSE window';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Start-Process -FilePath "C:\!_IT_TEST\readerdc_uk_xa_crd_install.exe" -Verb runAs -ArgumentList '/s','/v"/qn"'
} else {
    Write-Host $software "is installed on" $computername
    Write-Host -NoNewLine 'Press any key to uninstall...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    $app = Get-WmiObject -Class Win32_Product -Filter "Name = 'Adobe Acrobat Reader DC'"
    $app.Uninstall()
}


<# Examples for considerations:
     Start-Process -FilePath "C:\!Test_PowerShell\files\npp.7.9.3.Installer.x64.exe" -Verb runAs -ArgumentList '/s','/v"/qn"'
     Start-Process .\installer.exe /S -NoNewWindow -Wait -PassThru
     -NoNewWindow -Wait -PassThru $process.ExitCode
#>