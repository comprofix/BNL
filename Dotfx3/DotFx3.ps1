Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)

# Initialization
$dest = "$($env:ProgramData)\Autopilot\DotFx3"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}

Start-Transcript "$dest\DotFx3.log" -Append
 
If ($Mode -eq "Install") {
    #Online installer
    Enable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -NoRestart
}
 
If ($Mode -eq "Uninstall") {
    Disable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -Remove -NoRestart
}
Set-Content -Path "$dest\DotFx3.ps1.tag" -Value "Installed"
Stop-Transcript
Exit 0

