local radar = {
    show = false,
    locked = false,
    fvspeed = 0.0,
    fplate = "NO PLATE",
    hiddenByUser = false
}

local last911CallTime = 0

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(50)
        if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
            if GetVehicleClass(GetVehiclePedIsIn(PlayerPedId(), false)) == 18 then
                radar.show = true
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)
                local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)
                local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)
                local a, b, c, d, e = GetShapeTestResult(frontcar)

                if IsEntityAVehicle(e) and radar.locked == false then
                    radar.fvspeed = math.ceil(GetEntitySpeed(e)*2.236936)
                    radar.fplate = GetVehicleNumberPlateText(e)
                end
            else
                radar.show = false
            end
        else
            radar.show = false
        end

        if radar.show == true then
            if radar.hiddenByUser == false then
                SendNUIMessage({
                    type = "show",
                    speed = radar.fvspeed,
                    plate = radar.fplate,
                })
            end
        else
            SendNUIMessage({
                type = "hide"
            })
        end

        if radar.hiddenByUser then
            SendNUIMessage({type = "hide"})
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        if last911CallTime > 0 then
            last911CallTime = last911CallTime - 1
        end
        if last911CallTime <= 0 then
            SendNUIMessage({
                type = "EmergencyCall",
                callSource = "No new 911 calls",
                contents = "No new 911 calls",
                callLocation = "No new 911 calls"
            })
        end
    end
end)

AddEventHandler("funnoober:BroadcastEmergencyCall", function (source, callContents, location)
    SendNUIMessage({
        type = "EmergencyCall",
        callSource = source,
        contents = callContents,
        callLocation = location
    })
    if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
        if GetVehicleClass(GetVehiclePedIsIn(PlayerPedId(), false)) == 18 then
            PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
        end
    end
    last911CallTime = 120
end)

RegisterCommand("wavealpr:lock", function ()
    if radar.show == true then
        radar.locked = not radar.locked
        SendNUIMessage({
            type = "updatelockstatus",
            locked = radar.locked
        })
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
    end
end, false)

RegisterCommand("wavealpr:hide", function ()
    radar.hiddenByUser = not radar.hiddenByUser
end, false)

RegisterKeyMapping("wavealpr:lock", 'Toggle ALPR Lock', 'keyboard', 'u')