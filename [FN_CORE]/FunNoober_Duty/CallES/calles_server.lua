RegisterServerEvent("funnoober:911callserver")
AddEventHandler("funnoober:911callserver", function (callContents, playerName, location)
    TriggerClientEvent("funnoober:911callbroadcast", -1, callContents, playerName, location)
    local discordEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Overwatch | 911',
            ['description'] = '**Source:** ' .. playerName .. "\n" .. "**Information:** " .. callContents .. "\n" .. "**Location:** " .. location,
            ['footer'] = {
                ['text'] = DutyConfig.ServerName
            }
        }
    }

    PerformHttpRequest(DutyConfig.DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = 'Unreal Dispatch', embeds = discordEmbed}), { ['Content-Type'] = 'application/json' })
end)