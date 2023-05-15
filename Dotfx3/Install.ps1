# Based on - https://timmyit.com/2019/06/17/how-to-deploy-net-3-5-with-intune/

Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Install", "Uninstall")]
    [String[]]
    $Mode
)
 
If ($Mode -eq "Install") {
    #Online installer
    Enable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -NoRestart
}
 
If ($Mode -eq "Uninstall") {
 
    Disable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -Remove -NoRestart
}