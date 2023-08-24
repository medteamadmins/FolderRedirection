$FolderRedirection = "C:\ProgramData\TMT"
If (Test-Path $FolderRedirection) {
    Write-Output "$FolderRedirection exists. Skipping."
}
Else {
    Write-Output "The folder '$FolderRedirection' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$FolderRedirection" -ItemType Directory
    Write-Output "The folder $FolderRedirection was successfully created."
}

$templateFilePath = "C:\ProgramData\TMT\FolderRedirection.ps1"

Invoke-WebRequest `
-Uri "https://https://github.com/medteamadmins/FolderRedirection/FolderRedirection.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}

invoke-expression -Command $templateFilePath
