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
Install-Package 7zip.install -ProviderName chocolatey -Force
Install-Package nodejs.install -ProviderName chocolatey -Force
Install-Package ruby -ProviderName chocolatey -Force
Install-Package python -ProviderName chocolatey -Force

Install-Package gow -ProviderName chocolatey -Force
Install-Package cmder -ProviderName chocolatey -Force
Install-Package git -ProviderName chocolatey -Force
Install-Package poshgit -ProviderName chocolatey -Force
Install-Package git-credential-manager-for-windows -ProviderName chocolatey -Force
Install-Package sysinternals -ProviderName chocolatey -Force

Install-Package googlechrome -ProvderName chocolatey -Force
Install-Package fiddler4 -ProviderName chocolatey -Force
Install-Package infranview -ProviderName chocolatey -Force
Install-Package putty -ProviderName chocolatey -Force
Install-Package visualstudiocode -ProviderName chocolatey -Force
