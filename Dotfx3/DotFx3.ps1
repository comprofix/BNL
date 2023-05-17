Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)

# If we are running as a 32-bit process on an x64 system, re-launch as a 64-bit process
if ("$env:PROCESSOR_ARCHITEW6432" -ne "ARM64") {
    if (Test-Path "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe") {
        & "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy bypass -File "$PSCommandPath"
        Exit $lastexitcode
    }
}

# Initialization
$dest = "$($env:ProgramData)\Autopilot\DotFx3"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}

Start-Transcript "$dest\DotFx3.log" -Append
 
If ($Mode -eq "Install") {
    if (Test-path .\sxs\Microsoft-Windows-NetFx3-OnDemand-Package*.cab) {
        #Offline Installer
        Enable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -Source .\sxs\ -NoRestart -LimitAccess
        Set-Content -Path "$dest\DotFx3.ps1.tag" -Value "Installed"
        Stop-Transcript
        Exit 1641
 
    }
    else {
        #Online installer
        Enable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -NoRestart
        Set-Content -Path "$dest\DotFx3.ps1.tag" -Value "Installed"
        Stop-Transcript
        Exit 1641
    }
 
}
 
If ($Mode -eq "Uninstall") {
 
    Disable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -Remove -NoRestart
    Stop-Transcript
    Exit 1641 
}

Stop-Transcript
Exit 0

