$mavenDownloadUrl = "https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip"
$mavenDownloadSavePath = [System.String]::Concat($env:HOMEDRIVE, $env:HOMEPATH, "\Downloads\apache-maven-3.9.11-bin.zip")
$mavensha512url = "https://downloads.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip.sha512"
$mavensha512path = [System.String]::Concat($env:HOMEDRIVE, $env:HOMEPATH, "\Downloads\apache-maven-3.9.11-bin.zip.sha512")
[Environment]::SetEnvironmentVariable("JAVA_HOME", "${env:ProgramFiles(x86)}\Android\openjdk\jdk-17.0.14", "User")

Write-Host "Downloading Maven binary"
Start-BitsTransfer -Source $mavenDownloadUrl -Destination $mavenDownloadSavePath

Write-Host "Downloading Maven binary checksum"
Start-BitsTransfer -Source $mavensha512url -Destination $mavensha512path

Write-Host "Validating checksum of Maven binary zip file against checksum" 
(Get-FileHash -Algorithm SHA512 $mavenDownloadSavePath | Select-Object -ExpandProperty Hash).ToLower().Equals(Get-Content -Path $mavensha512path)