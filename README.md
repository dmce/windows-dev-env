##windows-dev-env
###Required Environment Changes
A number of these would be covered by developer mode if it was available

* Show Hidden Filed, Folders & Drives
* Show Protected OS Files
* Show File Extensions
* Show Full Path in Title Bar
* Set Powershell to unrestricted (Is this needed in WMF v5)
* Taskbar Small
* Taskbar Lock
* Taskbar Always Group

### Issues
* Chocolatey packages are a potential risk to organisation
* Should Chocolatey source be marked as trusted
* Webmarshall blocks nupkg from packages.chocolatey.org (Analysis Rules\Analyze Files\Block - Encrypted Archives)
* Security Settings block other install packages from other source (i.e. 7zip comes from 7zip and is an exe)
* Developer Mode
* UAC
* Chocolatey Provider for OneGet isnt official
