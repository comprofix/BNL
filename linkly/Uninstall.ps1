Stop-Service -Name "EFT-Server"
Stop-Process -name "EFTSRVUI" -Confirm:$false -Force
Stop-Process -name "EFTCLNTUI" -Confirm:$false -Force
Stop-Process -name "EFTCLNT" -Confirm:$false -Force

Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Remedy" -Recurse -Force -Confirm:$false
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\CullenSoftwareDesign" -Recurse -Force -Confirm:$false
Remove-Item -Path C:\PC_EFT -Recurse -Force -Confirm:$false
Remove-ItemProperty -Path "HKLM:SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" -Name EftClntUI
Remove-ItemProperty -Path "HKLM:SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" -Name EftsrvUI