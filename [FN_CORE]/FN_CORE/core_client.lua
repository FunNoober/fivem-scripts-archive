local currentMoney = Config.startMoney

exports('GetMoney', function ()
    GetMoney()
end)
function GetMoney()
    TriggerServerEvent("fn_core:getPlayerMoney", GetPlayerServerId(PlayerId()))
end

exports('TakeMoney', function (moneyToTake)
    TakeMoney(moneyToTake)
end)
function TakeMoney(moneyToTake)
    currentMoney = currentMoney - moneyToTake
    TriggerServerEvent("fn_core:updatePlayerMoney", currentMoney, GetPlayerServerId(PlayerId()))
    PlaySoundFrontend(-1, "WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", true)
end

exports('AddMoney', function (moneyToAdd, job)
    AddMoney(moneyToAdd, job)
end)
function AddMoney(moneyToAdd, job)
    currentMoney = currentMoney + moneyToAdd
    TriggerServerEvent("fn_core:updatePlayerMoney", currentMoney, GetPlayerServerId(PlayerId()))
    exports["FunNoober_Misc"]:Notify("~c~You have earned ~o~$" .. tostring(moneyToAdd) .. " ~c~for a total balance of ~o~$" .. tostring(currentMoney), "CHAR_BANK_MAZE", "Maze Bank", "~c~" .. job)
end

exports('HasMoneyForProduct', function (costOfProduct)
    return HasMoneyForProduct(costOfProduct)
end)
function HasMoneyForProduct(costOfProduct)
    if currentMoney > costOfProduct then
        return true
    else
        exports["FunNoober_Misc"]:Notify("~c~You do ~r~not ~c~have enough money to make this transaction", "CHAR_BANK_MAZE", "Maze Bank", "~c~Card Declined")
        return false
    end
end

RegisterNetEvent("fn_core:setPlayerMoney")
AddEventHandler("fn_core:setPlayerMoney", function (money)
    currentMoney = money
end)

RegisterCommand("givemoney", function (_, args)
    if #args < 2 then
        TriggerEvent("chat:addMessage", "^*^8NOT ENOUGH ARGS")
        return
    end
    local targetPlayerId = tonumber(args[1]) + 0.0
    local targetMoney = tonumber(args[2]) + 0.0
    if HasMoneyForProduct(targetMoney)then
        TriggerServerEvent("fn_core:transferMoneyToOtherPlayer", targetPlayerId, targetMoney, GetPlayerServerId(PlayerId()))
        exports["FunNoober_Misc"]:Notify('~g~Money transfered successfully', "CHAR_BANK_MAZE", "Maze Bank", "~c~Money Transfer")
        TakeMoney(targetMoney)
    end

end, false)
TriggerEvent("chat:addSuggestion", '/givemoney', 'Give the target player money', {
    { name="Player", help="The player ID you want to give the money to"},
    { name="Amount", help="The amount of money you want to give"}
})

RegisterNetEvent("fn_core:recieveMoneyFromOtherPlayer")
AddEventHandler("fn_core:recieveMoneyFromOtherPlayer", function (targetMoney)
    AddMoney(targetMoney, "Transfer")
end)

-- Wait half second before getting player money
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(500)
        GetMoney()
        break
    end
end)

-- Add passive income
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(Config.timeBetweenMoneyAdd * 1000)
        AddMoney(12.5, 'Deposit')
    end
end)

-- Draw UI on screen
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1)
        if not IsHudHidden() then
            SetTextFont(4)
            SetTextDropshadow(1, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextScale(0.45, 0.45)
            SetTextEntry("STRING")
            AddTextComponentString("~c~Money: ~o~$" .. tostring(currentMoney) .. " ~c~(Bank ID: ~o~" .. GetPlayerServerId(PlayerId()) .. "~c~)")
            DrawText(0.1758, 0.825)
        end
    end
end)