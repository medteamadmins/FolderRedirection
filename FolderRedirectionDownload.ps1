# Validate the root path
    New-Item C:\CheckingRootPath.txt
    if(!(Test-Path "D:\$($env:USERNAME)" -PathType Container))
    {
    New-Item -Path "D:\$($env:USERNAME)" -ItemType Directory -Force
    Get-ACL $env:USERPROFILE | Set-Acl D:\$($env:USERNAME)
    New-Item -Path "D:\$($env:USERNAME)\Downloads" -ItemType Directory -Force
    New-Item -Path "D:\$($env:USERNAME)\Documents" -ItemType Directory -Force
    New-Item -Path "D:\$($env:USERNAME)\Desktop" -ItemType Directory -Force
    }
    
    $FolderRedirection = "C:\ProgramData\TMT\FolderRedirection"
If (Test-Path $FolderRedirection) {
    Write-Output "$FolderRedirection exists. Skipping."
}
Else {
    Write-Output "The folder '$FolderRedirection' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$FolderRedirection" -ItemType Directory
    Write-Output "The folder $FolderRedirection was successfully created."
}

$templateFilePath = "C:\ProgramData\TMT\FolderRedirection\FolderRedirection.ps1"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/medteamadmins/FolderRedirection/FolderRedirection.ps1" -OutFile "C:\ProgramData\TMT\FolderRedirection\FolderRedirection.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/medteamadmins/FolderRedirection/KnownFolderPathPS5.ps1" -OutFile "C:\ProgramData\TMT\FolderRedirection\KnownFolderPathPS5.ps1"

invoke-expression -Command $templateFilePath
