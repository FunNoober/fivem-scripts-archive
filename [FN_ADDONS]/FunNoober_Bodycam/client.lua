local bodycamActive = false
local videoNumber = math.random(10000000,99999999)

RegisterCommand("bodycam", function ()
    RequestAnimDict("missmic4")
    TaskPlayAnim(GetPlayerPed(-1), "missmic4", "michael_tux_fidget", 3.0, 3.0, 1500, 51, 0, false, false, false)
    Citizen.Wait(1500)
    if bodycamActive then
        DisableCam()
        return
    else
        EnableCam()
        return
    end
end, false)

TriggerEvent("chat:addSuggestion", "/bodycam", "Enable or disable the bodycam overlay", {})
RegisterKeyMapping('bodycam', 'Bodycam', 'keyboard', 'o')

Citizen.CreateThread(function ()
    while true do
        if bodycamActive then
            SetFollowPedCamViewMode(4)
        end
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function ()
    while true do
        if bodycamActive then
            Updatebodycam()
            if IsControlJustPressed(0, 157) then
                if HasWeapon("WEAPON_COMBATPISTOL") then
                    if IsArmed() then
                        SetWeapon("WEAPON_UNARMED")
                    else
                        SetWeapon("WEAPON_COMBATPISTOL")
                    end
                end
            elseif IsControlJustPressed(0, 158) then
                if HasWeapon("WEAPON_STUNGUN") then
                    if IsArmed() then
                        SetWeapon("WEAPON_UNARMED")
                    else
                        SetWeapon("WEAPON_STUNGUN")
                    end
                end
            elseif IsControlJustPressed(0, 160) then
                if HasWeapon("WEAPON_CARBINERIFLE") then
                    if IsArmed() then
                        SetWeapon("WEAPON_UNARMED")
                    else
                        SetWeapon("WEAPON_CARBINERIFLE")
                    end
                end
            end
        end
        Citizen.Wait(1)
    end
end)

function EnableCam()
    SetTimecycleModifier("scanline_cam_cheap")
    SetTimecycleModifierStrength(1.5)
    SendNUIMessage({
        type = "enablebody"
    })
    bodycamActive = true
    DisplayHud(false)
end

function DisableCam()
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFollowPedCamViewMode(0)
    SendNUIMessage({
        type = "disablebody"
    })
    bodycamActive = false
    DisplayHud(true)
end

function Updatebodycam()
    local gameTime = GetGameTimer()
    local year, month, day, hour, minute, second = GetLocalTime()
    
    SendNUIMessage({
        type = "updatebody",
        info = {
            gameTime = gameTime,
            clockTime = {year = year, month = month, day = day, hour = hour, minute = minute, second = second},
            videoNumber = videoNumber
        }
    })
end

function HasWeapon(weaponHash)
    return HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false)
end

function IsArmed()
    return IsPedArmed(PlayerPedId(), 4 | 2)
end

function SetWeapon(weaponHash)
    SetCurrentPedWeapon(PlayerPedId(), weaponHash, true)
end