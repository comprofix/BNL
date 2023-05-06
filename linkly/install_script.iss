;InnoSetupVersion=6.0.0 (Unicode)

[Setup]
AppName=Linkly
AppVerName=Linkly 5.6.8
AppId=PC-EFTPOS
AppVersion=5.6.8
AppPublisher=Linkly
AppPublisherURL=http://linkly.com.au
AppSupportURL=http://linkly.com.au
DefaultDirName={commonpf}\PC_EFT
DefaultGroupName=Linkly
UninstallDisplayName=Linkly
OutputBaseFilename=Linkly Setup
Compression=lzma2
Uninstallable=true
DisableProgramGroupPage=yes
LicenseFile=embedded\License.txt
WizardImageFile=embedded\WizardImage0.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp

[Files]
Source: "{app}\ConfigWiz.exe"; DestDir: "{app}"; AfterInstall: "ExecConfigWiz"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\ViewOSK.exe"; DestDir: "{app}"; Check: "IsWin64"; MinVersion: 0.0,6.0; Flags: 64bit 
Source: "{app}\SetupUtils.dll"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: dontcopy 
Source: "{app}\development.xml"; DestDir: "{app}"; Components: Development; MinVersion: 0.0,6.0; 
Source: "{app}\anz.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\bankwest.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\bendigo.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\cba,1.xml"; DestDir: "{app}"; DestName: "cba.xml"; MinVersion: 0.0,6.0; 
Source: "{app}\cba,2.xml"; DestDir: "{app}"; DestName: "cba.xml"; MinVersion: 0.0,6.01; OnlyBelowVersion: 0.0,6.02; 
Source: "{app}\firstdata.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\nab_customer_owned.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\stgeorge.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\suncorp.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\westpac.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\touch.xml"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\OLEPRO32.dll"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\MSVCRT.dll"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\MSVCIRT.dll"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\mfc42.dll"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\Eftsrv.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\EftSrvUI.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\CbaGwDll,1.dll"; DestDir: "{app}"; DestName: "CbaGwDll.dll"; Check: "not IsCBASha1Required"; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{app}\CbaGwDll,2.dll"; DestDir: "{app}"; DestName: "CbaGwDll.dll"; Check: "IsCBASha1Required"; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{app}\AVI\PROCESS.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\VERIFY.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\QUESTION.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\CARD.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\ACCOUNT.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\PIN.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\AVI\FINISHED.AVI"; DestDir: "{app}\AVI"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\CsdEft.ocx"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace regserver ignoreversion 
Source: "{app}\EftClnt.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\EftClntUI.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\TPP_MasterGUI.bcx"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\AutoSettle.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\helpfiles\helpfiles.zip"; DestDir: "{app}\helpfiles"; MinVersion: 0.0,6.0; 
Source: "{app}\rc.emsdat"; DestDir: "{app}"; MinVersion: 0.0,6.0; 
Source: "{app}\EmsClt.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\EmsCltUI.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\EmsCltUIAutoDetect.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\EmsCltUITasks.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\PCEFTPOSJnlRcpViewer.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: restartreplace ignoreversion 
Source: "{app}\usb\Ingenico\Ingenico Telium\Ingenico_Telium_USBCOM_v1.35.0_2019-11-18_setup.exe"; DestDir: "{app}\usb\Ingenico\Ingenico Telium"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\Ingenico\Ingenico Telium\IngenicoUSBDrivers_3.14_setup.exe"; DestDir: "{app}\usb\Ingenico\Ingenico Telium"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\Verifone Unified driver user notes.pdf"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\32\README.txt"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\32"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\32\silent_install.bat"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\32"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\32\silent_uninstall.bat"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\32"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\32\VerifoneUnifiedDriverInstaller.msi"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\32"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\64\README.txt"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\64"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\64\silent_install.bat"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\64"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\64\silent_uninstall.bat"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\64"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\VeriFone (VX6xx_ VX7xx_ VX8xx)\5.0.4.0-B2\64\VerifoneUnifiedDriverInstaller64.msi"; DestDir: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\64"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\CBA Albert\aevi.cat"; DestDir: "{app}\usb\CBA Albert"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\CBA Albert\AeviSerial.inf"; DestDir: "{app}\usb\CBA Albert"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\XAC\Keycorp.Gateway.Manager.Service.Setup.msi"; DestDir: "{app}\usb\XAC"; MinVersion: 0.0,6.0; 
Source: "{app}\usb\XAC\setup.exe"; DestDir: "{app}\usb\XAC"; MinVersion: 0.0,6.0; 
Source: "{app}\LogMeIn123.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{app}\TPP2_Connect.bcx"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: ignoreversion 
Source: "{sd}\PC_EFT\DevTools\EFTCLTDebugViewer.exe"; DestDir: "{sd}\PC_EFT\DevTools"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\GenericPOS.exe"; DestDir: "{sd}\PC_EFT\DevTools"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\IPInterface.TestPOS.exe"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\IPInterface.TestPOS.exe.config"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\Newtonsoft.Json.dll"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\Newtonsoft.Json.xml"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\PCEFTPOS.EFTClient.IPInterface.dll"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\QRCoder.dll"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS\ReleaseNotes.md"; DestDir: "{sd}\PC_EFT\DevTools\IPInterface.TestPOS"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\VirtualPinpad.exe"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\VirtualPinpadCmd.exe"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\54.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\61.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\62.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\63.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\64.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\65.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\66.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\67.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\69.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\70.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\71.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\72.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons\89.png"; DestDir: "{sd}\PC_EFT\DevTools\VirtualPinpad\icons"; Components: Development; MinVersion: 0.0,6.0; Flags: restartreplace 
Source: "{app}\BCX_Migrator.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: deleteafterinstall 
Source: "{app}\vc_redist.x86.exe"; DestDir: "{app}"; MinVersion: 0.0,6.0; Flags: deleteafterinstall 
Source: "{app}\EULA.txt"; DestDir: "{app}"; MinVersion: 0.0,6.0; 

[Dirs]
Name: "{sd}\PC_EFT\"; 

[Registry]
Root: HKLM; Subkey: "Software\Remedy\EFTSRV\SERVER\"; ValueName: "INETADDR"; ValueType: String; ValueData: "ANY_IP"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\Remedy\EFTSRV\SERVER\"; ValueName: "USEDEFAULTADDRESS"; ValueType: Dword; ValueData: "$0"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run\"; ValueName: "EftClnt_gui.exe"; MinVersion: 0.0,6.0; Flags: deletevalue 
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run\"; ValueName: "CSDEftposClient"; MinVersion: 0.0,6.0; Flags: deletevalue 
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run\"; ValueName: "EMSClientApp"; MinVersion: 0.0,6.0; Flags: deletevalue 
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run\"; ValueName: "EftClntUI"; ValueType: String; ValueData: """{app}\EftClntUI.exe"""; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\Ingenico\EMS\EMS-CLIENT\"; ValueName: "INSTALLEDFILE"; ValueType: String; ValueData: "{app}\EMSCLT.exe"; MinVersion: 0.0,6.0; Flags: uninsdeletevalue noerror 
Root: HKLM; Subkey: "Software\Ingenico\EMS\EMS-CLIENT\"; ValueName: "EFTCLTINSTALLEDFILE"; ValueType: String; ValueData: "{app}\EftClnt.exe"; MinVersion: 0.0,6.0; Flags: uninsdeletevalue noerror 
Root: HKLM; Subkey: "Software\CullenSoftwareDesign\EFTCLIENT\CLIENT\"; ValueName: "INSTALL_DIR"; ValueType: String; ValueData: "{app}"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\Remedy\EFTSRV\SERVER\"; ValueName: "INSTALL_DIR"; ValueType: String; ValueData: "{app}"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\Ingenico\EMS\EMS-CLIENT\"; ValueName: "INSTALLERVERSION"; ValueType: String; ValueData: "5.6.8"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\PCEFTPOS\INSTALLER\"; ValueName: "INSTALLERVERSION"; ValueType: String; ValueData: "5.6.8"; AfterInstall: "SetOldInstallerPath"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\PCEFTPOS\INSTALLER\"; ValueName: "INSTALLERPATH"; ValueType: String; ValueData: "{app}"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\CullenSoftwareDesign\EFTCLIENT\RECEIPT\"; ValueName: "FILESPEC"; ValueType: String; ValueData: "EFTPOS.RCP"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\CullenSoftwareDesign\EFTCLIENT\JOURNAL\"; ValueName: "FILESPEC"; ValueType: String; ValueData: "EFTPOS.EJL"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\CullenSoftwareDesign\EFTCLIENT\CLIENT\"; ValueName: "AUTO_INTERNAL_DIAL"; ValueType: Dword; ValueData: "$1"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\CullenSoftwareDesign\EFTCLIENT\EVL\"; ValueName: "BASE_DIRECTORY"; ValueType: String; ValueData: "{sd}\PC_EFT\"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\Remedy\EFTSRV\TXNLOG\"; ValueName: "FILENAME"; ValueType: String; ValueData: "{sd}\PC_EFT\EXCLOG.TXT"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\Remedy\EFTSRV\EVL\"; ValueName: "FILENAME"; ValueType: String; ValueData: "{sd}\PC_EFT\EFTSRV.LOG"; MinVersion: 0.0,6.0; Flags: createvalueifdoesntexist 
Root: HKLM; Subkey: "Software\PC-EFTPOS\ConfigWiz"; ValueName: "BRANDING"; ValueType: String; ValueData: "Linkly"; MinVersion: 0.0,6.0; 
Root: HKLM; Subkey: "Software\PC-EFTPOS\ConfigWiz"; ValueName: "HELP_URI"; ValueType: String; ValueData: "https://linkly.com.au/merchants/installation-and-user-guides"; MinVersion: 0.0,6.0; 

[Run]

[UninstallRun]
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\Eftsrv.exe"""; StatusMsg: "Removing EFT-Server from Windows Firewall..."; Components: EFT_Server PCEFTPOS_Client Development; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\Controller.exe"""; StatusMsg: "Removing EMS-Controller from Windows Firewall..."; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\Eftclnt.exe"""; StatusMsg: "Removing EFT-Client from Windows Firewall..."; Components: EFT_Server PCEFTPOS_Client Development; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\EmsClt.exe"""; StatusMsg: "Removing EMS-Client from Windows Firewall..."; Components: EFT_Server PCEFTPOS_Client Development; Tasks: EMS_CLIENT_SERVICE; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\EmsCltUI.exe"""; StatusMsg: "Removing EMS-Client from Windows Firewall..."; Components: EFT_Server PCEFTPOS_Client Development; Tasks: EMS_CLIENT_SERVICE; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "firewall delete allowedprogram ""{app}\EmsClt_APP.exe"""; StatusMsg: "Removing EMS-Client from Windows Firewall..."; MinVersion: 0.0,5.01.2600 Service Pack 2; OnlyBelowVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "advfirewall firewall delete name=EFT-Server"; StatusMsg: "Removing EFT-Server from Windows Firewall..."; MinVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "advfirewall firewall delete name=EFT-Client"; StatusMsg: "Removing EFT-Server from Windows Firewall..."; MinVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "advfirewall firewall delete name=EMS-Controller"; StatusMsg: "Removing EFT-Server from Windows Firewall..."; MinVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "advfirewall firewall delete name=EMS-Client"; StatusMsg: "Removing EFT-Server from Windows Firewall..."; MinVersion: 0.0,6.0; 
Filename: "netsh"; Parameters: "advfirewall firewall delete name=EMS-ClientUI"; StatusMsg: "Removing EFT-Server from Windows Firewall..."; MinVersion: 0.0,6.0; 
Filename: "{app}\ConfigWiz.exe"; Parameters: "/SilentInstall /StopAllServices"; WorkingDir: "{app}"; StatusMsg: "Stopping Linkly applications..."; MinVersion: 0.0,6.0; 
Filename: "{app}\Eftsrv.exe"; Parameters: "remove noecho"; WorkingDir: "{app}"; MinVersion: 0.0,6.0; 
Filename: "{app}\EftSrvUI.exe"; Parameters: "/uninstall"; MinVersion: 0.0,6.0; 
Filename: "{app}\EftClnt.exe"; Parameters: "remove noecho"; WorkingDir: "{app}"; Components: PCEFTPOS_Client Development; MinVersion: 0.0,6.0; 
Filename: "{app}\ConfigWiz.exe"; Parameters: "/SilentInstall /UninstallService /ServiceName EMSClientService /ServiceDisplayName EMS-Client /ServicePath ""{app}\EmsClt.exe"""; WorkingDir: "{app}"; MinVersion: 0.0,6.0; 
Filename: "{app}\EmsCltUI.exe"; Parameters: "/uninstall"; WorkingDir: "{app}"; MinVersion: 0.0,6.0; 
Filename: "{app}\usb\Ingenico\Ingenico Telium\IngenicoUSBDrivers_3.14_setup.exe"; Parameters: "/S /uninstall"; WorkingDir: "{app}"; StatusMsg: "Installing Ingenico USB driver"; Tasks: INGENICO_USB_DRIVERS; MinVersion: 0.0,6.0; 
Filename: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\64\silent_uninstall.bat"; WorkingDir: "{app}"; StatusMsg: "Installing Verifone USB driver"; Tasks: VERIFONE_USB_DRIVERS; Check: "IsWin64"; MinVersion: 0.0,6.0; Flags: 64bit 
Filename: "{app}\usb\VeriFone (VX6xx, VX7xx, VX8xx)\5.0.4.0-B2\32\silent_uninstall.bat"; WorkingDir: "{app}"; StatusMsg: "Installing Verifone USB driver"; Tasks: VERIFONE_USB_DRIVERS; Check: "not IsWin64"; MinVersion: 0.0,6.0; Flags: 32bit 

[Icons]
Name: "{group}\VirtualPinpad"; Filename: "{sd}\PC_EFT\DevTools\VirtualPinpad\VirtualPinpad.exe"; WorkingDir: "{sd}\PC_EFT"; IconFilename: "{sd}\PC_EFT\DevTools\VirtualPinpad\VirtualPinpad.exe"; Comment: "Opens the Linkly Virtual PINpad"; Components: Development; MinVersion: 0.0,6.0; 

[Tasks]
Name: "ems_client_service"; Description: "Install EMS-Client Service"; Components: "PCEFTPOS_Client"; MinVersion: 0.0,6.0; 
Name: "ingenico_usb_drivers"; Description: "Install Ingenico USB drivers"; Components: "PCEFTPOS_Client"; MinVersion: 0.0,6.0; 
Name: "verifone_usb_drivers"; Description: "Install Verifone USB drivers"; Components: "PCEFTPOS_Client"; MinVersion: 0.0,6.0; 

[Components]
Name: "pceftpos_client"; Description: "Linkly Client"; Types: "pceftpos_client"; MinVersion: 0.0,6.0; 
Name: "eft_server"; Description: "EFT-Server"; Types: "eft_server"; MinVersion: 0.0,6.0; 
Name: "development"; Description: "Offline Development"; Types: "development"; MinVersion: 0.0,6.0; 

[InstallDelete]
Type: filesandordirs; Name: "{app}\help_files"; 
Type: filesandordirs; Name: "{app}\nab_bank_owned.xml"; 
Type: filesandordirs; Name: "{app}\ContinueAnyway.exe"; 
Type: filesandordirs; Name: "{app}\*.xml"; 
Type: filesandordirs; Name: "{app}\EftClnt_gui.exe"; 
Type: filesandordirs; Name: "{app}\eftsrvdetails.exe"; 
Type: filesandordirs; Name: "{app}\ShowEftClnt.exe"; 
Type: filesandordirs; Name: "{app}\PCEFTUtils.dll"; 
Type: filesandordirs; Name: "{app}\ConfigWizRestorePoints.dat"; 
Type: filesandordirs; Name: "{app}\SystemTester.exe"; 
Type: filesandordirs; Name: "{app}\VC6Demo.exe"; 
Type: filesandordirs; Name: "{app}\EFTREMOV.exe"; 
Type: filesandordirs; Name: "{app}\SETUP.LOG"; 
Type: filesandordirs; Name: "{app}\UnInstal.Dat"; 
Type: filesandordirs; Name: "{app}\usb"; 
Type: filesandordirs; Name: "{app}\EmsClt_APP.exe"; 
Type: filesandordirs; Name: "{app}\SvComSvc.dll"; 
Type: filesandordirs; Name: "{app}\SvComSc.exe"; 
Type: filesandordirs; Name: "{app}\EftMgmt.exe"; 
Type: filesandordirs; Name: "ExpandConstant('{commonappdata}\PCE.cmd')"; 
Type: filesandordirs; Name: "{sd}\PC_EFT\DevTools\TPP2_PayAtTable.bcx"; 
Type: filesandordirs; Name: "{app}\offline.xml"; 

[UninstallDelete]
Type: filesandordirs; Name: "{app}\usb"; 
Type: filesandordirs; Name: "{sys}\drivers\WdfCoInstaller01005.dll"; 
Type: filesandordirs; Name: "{sys}\drivers\silabser.sys"; 
Type: filesandordirs; Name: "{sys}\drivers\silabenm.sys"; 

[Types]
Name: "pceftpos_client"; Description: "Linkly Client And Server (A PINpad will be attached to this PC)"; MinVersion: 0.0,6.0; 
Name: "eft_server"; Description: "Server Only (A PINpad will not be attached to this PC)"; MinVersion: 0.0,6.0; 
Name: "development"; Description: "Offline Development"; MinVersion: 0.0,6.0; 

[CustomMessages]
default.NameAndVersion=%1 version %2
default.AdditionalIcons=Additional shortcuts:
default.CreateDesktopIcon=Create a &desktop shortcut
default.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
default.ProgramOnTheWeb=%1 on the Web
default.UninstallProgram=Uninstall %1
default.LaunchProgram=Launch %1
default.AssocFileExtension=&Associate %1 with the %2 file extension
default.AssocingFileExtension=Associating %1 with the %2 file extension...
default.AutoStartProgramGroupDescription=Startup:
default.AutoStartProgram=Automatically start %1
default.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "default"; MessagesFile: "embedded\default.isl"; 
