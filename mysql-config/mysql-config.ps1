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
$dest = "$($env:ProgramData)\Autopilot\MySQL Config"
if (-not (Test-Path $dest)) {
    New-Item -Path $dest -ItemType Directory
}
Set-Content -Path "$dest\mysql-configuration.ps1.tag" -Value "Installed"

Start-Transcript "$dest\mysql-configuration.log" -Append

If ($Mode -eq "Install") {
    #Set your root password
    $ENV:rootpassword = 'V3r@$POS11'

    #Set the default location for the MySQL Datafiles
    $ENV:datadir = '"C:/ProgramData/MySQL/MySQL Server 5.7/Data"' 

    #Install MySQL
    Start-Process -FilePath Install-mysql.bat -wait

    #Set Environment Variable - MYSQL_HOME
    [System.Environment]::SetEnvironmentVariable('MYSQL_HOME', 'C:\Program Files\MySQL\MySQL Server 5.7', 'Machine')

    #Update Path
    [System.Environment]::SetEnvironmentVariable('PATH', $ENV:Path + ';%MYSQL_HOME%\bin', 'Machine')

    #Restart Service
    Get-Service -Name MySQL | Restart-Service
}

If ($Mode -eq "Uninstall") {
    #Remove MySQL Server 5.7
    msiexec /x "{CA2A0F6F-15DF-4BBC-AA8F-85EA1758B399}" /qn

    #Remove MySQL Server 5.7 Data
    Remove-Item 'C:\ProgramData\MySQL\MySQL Server 5.7\' -Recurse -Force
}


Stop-Transcript
Exit 0