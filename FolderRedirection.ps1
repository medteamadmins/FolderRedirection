Import-Module C:\ProgramData\TMT\FolderRedirection\KnownFolderPathPS5.ps1 -Force

Set-KnownFolderPath Desktop "D:\$($ENV:USERPROFILE)\Desktop"
Set-KnownFolderPath Documents "D:\$($ENV:USERPROFILE)\Documents"
Set-KnownFolderPath Downloads "D:\$($ENV:USERPROFILE)\Downloads"
