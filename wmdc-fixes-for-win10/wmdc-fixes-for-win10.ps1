Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)

# Initialization
$dest = "$($env:ProgramData)\Autopilot\wmdc-fixes-for-win10"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}

Start-Transcript "$dest\wmdc-fixes-for-win10.log" -Append
 
If ($Mode -eq "Install") {
    #Online installer
    msiexec /i wmdc-fixes-for-win10.msi /qn /norestart
}
 
If ($Mode -eq "Uninstall") {
    msiexec /x "{1C006B25-7582-4534-A588-866056B45D79}" /qn /norestart
}
Set-Content -Path "$dest\wmdc-fixes-for-win10.ps1.tag" -Value "Installed"
Stop-Transcript
Exit 0