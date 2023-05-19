Start-Transcript -Path C:\Windows\Logs\mysql-configuration-install.log

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

Stop-Transcript
