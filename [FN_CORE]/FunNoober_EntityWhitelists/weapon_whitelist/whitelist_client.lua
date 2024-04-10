Citizen.CreateThread(function ()
    while true do
        local playerId = GetPlayerServerId(PlayerId())
        local playerPed = GetPlayerPed(-1)
        local currentWeapon = GetSelectedPedWeapon(playerPed)
        TriggerServerEvent("fn_whitelist:checkWeapon", currentWeapon, playerId)
        Citizen.Wait(500)
    end
end)

RegisterNetEvent("fn_whitelist:weaponBlacklisted")
AddEventHandler("fn_whitelist:weaponBlacklisted", function (currentWeapon)
    local playerPed = GetPlayerPed(-1)
    RemoveWeaponFromPed(playerPed, currentWeapon)
    exports['FunNoober_Misc']:URRPNotify("~c~You do ~r~not ~c~have access to this weapon", "Whitelist", "~c~Unreal Roleplay")
end)