$assetDirName = "ExampleGame"
$fileName = "ExampleGame.zip"
Add-Type -assembly "system.io.compression.filesystem"

if (-NOT ((Test-Path $assetDirName))) {

"ExampleGame directory not found, downloading..."
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
(New-Object Net.WebClient).DownloadFile('https://github.com/spire-engine/spire-engine/releases/download/v0.2/ExampleGame.zip', $fileName)

# Unzip.
[System.IO.Compression.ZipFile]::ExtractToDirectory($fileName, '.\')

# Delete downloaded zip file.
Remove-Item $fileName

"$assetDirName downloaded and updated."
}
else {
"Directory $assetDirName already exists, aborted."
}
cmd /c pause | out-null