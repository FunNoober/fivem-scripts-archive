local playerFile = LoadResourceFile(GetCurrentResourceName(), "./core_players.json")
local playerInformation = {}
local playerInformation = json.decode(playerFile)

local DISCORD_WEBHOOK = "CHANGE-ME"

RegisterNetEvent("fn_core:updatePlayerMoney")
AddEventHandler("fn_core:updatePlayerMoney", function(moneyToAdd, playerId)

    local logEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Money Updated',
            ['description'] = '**Player Name:** ' .. GetPlayerName(playerId) .. "\n**Total Money Amount:** " .. moneyToAdd,
            ['footer'] = {
                ['text'] = 'Unreal Roleplay Economy'
            }
        }
    }

    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = 'Economy Money Logs', embeds = logEmbed}), { ['Content-Type'] = 'application/json'})
    for i = 1, #playerInformation do
        if playerInformation[i].licenseIdentifier == GetPlayerIdentifierByType(playerId, 'license') then
            playerInformation[i].moneyPlayerHas = moneyToAdd
            SaveResourceFile(GetCurrentResourceName(), "./core_players.json", json.encode(playerInformation), -1)
            RequestPlayerFile()
            return
        end
    end

    local playerInfoTable = {
        licenseIdentifier = GetPlayerIdentifierByType(playerId, 'license'),
        moneyPlayerHas = moneyToAdd
    }
    table.insert(playerInformation, playerInfoTable)
    SaveResourceFile(GetCurrentResourceName(), "./core_players.json", json.encode(playerInformation), -1)
    RequestPlayerFile()
end)

RegisterNetEvent("fn_core:getPlayerMoney")
AddEventHandler("fn_core:getPlayerMoney", function (playerId)
    RequestPlayerFile()
    for i = 1, #playerInformation do
        if playerInformation[i].licenseIdentifier == GetPlayerIdentifierByType(playerId, 'license') then
            TriggerClientEvent("fn_core:setPlayerMoney", playerId, playerInformation[i].moneyPlayerHas)
        end
    end
end)

function RequestPlayerFile()
    playerFile = LoadResourceFile(GetCurrentResourceName(), "./core_players.json")
    playerInformation = {}
    playerInformation = json.decode(playerFile)
end

RegisterNetEvent("fn_core:transferMoneyToOtherPlayer")
AddEventHandler("fn_core:transferMoneyToOtherPlayer", function (targetPlayerId, targetMoney, sourcePlayerId)
    TriggerClientEvent("fn_core:recieveMoneyFromOtherPlayer", targetPlayerId, targetMoney)

    local targetPlayerName = GetPlayerName(targetPlayerId)
    local sourcePlayerName = GetPlayerName(sourcePlayerId)
    local moneyAmount = targetMoney

    local logEmbed = {
        {
            ['color'] = '6141669',
            ['title'] = 'Money Transferred',
            ['description'] = '**Giving From:** ' .. sourcePlayerName .. "\n**Giving To:** " .. targetPlayerName .. "\n**Money Amount** " .. moneyAmount,
            ['footer'] = {
                ['text'] = 'Unreal Roleplay Economy'
            }
        }
    }

    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = 'Economy Money Logs', embeds = logEmbed}), { ['Content-Type'] = 'application/json'})
end)