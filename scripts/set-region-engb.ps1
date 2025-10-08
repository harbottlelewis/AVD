######
## Using AVD UK settings does not change the following data 
######

# Set the culture for the current session to English (United Kingdom)
Set-Culture -CultureInfo en-GB

# Set the home location to UK (GeoId 242)
Set-WinHomeLocation -GeoId 242

# Copy the current user's international settings (language, region, input preferences) 
# to the Welcome screen, system accounts, and all new user accounts
Copy-UserInternationalSettingsToSystem -WelcomeScreen $true -NewUser $true

# Output confirmation message to indicate the script has completed
Write-Output "Language and region settings copied to Welcome screen, system accounts and new user accounts."

#########
## END ##
#########
