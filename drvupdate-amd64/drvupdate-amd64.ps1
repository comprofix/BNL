Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)

# Initialization
$dest = "$($env:ProgramData)\Autopilot\drvupdate-amd64"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}

Start-Transcript "$dest\drvupdate-amd64.msi.log" -Append
 
If ($Mode -eq "Install") {
    #Online installer
    msiexec /i drvupdate-amd64.msi /qn /norestart
}
 
If ($Mode -eq "Uninstall") {
    msiexec /x "{1C006B25-7582-4534-A588-866056B45D79}" /qn /norestart
}
Set-Content -Path "$dest\drvupdate-amd64.msi.tag" -Value "Installed"
Stop-Transcript
Exit 0