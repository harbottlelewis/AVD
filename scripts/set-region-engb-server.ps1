######
## Using AVD UK settings does not change the following data 
######

# Set the culture for the current session to English (United Kingdom)
Set-Culture -CultureInfo en-GB

# Set the home location to UK (GeoId 242)
Set-WinHomeLocation -GeoId 242

# Copy the current user's international settings (language, region, input preferences) 
# to the Welcome screen, system accounts, and all new user accounts
function Copy-UserLocalizationOptions {
    param([bool]$ToWelcomeScreen=$true, [bool]$ToNewUsers=$true)
    $XmlToCopy = @"
<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">
    <gs:UserList>
        <gs:User UserID="Current" CopySettingsToDefaultUserAcct="$ToWelcomeScreen" CopySettingsToSystemAcct="$ToWelcomeScreen" />
        <gs:User UserID="Default" ForceCopySettingsToDefaultUserAcct="$ToNewUsers" />
    </gs:UserList>
</gs:GlobalizationServices>
"@
    $Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Nls\Language'
    if (-not (Test-Path $Path)) { New-Item -Path $Path -Force }
    Set-ItemProperty -Path $Path -Name 'CopySettingsToDefaultUser' -Value $XmlToCopy
}
Copy-UserLocalizationOptions -ToWelcomeScreen $true -ToNewUser $true

# Output confirmation message to indicate the script has completed
Write-Output "Language and region settings copied to Welcome screen, system accounts and new user accounts."

#########
## END ##
#########
