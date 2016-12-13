# Set session to use default proxy
(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# Install Chocolatey package provider
Get-PackageProvider -name chocolatey
