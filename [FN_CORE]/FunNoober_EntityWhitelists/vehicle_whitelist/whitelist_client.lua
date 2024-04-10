Citizen.CreateThread(function ()
    while true do
        local playerId = GetPlayerServerId(PlayerId())
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local currentlyInVehicle = GetEntityModel(GetVehiclePedIsIn(playerPed))
            TriggerServerEvent("fn_whitelist:checkVehicle", currentlyInVehicle, playerId)
        end
        Citizen.Wait(500)
    end
end)

RegisterNetEvent("fn_whitelist:vehicleBlacklisted")
AddEventHandler("fn_whitelist:vehicleBlacklisted", function (deleteVeh)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if deleteVeh == true then
        SetEntityAsMissionEntity(vehicle, false, false)
        DeleteVehicle(vehicle)
        ClearPedTasksImmediately(playerPed)
    else
        ClearPedTasksImmediately(playerPed)
    end
    exports['FunNoober_Misc']:URRPNotify("~c~You do ~r~not ~c~have access to this vehicle", "Whitelist", "~c~Unreal Roleplay")
end)