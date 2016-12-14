# Set session to use default proxy
(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

function InstallChocoPackage {
  param ([string]$PackageName)
  Write-Host "Installing $PackageName from Chocolatey" -ForeGroundColor "White"
  try {    
    Install-Package $PackageName -ProviderName chocolatey -Force -ErrorAction Stop -WarningAction Stop
    Write-Host "Installed: $PackageName" -ForeGroundColor "Green"
  } catch {
    Write-Host "Not Installed: $PackageName" -ForeGroundColor "Red"
    # Write Log
  }
}

# Set Execution Policy - Needed? Possibly not if ean with "Run with Powershell"
# Set-ExecutionPolicy unrestrcited

# Install Chocolatey package provider
try {
  Install-PackageProvider chocolatey -ForceBootstrap -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
  #Set-PackageSource -Name chocolatey -Trusted
} catch {
  # Log
}

# Install Nuget package provider
try {
  Install-PackageProvider nuget -ForceBootstrap -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
  #Set-PackageSource -Name nuget -Trusted
  # https://github.com/OneGet/oneget/wiki/Q-and-A
  if ((Get-PackageSource -ProviderName NuGet -ErrorAction SilentlyContinue).ProviderName -NotMatch "NuGet") {
    Register-PackageSource -provider NuGet -name nugetRepository -location http://www.nuget.org/api/v2 -Force
  }
} catch {
  # Log
}

# Windows Options/Features
if ((Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online).State -NotMatch "Enabled") {
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}

# Install Chocolatey Packages
InstallChocoPackage -PackageName 7zip.install
InstallChocoPackage -PackageName nodejs.install
InstallChocoPackage -PackageName ruby
InstallChocoPackage -PackageName python

InstallChocoPackage -PackageName gow
InstallChocoPackage -PackageName cmder
InstallChocoPackage -PackageName git
InstallChocoPackage -PackageName poshgit
InstallChocoPackage -PackageName git-credential-manager-for-windows
InstallChocoPackage -PackageName sysinternals

InstallChocoPackage -PackageName googlechrome
InstallChocoPackage -PackageName fiddler4
InstallChocoPackage -PackageName infranview
InstallChocoPackage -PackageName putty
InstallChocoPackage -PackageName visualstudiocode
