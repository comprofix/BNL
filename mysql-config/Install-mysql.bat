@echo off
REM Run the Install to setup MySQL
"C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySQLInstallerConsole.exe" community install server;5.7.17;X64:*:servertype=Server;ServiceName=MySQL;passwd=%rootpassword%;datadir=%datadir% -silent

REM Update MySQL root user to connect from anyhost
"C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe" -u root -p"%rootpassword%" < users.sql

