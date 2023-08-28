Import-Module C:\ProgramData\TMT\FolderRedirection\KnownFolderPathPS5.ps1 -Force

Set-KnownFolderPath Desktop "D:\$($ENV:USERNAME)\Desktop"
Set-KnownFolderPath Documents "D:\$($ENV:USERNAME)\Documents"
Set-KnownFolderPath Downloads "D:\$($ENV:USERNAME)\Downloads"
