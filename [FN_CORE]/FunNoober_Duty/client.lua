onDuty = false

local DISPATCH_TXD = DutyConfig.DISPATCH_TXD
local DISPATCH_AUTHOR = DutyConfig.DISPATCH_AUTHOR
local DISPATCH_SUBHEADING = DutyConfig.DISPATCH_SUBHEADING
local cooldownOnArmor = 0

TriggerEvent("chat:addSuggestion", "/duty", 'Toggle your duty status')
TriggerEvent("chat:addSuggestion", "/bolo", "Put out a BOLO", {
    { name="Description", help="What is the description of the BOLO"}
})

exports('DutyStatus', function()
    return onDuty
end)

RegisterNetEvent("funnoober:toggleDuty")
AddEventHandler("funnoober:toggleDuty", function()
    toggleDuty()
end)
function toggleDuty()
    local dutyString = ''
    if onDuty == true then
        onDuty = false
        exports["FunNoober_Misc"]:Notify("~c~You are now ~r~off duty", DISPATCH_TXD, DISPATCH_AUTHOR, DISPATCH_SUBHEADING)
        dutyString = 'Off duty'
    else
        onDuty = true
        exports["FunNoober_Misc"]:Notify("~c~You are now ~o~on duty", DISPATCH_TXD, DISPATCH_AUTHOR, DISPATCH_SUBHEADING)
        dutyString = 'On duty'
    end
    local playerIdent = GetPlayerName(PlayerId()) .. " (" .. GetPlayerServerId(PlayerId()) .. ")"
    TriggerServerEvent("funnoober:dutytransmit", dutyString, playerIdent, onDuty, GetPlayerServerId(PlayerId()), onDuty)
end

RegisterNetEvent("funnoober:dutyBroadcast")
AddEventHandler("funnoober:dutyBroadcast", function (ogPlayer, ogPlayerName, dutyStatus)
    if onDuty == true then
        if GetPlayerServerId(PlayerId()) == ogPlayer then
            return
        end
        if dutyStatus == true then
            exports["FunNoober_Misc"]:Notify("~o~" .. ogPlayerName .. " ~c~Is now on duty")
        else
            exports["FunNoober_Misc"]:Notify("~o~" .. ogPlayerName .. " ~c~Is now off duty")
        end
    end
end)

TriggerEvent("chat:addSuggestion", "/armor", "Equip armor", {
    { name = "Amount", help="superlight, light, medium, heavy, superheavy"}
})
RegisterCommand("armor", function (_, args)
    armor(args)
end, false)

function armor(args)
    if onDuty == false then
        exports["FunNoober_Misc"]:Notify("~r~You have to be on duty to use armor", DISPATCH_TXD, DISPATCH_AUTHOR, "~c~Armor")
        return
    end
    if cooldownOnArmor > 0 then
        exports["FunNoober_Misc"]:Notify("~r~Armor is on cooldown", DISPATCH_TXD, DISPATCH_AUTHOR, "~c~Armor")
        return
    end
    local playerPed = GetPlayerPed(PlayerId())
    if args[1] == "superlight" then
        givePedArmor(playerPed, 15)
        return
    elseif args[1] == "light" then
        givePedArmor(playerPed, 30)
        return
    elseif args[1] == "medium" then
        givePedArmor(playerPed, 50)
        return
    elseif args[1] == "heavy" then
        givePedArmor(playerPed, 75)
        return
    elseif args[1] == "superheavy" then
        givePedArmor(playerPed, 100)
        return
    end
end

function givePedArmor(ped, armor)
    SetPedArmour(ped, armor)
    exports["FunNoober_Misc"]:Notify("~o~Armor given", DISPATCH_TXD, DISPATCH_AUTHOR, "~c~Armor")
    cooldownOnArmor = 25
end

RegisterCommand("bolo", function (_ ,args)
    bolo(args)
end, false)
function bolo(args)
    if onDuty == true then
        if #args >= 1 then
            local playerName = GetPlayerName(PlayerId()) .. " (" .. GetPlayerServerId(PlayerId()) .. ")"
            local boloContents = ""
            for i = 1, #args do
                boloContents = boloContents .. " " .. args[i]
            end
            TriggerServerEvent("funnoober:putbolo", boloContents, playerName)
        else
            TriggerEvent("chat:addMessage", {
                color = {255, 0, 0},
                multiline = true,
                args = {"[DISPATCH]", "NOT ENOUGH ARGS"}
            })
        end
    end
end

RegisterNetEvent("funnoober:bolobroadcast")
AddEventHandler("funnoober:bolobroadcast", function (boloContents)
    if onDuty == true then
        exports["FunNoober_Misc"]:Notify("BOLO:" .. boloContents, DISPATCH_TXD, DISPATCH_AUTHOR, DISPATCH_SUBHEADING)
        TriggerEvent("chat:addMessage", "^*^2----------")
        TriggerEvent("chat:addMessage", "^*^2 NEW BOLO:")
        TriggerEvent("chat:addMessage", boloContents)
        TriggerEvent("chat:addMessage", "^*^2----------")
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if not IsHudHidden() then
            SetTextFont(4)
            SetTextDropshadow(1, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextScale(0.4, 0.4)
            SetTextCentre(true)
            SetTextEntry("STRING")
            if onDuty then
                AddTextComponentString("~o~On duty")
            else
                AddTextComponentString("~r~Off duty")
            end
            DrawText(0.5, 0.975)
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(120.0 * 1000.0)
        if onDuty then
            exports['FN_CORE']:AddMoney(3.5, 'Paycheck')
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        if cooldownOnArmor > 0 then
            cooldownOnArmor = cooldownOnArmor - 1
        end
        Citizen.Wait(1000)
    end
end)