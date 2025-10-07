# Define the URL of the certificate file in the GitHub repo
$certUrl = "https://raw.githubusercontent.com/<username>/<repo>/main/<path-to-cert>/<certfile>.cer"

# Define a temporary path to save the downloaded certificate
$tempCertPath = "$env:TEMP\downloadedcert.cer"

# Download the certificate file
Invoke-WebRequest -Uri $certUrl -OutFile $tempCertPath

# Install the certificate to the Trusted Root Certification Authorities store
Import-Certificate -FilePath $tempCertPath -CertStoreLocation "Cert:\LocalMachine\Root"

# Remove the temporary certificate file
Remove-Item $tempCertPath

Write-Host "Certificate installed to Trusted Root Certification Authorities."