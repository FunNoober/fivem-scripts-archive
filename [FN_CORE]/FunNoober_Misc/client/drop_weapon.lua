Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        SetPedDropsWeaponsWhenDead(ped, true)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

RegisterCommand("dropweapon", function ()
    RequestAnimDict("mp_weapon_drop")
    local ped = PlayerPedId()
    local wep = GetSelectedPedWeapon(ped)
    if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) then
        TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0)
        SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        exports['FunNoober_Misc']:Notify('~r~Weapon dropped', "", "", "")
    end
end, false)

TriggerEvent("chat:addSuggestion", "/dropweapon", "Drops the currently held weapon", {})