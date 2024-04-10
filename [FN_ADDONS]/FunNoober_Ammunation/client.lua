if Config.useBlips == true then
    for i = 1, #Config.gunStores do
        local blip = AddBlipForCoord(Config.gunStores[i].x, Config.gunStores[i].y, Config.gunStores[i].z)
        SetBlipSprite(blip, Config.gunStores[i].blip)
    end
end

local withinGunStoreRadius = false
local gunStoreOpen = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed)
        for i = 1, #Config.gunStores do
            local distance = playerDistancetoGunStore(playerCoords, Config.gunStores[i])
            if distance <= Config.gunStoreRadius then
                withinGunStoreRadius = true
                if IsControlJustPressed(1, 51) then
                    gunStoreOpen = not gunStoreOpen
                    if gunStoreOpen == true then
                        openStore()
                    else
                        closeStore()
                    end
                end
            else
                withinGunStoreRadius = false
            end
            if withinGunStoreRadius == true then
                BeginTextCommandDisplayHelp("THREESTRINGS")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to open gun store")
            end
            EndTextCommandDisplayHelp(0, false, true, 0)
            if distance <= 55 then
                DrawMarker(1, Config.gunStores[i].x, Config.gunStores[i].y, Config.gunStores[i].z - 1.1, 0.0, 0.0, 0.0, 0.0,
                    0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 255, 10, false, true, 2, nil, nil, false)
                exports["FunNoober_Misc"]:Draw3dText("~o~[E] ~w~Ammunation", {x = Config.gunStores[i].x, y = Config.gunStores[i].y, z = Config.gunStores[i].z})
            end
        end
    end
end)

function playerDistancetoGunStore(playerCoords, gunStore)
    return GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, gunStore.x, gunStore.y, gunStore.z,
        true)
end

function openStore()
    SendNUIMessage({
        type = "open"
    })
    SetNuiFocus(true, true)
end

function closeStore()
    SendNUIMessage({
        type = "close"
    })
    SetNuiFocus(false, false)
end

RegisterNUICallback("closeammunation", function(_, cb)
    gunStoreOpen = false
    SendNUIMessage({
        type = "close"
    })
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback("giveweaponammunation", function(data, cb)
    local weaponHash = data.weapon
    local weaponCost = data.weaponCost
    local playerPed = GetPlayerPed(-1)
    local hasWeapon = HasPedGotWeapon(playerPed, weaponHash, false)
    if IsWeaponValid(weaponHash) then
        if hasWeapon == false then
            if exports["FN_CORE"]:HasMoneyForProduct(weaponCost) then
                GiveWeaponToPed(playerPed, weaponHash, GetWeaponClipSize(weaponHash) * 6, false, false)
                exports["FunNoober_Misc"]:Notify("~c~Weapon purchased", "CHAR_AMMUNATION", "Ammunation", "")
                exports["FN_CORE"]:TakeMoney(weaponCost)
            end
        else
            if weaponHash == "WEAPON_STUNGUN" then
               exports["FunNoober_Misc"]:Notify("~c~You can not buy ammo for the taser", "CHAR_AMMUNATION", "Ammunation", "") 
            elseif exports["FN_CORE"]:HasMoneyForProduct(weaponCost * 1/4) then
                AddAmmoToPed(playerPed, weaponHash, GetWeaponClipSize(weaponHash) * 2)
                exports["FunNoober_Misc"]:Notify("~c~Ammo purchased", "CHAR_AMMUNATION", "Ammunation", "")
                exports["FN_CORE"]:TakeMoney(weaponCost * 1/4)
                PlaySoundFrontend(-1, "WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", true)
            end
        end
    else
        exports["FunNoober_Misc"]:Notify("~r~Weapon is sold out", "CHAR_AMMUNATION", "Ammunation", "")
    end
    cb('ok')
end)
