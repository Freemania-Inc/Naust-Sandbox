$downloadSourceACT = "https://advancedcombattracker.com/download.php?id=56"
$ACTSaveLocation = [System.String]::Concat($env:HOMEDRIVE, $env:HOMEPATH, "\Downloads\ACTv3.exe")
$ACTArgList = "/S"

Write-Host "Downloading ACT Program for development"
Start-BitsTransfer -Source $downloadSourceACT -Destination $ACTSaveLocation -TransferType Download

Write-Host "Installing ACT Program"
Start-Process $ACTSaveLocation -ArgumentList $ACTArgList