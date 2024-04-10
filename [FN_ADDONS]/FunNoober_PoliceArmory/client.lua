-- Fun Noober - 2023

function InitializeBlips()
    for i = 1, #Config.armories do
        if Config.armories[i].useBlips == true then
            local blip = AddBlipForCoord(Config.armories[i].x, Config.armories[i].y, Config.armories[i].z)
            SetBlipSprite(blip, 175)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Armory")
            EndTextCommandSetBlipName(blip)
        end
    end
end

InitializeBlips()

local witinArmoryRadius = false
local armoryOpen = false
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed)
        for i = 1, #Config.armories do
            local distance = playerDistancetoArmory(playerCoords, Config.armories[i])
            if distance <= Config.armories[i].radius then
                witinArmoryRadius = true
                if IsControlJustPressed(1, 51) then
                    if exports["FunNoober_Duty"]:DutyStatus() then
                        armoryOpen = not armoryOpen
                        if armoryOpen == true then
                            openArmory()
                        else
                            closeArmory()
                        end
                    else
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("~c~You must be ~o~on duty~c~ to use the armory")
                        DrawNotification(true, true)
                    end
                end
            else
                witinArmoryRadius = false
            end
            if witinArmoryRadius == true then
                BeginTextCommandDisplayHelp("THREESTRINGS")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to open armory")
            end
            EndTextCommandDisplayHelp(0, false, true, 0)
            if distance <= 55 then
                DrawMarker(1, Config.armories[i].x, Config.armories[i].y, Config.armories[i].z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 255, 10, false, true, 2, nil, nil, false)
                exports["FunNoober_Misc"]:Draw3dText("~o~[E] ~w~Armory", {x = Config.armories[i].x, y = Config.armories[i].y, z = Config.armories[i].z})
            end
        end
    end
end)

function playerDistancetoArmory(playerCoords, armory)
    return GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, armory.x, armory.y, armory.z, true)
end

function openArmory()
    SendNUIMessage({
        type = "open"
    })
    SetNuiFocus(true, true)
end

function closeArmory()
    SendNUIMessage({
        type = "close"
    })
    SetNuiFocus(false, false)
end

RegisterNUICallback("close", function ()
    armoryOpen = false
    SendNUIMessage({
        type = "close"
    })
    SetNuiFocus(false, false)
end)

RegisterNUICallback('giveweapon', function (data, cb)
    if HasPedGotWeapon(PlayerPedId(), GetHashKey(data.weaponHash), false) then
        RemoveWeaponFromPed(PlayerPedId(), GetHashKey(data.weaponHash))
        exports["FunNoober_Misc"]:Notify("~c~Weapon removed", "CHAR_CALL911", "Armory", "~c~Weapons")
        return
    end

    GiveWeaponToPed(GetPlayerPed(-1), data.weaponHash, 9999, false, false)
    exports['FunNoober_Misc']:Notify("~c~Weapon acquired", "CHAR_CALL911", "Armory", "~c~Weapons")
end)

RegisterNUICallback('giveattachement', function (data, cb)
    if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey(data.weaponHash), GetHashKey(data.weaponAttachement)) then
        RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(data.weaponHash), GetHashKey(data.weaponAttachement))
        exports["FunNoober_Misc"]:Notify("~c~Attachement removed", "CHAR_CALL911", "Armory", "~c~Attachements")
        return
    end
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(data.weaponHash), GetHashKey(data.weaponAttachement))
    AddAmmoToPed(-1, data.weaponHash, 9999)
    exports["FunNoober_Misc"]:Notify("~c~Attachement equiped", "CHAR_CALL911", "Armory", "~c~Attachements")
end)