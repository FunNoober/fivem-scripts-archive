local aop = {"Whole Map"}
SetConvarReplicated("unrealroleplay_aop", "Whole Map")

RegisterCommand("aop", function (source, args, rawCommand)
    if Config.useAce == true then
        if IsPlayerAceAllowed(source, "aop.aop") then
            if #args > 0 then
                aop = args
                TriggerClientEvent("aop:updateText", -1, aop)
                
                local aopString = ''
                for i = 1, #args do
                    aopString = aopString .. ' ' .. args[i]
                end
                SetConvarReplicated("unrealroleplay_aop", aopString)
                local embed = {
                    {
                        ['color'] = '6141669',
                        ['title'] = '**Area of Patrol**',
                        ['description'] = 'Area of patrol has changed to: ' .. '**' .. aopString .. '**';
                        ['footer'] = {
                            ['text'] = 'Unreal Roleplay'
                        }
                    }
                }

                PerformHttpRequest('CHANGE-ME', function(err, text, headers) end, 'POST', json.encode({username = 'AOP Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })

            else
                TriggerClientEvent("aop:notEnoughArgs", source)
            end
        else
            TriggerClientEvent("aop:noPerms", source)
        end
    end
end, false)

local function updateAOPOnPlayerJoin()
    local player = source
    TriggerClientEvent("aop:updateText", player, aop)
end

AddEventHandler("playerJoining", updateAOPOnPlayerJoin)