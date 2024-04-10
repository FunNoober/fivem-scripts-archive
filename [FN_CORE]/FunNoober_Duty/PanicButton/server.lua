RegisterNetEvent("sendPanic")
AddEventHandler("sendPanic", function (args)
    TriggerClientEvent("recievePanic", -1, args)
    local discordEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Overwatch | Panic Button',
            ['description'] = '**Officer: **' .. args.playName,
            ['footer'] = {
                ['text'] = DutyConfig.ServerName
            }
        }
    }

    PerformHttpRequest(DutyConfig.DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DutyConfig.ServerName, embeds = discordEmbed}), { ['Content-Type'] = 'application/json' })
end)