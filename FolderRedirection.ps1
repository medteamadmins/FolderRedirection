Import-Module C:\ProgramData\TMT\KnownFolderPathPS5.ps1

Set-KnownFolderPath Desktop "D:\$($ENV:USERPROFILE)\Desktop"
Set-KnownFolderPath Documents "D:\$($ENV:USERPROFILE)\Documents"
Set-KnownFolderPath Downloads "D:\$($ENV:USERPROFILE)\Downloads"
