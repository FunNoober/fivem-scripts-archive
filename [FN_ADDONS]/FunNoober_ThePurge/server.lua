RegisterCommand("purge", function (source, args, rawCommand)
    if IsPlayerAceAllowed(source, "purge.purge") then
        TriggerClientEvent("purge", -1)
    else
        TriggerClientEvent("notGovernmentOfficial", source)
    end
end, false)