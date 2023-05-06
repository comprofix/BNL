$Hostname = $env:computername
$position = $Hostname.Indexof("B")
$Number = $Hostname.Substring($position + 1, 4)
$storenumber = ("$Number").TrimStart("0")

#Download CSV
& "$PSScriptRoot/Connect-pnponline.ps1"

$CSV = Import-Csv -Path Linkley.csv

$StoreDetails = $CSV | Where-Object { $_.STORE_ID2 -eq "$storenumber" }

$StoreName = $StoreDetails.STORE_NAME
$Merchant = $StoreDetails.MERCHANT_ID
$StoreAddress = $StoreDetails.StoreAddress
$API_ZIP = $StoreDetails."API_KEY  - Zippay"
$LOCATION_ID_ZIP = $StoreDetails."LOCATION_ID  - Zippay"
$Blackhawk = $StoreDetails."Blakhawk AID "
$Givex_Username = $StoreDetails."Givex Username"
$Givex_Password = $StoreDetails.GivexPassword
$BOH = $StoreDetails."BOH Machine Name "

Write-Host "Installing Linkly"
$install_path = "C:\PC_EFT"
If (Test-Path -Path "$install_path") {
    $null = Remove-Item -Path $install_path -Recurse -Force
}
Expand-Archive -LiteralPath PC_EFT.zip -DestinationPath $install_path 

Write-Host "Creating Registry Entries"

If (Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy") {
    $null = Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy" -Recurse -Force
}


If (!(Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy")) {

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EVL"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "FILENAME" = "C:\\PC_EFT\\EFTSRV.LOG"
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "PC_EFTPOS_EVENT_MODE_STORED"          = 0
        "PC_EFTPOS_EVENT_TIME_INTERVAL_STORED" = 2

    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "LIST" = ",02052023130240,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023001817,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023001817,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023002020,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023002027,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003223,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003223,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003339,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003339,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000"
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "NUMBER"               = "58"
        "EXCEPTION_COUNT_5000" = "1"
        "EXCEPTION_COUNT_3000" = "30"
        "EXCEPTION_COUNT_3001" = "27"
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
    
    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "NAME"               = "$BOH"
        "TCPIPADDRESS"       = "$BOH"
        "HOSTID"             = ""
        "POSAME"             = ""
        "HOSTADDR"           = ""
        "DLL_TRANSLATE_NAME" = ""
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    
    $RegValues = @{
        "TYPE"            = "4" 
        "PRIORITY"        = "4"  
        "TCPIPPORT"       = "2005"  
        "ENCRYPTED"       = "0"  
        "AUTORESTART"     = "1"  
        "RXWAITTIMEOUT"   = "60"  
        "NON_EFTSRV_LINE" = "0"  
        "ACTIVE"          = "1"  
        "ENABLED"         = "1"  
        "HDRTYPE"         = "4294967280"  
        "HANGUP"          = "0"  
        "DLL_TRANSLATE"   = "0"          
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "NAME"         = "SY4 SERVER"
        "TCPIPADDRESS" = "PC_EFTPOS2"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "TYPE"            = "4"
        "PRIORITY"        = "3"
        "TCPIPPORT"       = "2005"
        "ENCRYPTED"       = "0"
        "AUTORESTART"     = "1"
        "RXWAITTIMEOUT"   = "60"
        "NON_EFTSRV_LINE" = "0"
        "ACTIVE"          = "1"
        "ENABLED"         = "1"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
    
    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "NAME"         = "ME1 SERVER"
        "TCPIPADDRESS" = "PC_EFTPOS1"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "TYPE"            = "4"
        "PRIORITY"        = "3"
        "TCPIPPORT"       = "2005"
        "ENCRYPTED"       = "0"
        "AUTORESTART"     = "1"
        "RXWAITTIMEOUT"   = "60"
        "NON_EFTSRV_LINE" = "0"
        "ACTIVE"          = "1"
        "ENABLED"         = "1"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINK_0000"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "NAME"      = "Default Link"
        "IF_IDLIST" = "0~1~2~"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "ACTIVE" = "1"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "HostID"       = "1"
        "HostNII"      = "1"
        "Name"         = "Default Route"
        "SHA_OVERRIDE" = ""
        "StreamID"     = ""
    
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "Active" = "1" 
        "LinkID" = "0" 
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
    
    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "INETADDR"    = "ANY_IP"
        "INSTALL_DIR" = "C:\\PC_EFT\\"
        "PWORD"       = "******"
        "Ident"       = "EFTSRV1"
        "REC_TIME"    = "04052023080908"
    
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "USEDEFAULTADDRESS" = "0"
        "PEAK_TXN_Q"        = "1"
        "PEAK_TPS"          = "0" 
        "PEAK_TPM"          = "5" 
        "PEAK_TPH"          = "14"
        "PEAK_TPD"          = "28"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
    
    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\TXNLOG"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "FILENAME" = "C:\\PC_EFT\\EXCLOG.TXT"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Ingenico\EMS\EMS-CLIENT"  
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "INSTALLERVERSION"    = "5.6.8"
        "INSTALLEDFILE"       = "C:\\PC_EFT\\EMSCLT.exe"
        "EFTCLTINSTALLEDFILE" = "C:\\PC_EFT\\EftClnt.exe"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run"
    $RegValues = @{
        "EftClntUI" = "C:\\PC_EFT\\EftClntUI.exe"
        "EftsrvUI"  = "C:\\PC_EFT\\EftSrvUI.exe"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $null = New-NetFirewallRule -DisplayName "EFT-Server" -Direction Inbound -Program "$install_path\Eftsrv.exe" -Action Allow -Profile Any
    $null = New-NetFirewallRule -DisplayName "EMS-Client" -Direction Inbound -Program "$install_path\EmsClt.exe" -Action Allow -Profile Any
    $null = New-NetFirewallRule -DisplayName "EMS-ClientUI" -Direction Inbound -Program "$install_path\EmsCltUI.exe" -Action Allow -Profile Any 
    $null = New-NetFirewallRule -DisplayName "EFT-Client" -Direction Inbound -Program "$install_path\Eftclnt.exe" -Action Allow -Profile Any 

    Start-Process -FilePath "$install_path\vc_redist.x86.exe" -ArgumentList "/install", "/passive", "/quiet", "/norestart"
    Start-Process -FilePath "$install_path\usb\Ingenico\Ingenico Telium\IngenicoUSBDrivers_3.14_setup.exe" -ArgumentList "/S", "/uninstall"
    Start-Process -FilePath "$install_path\usb\Ingenico\Ingenico Telium\Ingenico_Telium_USBCOM_v1.35.0_2019-11-18_setup.exe" -ArgumentList "/S"
    Start-Process -FilePath "$install_path\Eftsrv.exe" -ArgumentList "remove", "noecho"
    Start-Process -FilePath "$install_path\EftClnt.exe" -ArgumentList "remove", "noecho"
    Start-Process -FilePath "$install_path\Eftsrv.exe" -ArgumentList "install", "noecho"
    Start-Process -FilePath "$install_path\EftSrvUI.exe" -ArgumentList "/install"
    Start-Process -FilePath "$install_path\EftClnt.exe" -ArgumentList "install", "noecho"
    Start-Process -FilePath "$install_path\EmsCltUI.exe" -ArgumentList "/Reinstall"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall", "/UninstallService", "/ServiceName", "EMSClientService", "/ServiceDisplayName", "EMS-Client", "/ServicePath", "$install_path"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall", "/InstallService", "/ServiceName", "EMSClientService", "/ServiceDisplayName", "EMS-Client", "/ServicePath", "$install_path\EmsClt.exe"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall", "/StopAllServices"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /SetEftSrvRestartOnFailure TRUE /SetEftCltRestartOnFailure TRUE /SetEmsCtrlRestartOnFailure TRUE /SetEmsCtlRestartOnFailure TRUE /SetEftSrvInteractWithDesktop FALSE /SetEftCltInteractWithDesktop FALSE /SetEmsCtrlInteractWithDesktop FALSE /SetEmsCltInteractWithDesktop FALSE"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /StartEFTSRV"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /StartEFTCLT"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /StartEMSCLT"
    Start-Process -FilePath "$install_path\EftSrvUI.exe"
    Start-Process -FilePath "$install_path\EmsCltUI.exe"
    Start-Process -FilePath "$install_path\EftClntUI.exe"

    Start-Process -FilePath "C:\Windows\System32\sc.exe" -ArgumentList "config RemedyEFTPOSServer start=delayed-auto"








    
    
}