Write-Host "Installing Linkly"
#Expand-Archive -LiteralPath linkly.zip -DestinationPath C:\PC_EFT

Write-Host "Creating Registry Entries"

If (Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy") {
    $null = Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy" -Recurse -Force
}


If (!(Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy")) {

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy"
    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV"
    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EVL"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EVL" -Name "FILENAME" -Value "C:\\PC_EFT\\EFTSRV.LOG"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EVL" -Name "PC_EFTPOS_EVENT_MODE_STORED" -Value 0 -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EVL" -Name "PC_EFTPOS_EVENT_TIME_INTERVAL_STORED" -Value 2 -PropertyType dword

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS" -Name "NUMBER" -Value "58" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS" -Name "LIST" -Value ",02052023130240,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023001817,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023001817,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023002020,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023002027,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003223,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003223,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Idle,3001,04052023003339,INTERFACE_NAME = SY4 SERVER          , INTERFACE_STATUS = Connected,3000,04052023003339,INTERFACE_NAME = ME1 SERVER          , INTERFACE_STATUS = Connected,3000"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS" -Name "EXCEPTION_COUNT_5000" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS" -Name "EXCEPTION_COUNT_3000" -Value "30" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\EXCEPTIONS" -Name "EXCEPTION_COUNT_3001" -Value "27" -PropertyType dword

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "NAME" -Value "B0092SVR01"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "TYPE" -Value "4" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "PRIORITY" -Value "4" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "TCPIPADDRESS" -Value "B0092SVR01"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "TCPIPPORT" -Value "2005" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "ENCRYPTED" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "AUTORESTART" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "RXWAITTIMEOUT" -Value "60" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "NON_EFTSRV_LINE" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "ACTIVE" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "ENABLED" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "HDRTYPE" -Value "4294967280" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "HOSTID" -Value ""
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "POSAME" -Value ""
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "HOSTADDR" -Value ""
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "HANGUP" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "DLL_TRANSLATE" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0000" -Name "DLL_TRANSLATE_NAME" -Value ""

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "NAME" -Value "SY4 SERVER"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "TYPE" -Value "4" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "PRIORITY" -Value "3" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "TCPIPADDRESS" -Value "PC_EFTPOS2"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "TCPIPPORT" -Value "2005" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "ENCRYPTED" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "AUTORESTART" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "RXWAITTIMEOUT" -Value "60" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "NON_EFTSRV_LINE" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "ACTIVE" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0001" -Name "ENABLED" -Value "1" -PropertyType dword

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "NAME" -Value "ME1 SERVER"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "TYPE" -Value "4" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "PRIORITY" -Value "3" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "TCPIPADDRESS" -Value "PC_EFTPOS1"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "TCPIPPORT" -Value "2005" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "ENCRYPTED" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "AUTORESTART" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "RXWAITTIMEOUT" -Value "60" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "NON_EFTSRV_LINE" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "ACTIVE" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINE_0002" -Name "ENABLED" -Value "1" -PropertyType dword

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINK_0000"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINK_0000" -Name "NAME" -Value "Default Link"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINK_0000" -Name "ACTIVE" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\LINK_0000" -Name "IF_IDLIST" -Value "0~1~2~"

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "Active" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "HostID" -Value "1"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "HostNII" -Value "1"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "LinkID" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "Name" -Value "Default Route"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "SHA_OVERRIDE" -Value ""
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\ROUTE_0000" -Name "StreamID" -Value ""

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "INETADDR" -Value "ANY_IP"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "USEDEFAULTADDRESS" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "INSTALL_DIR" -Value "C:\\PC_EFT\\"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PWORD" -Value "******"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "Ident" -Value "EFTSRV1"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "REC_TIME" -Value "04052023080908"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PEAK_TXN_Q" -Value "1" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PEAK_TPS" -Value "0" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PEAK_TPM" -Value "5" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PEAK_TPH" -Value "14" -PropertyType dword
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\SERVER" -Name "PEAK_TPD" -Value "28" -PropertyType dword

    $null = New-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\TXNLOG"
    $null = New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy\EFTSRV\TXNLOG" -Name "FILENAME" -Value "C:\\PC_EFT\\EXCLOG.TXT"

    












    


    
    



    


}