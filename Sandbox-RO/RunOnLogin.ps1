$downloadSourceVSPro = "https://aka.ms/vs/17/release.ltsc.17.12/vs_professional.exe"
$VSProSaveLocation = [System.String]::Concat($env:HOMEDRIVE, $env:HOMEPATH, "\Downloads\vs_BuildTools.exe")
$VSProArgList = "-p --wait --productKey !vs_product_key!"

Write-Host "Downloading microsoft vs tools for compilation"
Start-BitsTransfer -Source $downloadSourceVSPro -Destination $VSProSaveLocation -TransferType Download

Write-Host "Installing MS Build tools Silently"
Start-Process $VSProSaveLocation -ArgumentList $VSProArgList

Write-Host "Done with Windows Sandbox startup..."

