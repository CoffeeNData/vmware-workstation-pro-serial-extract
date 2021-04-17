$serial = (Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.16.0.e5.202001' | Select-Object Serial | Format-List)

Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::OK
$MessageIcon = [System.Windows.MessageBoxImage]::Information
$MessageboxTitle = “VMWare Workstation Pro Serial”

$Messageboxbody = (Out-String -InputObject $serial)
$Messageboxbody += "`nSerial number saved to serial.txt"

[System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)

Write-Output $serial > serial.txt