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
if ((Get-PackageSource -Name chocolatey -ErrorAction SilentlyContinue).Name -NotMatch "chocolatey") {
  Register-PackageSource -provider NuGet -name nugetRepository -location http://www.nuget.org/api/v2 -Force
}

# Windows Options/Features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Install Chocolatey Packages
Install -PackageName 7zip.install -ProviderName chocolatey -AdditionalParameters "-Force"
Install-Package nodejs.install -ProviderName chocolatey -Force
Install-Package ruby -ProviderName chocolatey -Force
Install-Package python -ProviderName chocolatey -Force

Install-Package gow -ProviderName chocolatey -Force
Install-Package cmder -ProviderName chocolatey -Force
Install-Package git -ProviderName chocolatey -Force
Install-Package poshgit -ProviderName chocolatey -Force
Install-Package git-credential-manager-for-windows -ProviderName chocolatey -Force
Install-Package sysinternals -ProviderName chocolatey -Force

Install-Package googlechrome -ProviderName chocolatey -Force
Install-Package fiddler4 -ProviderName chocolatey -Force
Install-Package infranview -ProviderName chocolatey -Force
Install-Package putty -ProviderName chocolatey -Force
Install-Package visualstudiocode -ProviderName chocolatey -Force

function Install {
  param ([string]$PackageName, [string]$ProviderName, [bool]$AddtionalParameters
  Write-Host "Installing $PackageName from $ProviderName" -ForeGroundColor "White"
  try {
    Install-Package $PackageName -ProviderName $ProviderName $AdditionalParamters -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Write-Host "Installed: $PackageName" -ForeGroundColor "Green"
  } catch {
    Write-Host "Not Installed: $PackageName" -ForeGroundColor "Red"
    # Write Log
  }
}
