Param()


# If we are running as a 32-bit process on an x64 system, re-launch as a 64-bit process
if ("$env:PROCESSOR_ARCHITEW6432" -ne "ARM64") {
    if (Test-Path "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe") {
        & "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy bypass -File "$PSCommandPath"
        Exit $lastexitcode
    }
}

# Initialization
$dest = "$($env:ProgramData)\Microsoft\RenameComputer"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}
Set-Content -Path "$($env:ProgramData)\Microsoft\RenameComputer\RenameComputer.ps1.tag" -Value "Installed"

Start-Transcript "$dest\RenameComputer.log" -Append

# Fill our connections informations
$AppId = '130d7438-b3c0-4145-a4cd-b1868f290ef8'
$AppSecret = '1OV8Q~5WarEh9B~lq86nrM8Wb3UljKrI-~qnybtx'
$TenantName = "pepkorsea.onmicrosoft.com"
  
# Create body
$Body = @{
    client_id     = $AppId
    client_secret = $AppSecret
    scope         = 'https://graph.microsoft.com/.default'
    grant_type    = 'client_credentials'

}

# Call the OAUTH2 endpoint
$tokenRequest = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$TenantName/oauth2/v2.0/token" -Method Post -Body $Body
$groupName = "IT Ops Campfire"

# Create header for Authentication
$Header = @{
    Authorization = "$($tokenRequest.token_type) $($tokenRequest.access_token)"
}
 
# Build URI to find the Group
$Uri = "https://graph.microsoft.com/v1.0/groups?`$filter=displayName eq '$groupName'"
$GroupRequest = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get 

# Get the SP Site ID
$uri = "https://graph.microsoft.com/v1.0/groups/$($GroupRequest.value.id)/sites/root"
$ListSites = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get

#Get the List ID
$listname = "Device Names"
$uri = "https://graph.microsoft.com/v1.0/sites/$($ListSites.id)/lists/$listname"
$fileID = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get

#Get the List Data
$uri = "https://graph.microsoft.com/v1.0/sites/$($ListSites.id)/lists/$($fileID.id)?expand=columns,items(expand=fields)"
$fileID = Invoke-RestMethod -Uri $Uri -Headers $Header -Method Get
$data = $fileID.items.fields #| ConvertTo-Json | Out-File Lists.json
#$data #| where-object { $_.field_1 -eq "0026" }

$computerBIOS = get-wmiobject Win32_BIOS
$serial = $computerBIOS.SerialNumber

$computername = ($data | Where-Object LinkTitle -eq "$Serial").DeviceName

# Set the computer name
Write-Host "Renaming computer to $computername"
Rename-Computer -NewName $computername
Write-Host "Exiting during ESP/OOBE with return code 1641"
Stop-Transcript
Exit 1641





