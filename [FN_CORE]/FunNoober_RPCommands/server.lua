local DISCORD_WEBHOOK = "CHANGE-ME"
local RP_COMMAND_TITLE = "🛡 RP Command 🛡"

for i = 1, #Config.Commands do
    RegisterCommand(Config.Commands[i].commandName, function (source, args)
        local message = ""
        if #args > 0 then
            for x = 1, #args do
                message = message .. ' ' .. args[x]
            end
            local player = GetPlayerName(source)
            TriggerClientEvent("chat:addMessage", -1, {
                color = Config.Commands[i].doColor,
                multiline = true,
                args = {Config.Commands[i].doName .. player, message}
            })

            RPCommandLog(message, GetPlayerName(source), Config.Commands[i].doName)
        end
    end, false)
end

function RPCommandLog(message, player, command)
    local embed = {
        {
            ['color'] = '6141669',
            ['title'] = RP_COMMAND_TITLE,
            ['description'] = RPCommandString(message, player, command),
            ['footer'] = {
                ['text'] = 'Westside San Andreas Roleplay'
            }
        }
    }

    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = 'RP Command Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function RPCommandString(message, player, typeOfCommand)
    return "**Message:**" .. message .. "\n" .. "**Player: **" .. player .. "\n" .. "**Command: **" .. typeOfCommand
end