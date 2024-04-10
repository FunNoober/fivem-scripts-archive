RegisterCommand("duty", function (source)
    if IsAceAllowed("funnoober.duty") then
        TriggerClientEvent("funnoober:toggleDuty", source)
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"[DISPATCH] ", "YOU DO NOT HAVE PERMISSION TO GO ON DUTY"}
        })
    end
end, false)

RegisterServerEvent("funnoober:putbolo")
AddEventHandler("funnoober:putbolo", function (boloContents, playerName)
    local discordEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Overwatch | BOLO',
            ['description'] = '**Source:**' .. playerName .. "\n" .. "**BOLO Contents:**" .. boloContents,
            ['footer'] = {
                ['text'] = DutyConfig.ServerName
            }
        }
    }
    PerformHttpRequest(DutyConfig.DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DutyConfig.ServerName, embeds = discordEmbed}), { ['Content-Type'] = 'application/json'})
    TriggerClientEvent("funnoober:bolobroadcast", -1, boloContents)
end)

RegisterServerEvent("funnoober:dutytransmit")
AddEventHandler("funnoober:dutytransmit", function (dutyString, playerIdent, onDuty, serverId, onDuty)
    local discordEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Overwatch | Duty',
            ['description'] = '**Officer: **' .. playerIdent .. '\n' .. '**Duty Status: **' ..  dutyString,
            ['footer'] = {
                ['text'] = DutyConfig.ServerName
            }
        }
    }
    local playerName = GetPlayerName(serverId)
    TriggerClientEvent("funnoober:dutyBroadcast", -1, serverId, playerName, onDuty)

    PerformHttpRequest(DutyConfig.DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DutyConfig.ServerName, embeds = discordEmbed}), { ['Content-Type'] = 'application/json' })
end)