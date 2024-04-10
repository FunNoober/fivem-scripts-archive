for i = 1, #Config.adAgencies do
    RegisterCommand(Config.adAgencies[i].command, function(source, args)
        if #args >= 1 then
            local adContents = ""
            for x = 1, #args do
                adContents = adContents .. " " .. args[x]
            end

            local authorColor = Config.authorColors
            local agencyName = Config.adAgencies[i].name
            TriggerClientEvent("funnoober:sendAd", -1, adContents, authorColor, agencyName)
        else
            TriggerClientEvent("chat:addMessage", source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"[AD]", "NOT ENOUGH ARGS"}
            })
        end
    end, false)
end