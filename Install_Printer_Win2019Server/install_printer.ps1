# Automate install printer script
# Windows 2019 Server (req Powershell 7)

# Install Print Server
Import-Module -Name ServerManager -WarningAction SilentlyContinue
Install-WindowsFeature -Name Print-Server -IncludeManagmentTools


# Create a folder for print driver
$NIHT = @{
    Path = 'C:\Toshiba_UNI_driver'  # example of path
    ItemType = 'Directory'
    Froce = $true
    ErrorAction = 'SilentlyContinue'
}
New-Item @NIHT | Out-Null


# Download print driver
$URL = 'https://www.toshibatec.eu/publicsite-service/resource/download/pseu/en/953bd833-b7af-4d0b-aca0-296ecbca0def/2e4a21c580aa696ff0175b29a4586dec/'
$Target = 'C:\Toshiba_UNI_driver\TOSHIBA_e-STUDIO_Universal_Printer_Driver_2_v7.212.4835.17.zip'
Start-BitsTransfer -Source $URL -Destination $Target


# Extract print driver
$Drivers = 'C:\Toshiba_UNI_driver\Drivers'
Expand-Archive -Path $Target -DestinationPath $Drivers


# Install driver
$M1 = 'Toshiba Universal Print Driver'
$P = 'C:\Toshiba_UNI_driver\Drivers\link to .inf file'   # change this link
rundll32.exe printui.dll, PrintUIEntry /ia /m "$M1" /f "$P"


# Add new Port
$PPHT = @{
    Name = 'IT_Printer_IP'
    PrinterHostAddress = '10.10.10.85'
}
Add-PrinterPort @PPHT


# Add printer
$PRHT = @{
    Name = 'IT_dept_printer'
    DriverName = $M1
    PortName = 'IT_Printer_IP'
}
Add-Printer @PRHT