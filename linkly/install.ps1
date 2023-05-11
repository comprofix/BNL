Start-Transcript C:\Windows\Logs\linkly-install.Log

#Set Variables
$Hostname = $env:computername
#Get Store Number
$position = $Hostname.Indexof("B")
$StoreNumberPC = $Hostname.Substring($position + 1, 4)

#Get LaneID
If ($hostname -like "*SVR*") {
    $position = $Hostname.Indexof("R")
}
else {
    $position = $Hostname.Indexof("S")
}
$LaneID = $Hostname.Substring($position + 1, 2)

#Get Linkly Creds from Sharepoint List and populate variables
. "$PSScriptRoot/Connect-pnponline.ps1"
$StoreNumber = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_1
$StoreName = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_2
$Merchant = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_3
$StoreAddress = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_4
$API_ZIP = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_5
$LOCATION_ID_ZIP = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_6
$Blackhawk = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_7
$Givex_Username = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_8
$Givex_Password = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_9
$BOH = ($data | Where-Object { $_.field_1 -eq "$StoreNumberPC" }).field_10

#Extract Archive and Install Linkly
Write-Host "Installing Linkly"
$install_path = "C:\PC_EFT"
If (Test-Path -Path "$install_path") {
    $null = Remove-Item -Path $install_path -Recurse -Force
}
Expand-Archive -LiteralPath PC_EFT.zip -DestinationPath $install_path 

#Create Registry Entries for Linkly Setup.

Write-Host "Creating Registry Entries"
If (Test-Path -Path "HKLM:\SOFTWARE\Remedy") {
    $null = Remove-Item -Path "HKLM:\SOFTWARE\Remedy" -Recurse -Force
}

If (!(Test-Path -Path "HKLM:\SOFTWARE\Remedy")) {

    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\EVL"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "FILENAME" = "C:\PC_EFT\EFTSRV.LOG"
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

    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\EXCEPTIONS"
    $null = New-Item -Path "$regkey" -Force
    If ($env:computername -like "*SRV*") {
        $RegValues = @{
            "LIST" = ",05052023085756,INTERFACE_NAME = Linkly IP Gateway   , INTERFACE_STATUS = client not enabled -P, Client disabled by PC-EFTPOS Gateway.,6003,05052023085756,INTERFACE_NAME = Linkly IP Gateway   , INTERFACE_STATUS = client not enabled -P,6001,05052023092805,INTERFACE_NAME = Linkly IP Gateway   , INTERFACE_STATUS = client not enabled -P, Client disabled by PC-EFTPOS Gateway.,6003,05052023092805,INTERFACE_NAME = Linkly IP Gateway   , INTERFACE_STATUS = client not enabled -P,6001"
        }
    }
    else {
        $RegValues = @{
            "LIST" = ",02052023130240,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023001817,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023001817,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023002020,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023002027,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003223,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003223,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003339,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003339,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000"
        }
    } 
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    If ($env:computername -like "*SVR*") {
        $RegValues = @{
            "NUMBER"                         = "22"
            "EXCEPTION_COUNT_5000"           = "2"
            "EXCEPTION_COUNT_3000"           = "32"
            "EXCEPTION_COUNT_6003"           = "758"
            "EXCEPTION_COUNT_6001"           = "784"
            "EXCEPTION_COUNT_5001"           = "2"
            "EXCEPTION_COUNT_3001"           = "26"
            "EXCEPTION_COUNT_5004"           = "2"
            "DISCARD_UPLINK_INTERFACE_COUNT" = "2"
        }
    }
    else {
        $RegValues = @{
            "NUMBER"               = "58"
            "EXCEPTION_COUNT_5000" = "1"
            "EXCEPTION_COUNT_3000" = "30"
            "EXCEPTION_COUNT_3001" = "27"
        }
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
    
    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\LINE_0000"
    $null = New-Item -Path "$regkey" -Force

    If ($env:computername -like "*SVR*") {
        $RegValues = @{
            "NAME"        = "Linkly IP Gateway"
            "SSLADDRESS0" = "gw0.pceftpos.com"
            "SSLADDRESS1" = ""
        }
    }
    else {
        $RegValues = @{
            "NAME"               = "$BOH"
            "TCPIPADDRESS"       = "$BOH"
            "HOSTID"             = ""
            "POSAME"             = ""
            "HOSTADDR"           = ""
            "DLL_TRANSLATE_NAME" = ""
        }
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    
    If ($env:computername -like "*SVR*") {
        $RegValues = @{
            "TYPE"        = "9"
            "PRIORITY"    = "4"
            "TCPIPPORT"   = "443"
            "AUTORESTART" = "1"
            "ACTIVE"      = "1"
            "ENABLED"     = "1"
            "SALT"        = "758"
        }
    }
    else {   
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
    }
    foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\LINE_0001"
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
    
    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\LINE_0002"
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

    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\LINK_0000"
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

    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\ROUTE_0000"
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
    
    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\SERVER"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "INETADDR"    = "ANY_IP"
        "INSTALL_DIR" = "C:\PC_EFT\"
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
    
    $regkey = "HKLM:\SOFTWARE\Remedy\EFTSRV\TXNLOG"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "FILENAME" = "C:\PC_EFT\EXCLOG.TXT"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\Ingenico\EMS\EMS-CLIENT"  
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "INSTALLERVERSION"    = "5.6.8"
        "INSTALLEDFILE"       = "C:\PC_EFT\EMSCLT.exe"
        "EFTCLTINSTALLEDFILE" = "C:\PC_EFT\EftClnt.exe"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\PCEFTPOS_BRIDGE\TPP-BLACKHAWK"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "AID"      = "60300004958"
        "LAST_TXN" = ""

    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $RegValues = @{
        "STAN" = "840"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }


    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\CLIENT"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "INSTALL_DIR" = "C:\PC_EFT\"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $RegValues = @{
        "AUTO_INTERNAL_DIAL" = "1"
        "TXN_STATUS"         = "0"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\DLLS\Connect"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "REGISTRATION_ID"   = ""
        "DIAGNOSTICS_ALLOW" = "1"
        "TOKEN"             = "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwidHlwIjoiSldUIn0.._E01UhCCtWLoW5gjIXKBwA.Avg7OA_ACENR4_1IWDi6QaPXORFXeb7ElUNG-HpYjXmhgSd1JwW5-pnhKRzB0VYzOOnEKSwtE0zcZJOOQuXuvwIiVvVeUJjZlZ7WmJWELwvG5AxEMPXME22fQfSdhREbLSVw3XnZkuhSmE6q1qlHfmdCglhrhgVqCRBYlIisY_61ULsDlp76Qs-U43ZptCHrGH0aLpPQx899MPWTZVrFs2QIE_U3L-zh7vfsb07RPw1durcVjmcsI-nn9pu3ft4FJ-2NJ5Uzdu46iXdxscMtxJgu7p_IiG5UpEn3KVHh_eXeZB5oFLOQH_ZHvkdIraZz1AjKEn0Nqr5YbUaWBQXijW_k_vvWcbBZmL1vAw3Faz_BZe4ZhHxqbRV-La0WsnVrJsFIRriy1Aw5qtmowpXKbdVaKYICkwnVkbuWEHoBL_L0StsJxoT17kH0oPMcv2MSdna8g0DZXfGDcpXChUmin52nulqJ0d8owDDlQLOwY7ra2RaUG0i6kdkzcAl-ZyjsXTpdACqcKekIu138Njepq-JNZcGVki62Tg8ovjGVcfU2_mvF1Vb9zzN2ZbPjL3Li8ooRlX9zmPshG7mx72XbKKRkMLhLvkxP5OlG9WgalnBagTc9GtYRs9xhbLpNEXefXC26_e5dsoCEYNkOMFsiM2D1UWbwDGHnazGYwmQSyZ868ajx8QX9toDklAnW7ygJ.PPjdIajnwvmrvmn50IsRNk5z0QDGk1WV8SqwSGgzliE"
        "TOKEN_EXPIRY"      = "1683788680"
        "ACTIVATION_ID"     = "cbe4b862-30fa-43a6-9848-a04edc73d71a"
        "PAIR_RETRY"        = "1"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "OCX_VERSION"          = "no OCX"
        "EFTCLIENT_VERSION"    = "4.7.2.0"
        "LOADED_DLL_INFO_LIST" = "TPP2_Connect.bcx:Version 1.0.12.0;TPP_MasterGUI.bcx:Version 1.00;"
        "BC_DLLS_LOADED"       = "TPP_MasterGUI.bcx;TPP2_Connect.bcx;"
        "EFTSRV_VERSION"       = "4.5.0.0"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\AbnormalShutdown"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\ClientRestartedButPCDidNot"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\EFTSRVclose"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\EFTSRVconnect"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\NormalShutdown"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\BUCKET_STATS\GENERAL_STATS"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\GENERAL_STATS"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EMS\TEMP"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\EVL"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\HOST"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\JOURNAL"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\RECEIPT"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\SHARED_DATA\IP_POS"
    $null = New-Item -Path "$regkey" -Force
    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\PCEFTPOS_BRIDGE\TPP-GIVEX"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{
        "LAST_TXN"       = ""
        "USERNAME"       = "$Givex_Username"
        "PASSWORD"       = "$Givex_Password"
        "RECEIPT_HEADER" = "Best and Less"
        "RECEIPT_FOOTER" = "Please keep this gift   card secure. Best and   Less cannot take        responsibility for lost or stolen gift cards.   This voucher is         transferable but not    refundable."
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{
        "PIN_MODE" = "1"
        "STAN"     = "25"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }

    $regkey = "HKLM:\SOFTWARE\Ingenico\EMS\EMS-CLIENT"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{   
        "INSTALLERVERSION"    = "5.6.8"
        "INSTALLEDFILE"       = "C:\PC_EFT\EMSCLT.exe"
        "EFTCLTINSTALLEDFILE" = "C:\PC_EFT\EftClnt.exe"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\PCEFTPOS_BRIDGE\TPP-ZIPMONEY"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{   
        "API_KEY"     = "$API_ZIP"
        "LOCATION_ID" = "$LOCATION_ID_ZIP"
        "LAST_TXN"    = ""
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{   
        "STAN" = "54"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\LANEINFO"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{      
        "MerchantId"   = "BSTLSS"
        "StoreId"      = "$StoreNumber"
        "LaneId"       = "$LaneID"
        "StoreAddress" = "$StoreAddress"
        "StoreName"    = "$StoreName"
        "Brand"        = "Best and Less "
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\PC-EFTPOS\LaneInfo"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{ 
        "MerchantId"   = "BSTLSS"
        "StoreId"      = "$StoreNumber"
        "LaneId"       = "$LaneID"
        "StoreAddress" = "$StoreAddress"
        "StoreName"    = "$StoreName"
        "Brand"        = "Best and Less "
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }

    $regkey = "HKLM:\SOFTWARE\CullenSoftwareDesign\EFTCLIENT\PINPAD"
    $null = New-Item -Path "$regkey" -Force
    $RegValues = @{

        "PORT"     = "COM5:"
        "ACQUIRER" = "C"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    $RegValues = @{

        "LAST_COMMS_METHOD" = "1"
        "LAST_BAUD_RATE"    = "9600"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value -PropertyType dword
    }
 
    $regkey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    $RegValues = @{
        "EftClntUI" = "C:\PC_EFT\EftClntUI.exe"
        "EftsrvUI"  = "C:\PC_EFT\EftSrvUI.exe"
    }
    Foreach ( $item in $RegValues.GetEnumerator() ) {
        $null = New-ItemProperty -Path "$regkey" -Name $item.Key -Value $item.Value
    }
    
    Start-Process -FilePath "$install_path\vc_redist.x86.exe" -ArgumentList "/install", "/passive", "/quiet", "/norestart"
    $null = New-NetFirewallRule -DisplayName "EFT-Server" -Direction Inbound -Program "$install_path\Eftsrv.exe" -Action Allow -Profile Any 
    Start-Process -FilePath "$install_path\Eftsrv.exe" -ArgumentList "install", "noecho"
    Start-Process -FilePath "$install_path\EftSrvUI.exe" -ArgumentList "/install"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /SetEftSrvRestartOnFailure TRUE /SetEftCltRestartOnFailure TRUE /SetEmsCtrlRestartOnFailure TRUE /SetEmsCtlRestartOnFailure TRUE /SetEftSrvInteractWithDesktop FALSE /SetEftCltInteractWithDesktop FALSE /SetEmsCtrlInteractWithDesktop FALSE /SetEmsCltInteractWithDesktop FALSE"
    Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /StartEFTSRV"
    Start-Process -FilePath "C:\Windows\System32\sc.exe" -ArgumentList "config RemedyEFTPOSServer start=delayed-auto"
    Start-Service -Name "EFT-SERVER"
    Start-Process -FilePath "$install_path\EftSrvUI.exe"

    If ($env:computername -like "*POS*") {
        $null = New-NetFirewallRule -DisplayName "EMS-Client" -Direction Inbound -Program "$install_path\EmsClt.exe" -Action Allow -Profile Any
        $null = New-NetFirewallRule -DisplayName "EMS-ClientUI" -Direction Inbound -Program "$install_path\EmsCltUI.exe" -Action Allow -Profile Any 
        $null = New-NetFirewallRule -DisplayName "EFT-Client" -Direction Inbound -Program "$install_path\Eftclnt.exe" -Action Allow -Profile Any 
        Start-Process -FilePath "$install_path\usb\Ingenico\Ingenico Telium\IngenicoUSBDrivers_3.14_setup.exe" -ArgumentList "/S", "/uninstall"
        Start-Process -FilePath "$install_path\usb\Ingenico\Ingenico Telium\Ingenico_Telium_USBCOM_v1.35.0_2019-11-18_setup.exe" -ArgumentList "/S"
        Start-Process -FilePath "$install_path\EftClnt.exe" -ArgumentList "install", "noecho"
        Start-Process -FilePath "$install_path\ConfigWiz.exe" -ArgumentList "/SilentInstall /StartEFTCLT"
        Start-Process -FilePath "$install_path\EftClntUI.exe"
    }
 
    If ($env:computername -like "*POS*") {
        Copy-Item BCX\*.BCX C:\PC_EFT\
    }
}
Stop-Transcript
