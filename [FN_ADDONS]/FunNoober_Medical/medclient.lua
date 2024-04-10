local isBleedingOut = false
local medkitCooldown = 0

RegisterCommand("medkit", function ()
    medkit()
end, false)

RegisterCommand("medical:stopbleeding", function ()
    if isBleedingOut == false then
        return
    end
    medkit()
end, false)

function medkit()
    local proportionalHeath = GetMaxHealth() - 100
    local healthToSet = math.floor(proportionalHeath / 2) + 1
    local currentHealth = math.floor(GetEntityHealth(PlayerPedId())) - 100
    if currentHealth > healthToSet then
        exports["FunNoober_Misc"]:Notify("~r~You are not badly injured enough to use the medkit", "CHAR_CALL911", "Overwatch", "Medical")
        return
    end
    if medkitCooldown <= 0 then
        RequestAnimDict("missmic4")
        TaskPlayAnim(GetPlayerPed(-1), "missmic4", "michael_tux_fidget", 3.0, 3.0, 1500, 51, 0, false, false, false)
        Citizen.Wait(1500)
        isBleedingOut = false
        SetEntityHealth(PlayerPedId(), healthToSet + 100)
        medkitCooldown = 1
        exports["FunNoober_Misc"]:Notify("~o~Medkit used successfully", "CHAR_CALL911", "Overwatch", "Medical")
    else
        exports["FunNoober_Misc"]:Notify("~r~Medkit is on cooldown", "CHAR_CALL911", "Overwatch", "Medical")
    end
end

RegisterKeyMapping("medical:stopbleeding", 'Stop Bleeding', 'keyboard', 'f')

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        if medkitCooldown > 0 then
            medkitCooldown = medkitCooldown - 1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local health = math.floor(GetEntityHealth(PlayerPedId())) - 100
        local maxHealth = math.floor(GetEntityMaxHealth(PlayerPedId())) - 100
        if health < maxHealth / 2 then
            isBleedingOut = true
            SetExtraTimecycleModifier("TrevorColorCode")
            BeginTextCommandDisplayHelp("THREESTRINGS")
            AddTextComponentSubstringPlayerName("Press ~INPUT_ARREST~ to stop bleeding")
            EndTextCommandDisplayHelp(0, false, true, 0)
        elseif health >= maxHealth / 2 then
            isBleedingOut = false
            ClearExtraTimecycleModifier()
        end
        if IsEntityDead(PlayerPedId()) then
            isBleedingOut = false
            ClearExtraTimecycleModifier()
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        if isBleedingOut then
            exports["FunNoober_Misc"]:Notify("~r~You are bleeding out.", "CHAR_BLANK_ENTRY", "Vitals", "~c~Bleeding")
            SetTimecycleModifierStrength(1.2)
            SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 2)
        end
    end
end)

function GetMaxHealth()
    return math.floor(GetEntityMaxHealth(PlayerPedId()))
end