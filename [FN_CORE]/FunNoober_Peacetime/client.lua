local peaceTime = ""

RegisterNetEvent("updateTextAOP")
AddEventHandler("updateTextAOP", function (args)
    peaceTime = args
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        SetTextFont(Config.textFont)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextScale(Config.textScaleX, Config.textScaleY)
        SetTextEntry("STRING")
        local text = Config.peaceTimeDisabledText
        if peaceTime == true then
            text = Config.peaceTimeEnabledText
            if Config.takeWeapons then
                SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED", true)
            end
            if Config.disableAttackControl then
                DisableControlAction(0, 24, true)
            end
            if Config.removeWeapons then
                RemoveAllPedWeapons(GetPlayerPed(-1), true)
            end
            if GetEntityHealth(GetPlayerPed(-1)) <= 0 then
                local player = GetPlayerPed(-1)
                SetEntityHealth(player, 200)
                ClearPedBloodDamage(player)
                NetworkResurrectLocalPlayer(GetEntityCoords(player, true), true, true, false)
            end
            if Config.playerInvincible then
                local player = GetPlayerPed(-1)
                SetEntityHealth(player, 200)
                ClearPedBloodDamage(player)
            end
        end

        if peaceTime == false then
            text = Config.peaceTimeDisabledText
        end
        if not IsHudHidden() then
            AddTextComponentString(Config.peaceTimePrefix .. Config.peaceTimeStatusColor ..  tostring(text))
            DrawText(Config.textLocationX, Config.textLocationY)
        end
    end
end)