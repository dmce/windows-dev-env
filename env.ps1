# Set session to use default proxy
(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# Set Execution Policy - Needed?
#Set-ExecutionPolicy unrestrcited

# Install Chocolatey package provider
Get-PackageProvider -Name chocolatey
#Set-PackageSource -Name chocolatey -Trusted

# Install Nuget package provider
Get-PackageProvider -Name nuget
#Set-PackageSource -Name nuget -Trusted
# https://github.com/OneGet/oneget/wiki/Q-and-A
Register-PackageSource -provider NuGet -name nugetRepository -location http://www.nuget.org/api/v2

# Windows Options/Features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Install Chocolatey Packages
Install-Package 7zip.install -ProviderName chocolatey
Install-Package nodejs.install -ProviderName chocolatey
Install-Package ruby -ProviderName chocolatey
Install-Package python -ProviderName chocolatey

Install-Package gow -ProviderName chocolatey
Install-Package cmder -ProviderName chocolatey
Install-Package git -ProviderName chocolatey
Install-Package poshgit -ProviderName chocolatey
Install-Package git-credential-manager-for-windows -ProviderName chocolatey
Install-Package sysinternals -ProviderName chocolatey

Install-Package googlechrome -ProvderName chocolatey
Install-Package fiddler4 -ProviderName chocolatey
Install-Package infranview -ProviderName chocolatey
Install-Package putty -ProviderName chocolatey
Install-Package visualstudiocode -ProviderName chocolatey
