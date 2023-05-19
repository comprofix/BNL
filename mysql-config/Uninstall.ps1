#Remove MySQL Server 5.7
msiexec /x "{CA2A0F6F-15DF-4BBC-AA8F-85EA1758B399}" /qn

#Remove MySQL Server 5.7 Data
Remove-Item 'C:\ProgramData\MySQL\MySQL Server 5.7\' -Recurse -Force
