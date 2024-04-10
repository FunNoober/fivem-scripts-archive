RegisterNetEvent("yeet:kill")
AddEventHandler("yeet:kill", function ()
    SetEntityHealth(GetPlayerPed(-1), 0)
end)

RegisterNetEvent("yeet:heal")
AddEventHandler("yeet:heal", function ()
    SetEntityHealth(GetPlayerPed(-1), 200)
end)

RegisterNetEvent("disablecontrols")
AddEventHandler("disablecontrols", function ()
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(1)
            DisableAllControlActions(2)
        end
    end)
end)

RegisterNetEvent("enablecontrols")
AddEventHandler("enablecontrols", function ()
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(1)
            EnableAllControlActions(2)
        end
    end)
end)

RegisterNetEvent("deletev")
AddEventHandler("deletev", function ()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)
end)

RegisterNetEvent("crashgame")
AddEventHandler("crashgame", function ()
    Citizen.CreateThread(function ()
        while true do
            
        end
    end)
end)

RegisterNetEvent("explodev")
AddEventHandler("explodev", function ()
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    AddOwnedExplosion(playerPed, playerCoords.x, playerCoords.y, playerCoords.z, 4, 100, true, false, 5)
end)

RegisterNetEvent("yeet:givegun")
AddEventHandler("yeet:givegun", function (gunHash)
    local WeaponHash = GetHashKey(gunHash)
    local ammoToGive = GetMaxAmmoInClip(PlayerPedId(), WeaponHash, true)
    GiveWeaponToPed(PlayerPedId(), WeaponHash, ammoToGive * 10, false, true)
end)