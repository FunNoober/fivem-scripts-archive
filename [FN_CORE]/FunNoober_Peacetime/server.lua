local peacetime = false

RegisterCommand("peacetime", function (source, args, rawCommand)
    if Config.useAce == true then
        if IsPlayerAceAllowed(source, "peacetime.peacetime") then
            peacetime = not peacetime
            TriggerClientEvent("updateTextAOP", -1, peacetime)
        end
    else
        peacetime = not peacetime
        TriggerClientEvent("updateTextAOP", -1, peacetime)
    end
end, false)