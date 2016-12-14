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
Install -PackageName nodejs.install -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName ruby -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName python -ProviderName chocolatey -AdditionalParameters "-Force"

Install -PackageName gow -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName cmder -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName git -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName poshgit -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName git-credential-manager-for-windows -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName sysinternals -ProviderName chocolatey -AdditionalParameters "-Force"

Install -PackageName googlechrome -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName fiddler4 -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName infranview -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName putty -ProviderName chocolatey -AdditionalParameters "-Force"
Install -PackageName visualstudiocode -ProviderName chocolatey -AdditionalParameters "-Force"

function Install {
  param ([string]$PackageName, [string]$ProviderName, [bool]$AddtionalParameters)
  Write-Host "Installing $PackageName from $ProviderName" -ForeGroundColor "White"
  try {
    Install-Package $PackageName -ProviderName $ProviderName $AdditionalParamters -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Write-Host "Installed: $PackageName" -ForeGroundColor "Green"
  } catch {
    Write-Host "Not Installed: $PackageName" -ForeGroundColor "Red"
    # Write Log
  }
}
