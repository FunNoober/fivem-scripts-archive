msg = ""
RegisterCommand('staffannounce', function(source, args, user)
	if IsPlayerAceAllowed(source, "funnoober.staffAnnounce") then
			for i,v in pairs(args) do
				msg = msg .. " " .. v
			end
			TriggerClientEvent("setrstaff:announce", -1, msg)
			msg = ""
    end
end)