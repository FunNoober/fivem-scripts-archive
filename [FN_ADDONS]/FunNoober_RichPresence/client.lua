Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(CHANGE-ME)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('urrp-logo-rebrand')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Westside Roleplay')
    
        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join", "https://cfx.re/join/466rbv")
        SetDiscordRichPresenceAction(1, "Discord", "https://dsc.gg/wsar")

        -- It updates every minute just in case.
		Citizen.Wait(120000)
	end
end)