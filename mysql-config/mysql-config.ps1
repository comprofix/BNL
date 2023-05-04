#Set your root password
$rootpassword = 'V3r@$POS11'

#Set the default location for the MySQL Datafiles
$datadir = '"C:/ProgramData/MySQL/MySQL Server 5.7/Data"' 

#Installer Arguments - Server, Version Number, Architecture, Server Type, Root Password, Data File Location
$arguments = "server;5.7.17;X64:*:servertype=Server;ServiceName=MySQL;passwd=$rootpassword;datadir=$datadir" 

#Run the Install to setup MySQL
& "${env:ProgramFiles(x86)}\MySQL\MySQL Installer for Windows\MySQLInstallerConsole.exe" community install "$arguments" -silent 

#Update MySQL root user to connect from anyhost
& "${env:ProgramFiles}\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -p"$rootpassword" -e "UPDATE mysql.user SET Host='%' WHERE User='root' AND Host='localhost'" 

#Set Environment Variable - MYSQL_HOME
[System.Environment]::SetEnvironmentVariable('MYSQL_HOME', 'C:\Program Files\MySQL\MySQL Server 5.7', 'Machine')

#Update Path
Set-ItemProperty -Path HKCU:\Environment\ -Name Path -Value "$((Get-ItemProperty -path HKCU:\Environment\ -Name Path).Path); %MYSQL_HOME%\bin"

#Restart Service
Get-Service -Name MySQL | Restart-Service