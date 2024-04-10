local rpStatus = true
-- RegisterCommand("rpstatus", function (source)
--     if IsPlayerAceAllowed(source, "funnoober.rpStatus") then
--         rpStatus = not rpStatus
--         updateRPStatus(rpStatus, -1, true)
--     else
--         TriggerClientEvent("chat:addMessage", source, {
--             color = {255, 0, 0},
--             multiline = true,
--             args = {"[RP Status] " .. "You do not have the permissions to change the RP status"}
--         })
--     end
-- end, false)

function updateRPStatus(status, source, notifyEveryone)
    if notifyEveryone == false then
        if status == true then
            TriggerClientEvent("funnoober:rpstatus", source, Config.statusOnString)
        else
            TriggerClientEvent("funnoober:rpstatus", source, Config.statusOffString)
        end 
    end

    if notifyEveryone == true then
        if status == true then
            TriggerClientEvent("funnoober:rpstatus", -1, Config.statusOnString)

            local embed = {
                {
                    ['color'] = '6141669',
                    ['title'] = '**Roleplay Status**',
                    ['description'] = 'Roleplay policies are in effect',
                    ['footer'] = {
                        ['text'] = 'Unreal Roleplay'
                    }
                }
            }
            PerformHttpRequest('CHANGE-ME', function(err, text, headers) end, 'POST', json.encode({username = 'RP Status Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
        else
            TriggerClientEvent("funnoober:rpstatus", -1, Config.statusOffString)

            local embed = {
                {
                    ['color'] = '6141669',
                    ['title'] = '**Roleplay Status**',
                    ['description'] = 'Roleplay policies are not in effect',
                    ['footer'] = {
                        ['text'] = 'Unreal Roleplay'
                    }
                }
            }
            PerformHttpRequest('CHANGE-ME', function(err, text, headers) end, 'POST', json.encode({username = 'RP Status Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
        end
    end
end

local function updateRPStatusOnPlayerJoin()
    local player = source
    updateRPStatus(rpStatus, player, false)
end

AddEventHandler("playerJoining", updateRPStatusOnPlayerJoin)