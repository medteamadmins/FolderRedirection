# Validate the root path
    if(!(Test-Path "D:\$($env:USERNAME)" -PathType Container))
    {
    New-Item -Path "D:\$($env:USERNAME)" -ItemType Directory -Force
    Get-ACL $env:USERPROFILE | Set-Acl D:\$($env:USERNAME)
    New-Item -Path "D:\$($env:USERNAME)\Downloads" -ItemType Directory -Force
    New-Item -Path "D:\$($env:USERNAME)\Documents" -ItemType Directory -Force
    New-Item -Path "D:\$($env:USERNAME)\Desktop" -ItemType Directory -Force
    $OutlookshortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "Outlook Web App.lnk")
    $TeamsshortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "Teams Web App.lnk")
    $Office365shortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "Office 365 Portal.lnk")
    Copy-Item -Path $OutlookshortcutPath -Destination "D:\$($env:USERNAME)\Desktop"
    Copy-Item -Path $TeamsshortcutPath -Destination "D:\$($env:USERNAME)\Desktop"
    Copy-Item -Path $Office365shortcutPath -Destination "D:\$($env:USERNAME)\Desktop"
    }
    
    $FolderRedirection = "C:\ProgramData\TMT\FolderRedirection"
If (Test-Path $FolderRedirection) {
}
Else {
    
    Start-Sleep 1
    New-Item -Path "$FolderRedirection" -ItemType Directory
  
}

$templateFilePath = "C:\ProgramData\TMT\FolderRedirection\FolderRedirection.ps1"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/medteamadmins/FolderRedirection/main/FolderRedirection.ps1" -OutFile "C:\ProgramData\TMT\FolderRedirection\FolderRedirection.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/medteamadmins/FolderRedirection/main/KnownFolderPathPS5.ps1" -OutFile "C:\ProgramData\TMT\FolderRedirection\KnownFolderPathPS5.ps1"

invoke-expression -Command $templateFilePath
