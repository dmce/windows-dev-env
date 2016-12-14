# Set session to use default proxy
(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# Install Chocolatey 
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Windows Options/Features
if ((Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online).State -NotMatch "Enabled") {
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
}

# Install Chocolatey Packages
cinst -y 7zip
cinst -y nodejs
cinst -y ruby
cinst -y python

cinst -y gow
cinst -y cmder
cinst -y git
cinst -y poshgit
cinst -y git-credential-manager-for-windows
cinst -y sysinternals

cinst -y googlechrome
cinst -y fiddler4
cinst -y infranview
cinst -y putty
cinst -y visualstudiocode
