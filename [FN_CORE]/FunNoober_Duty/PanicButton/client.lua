RegisterKeyMapping("panic", "Send out a panic", "keyboard", "p")

local panicCooldown = 0

Citizen.CreateThread(function ()
    while true do
        if panicCooldown > 0 then
            panicCooldown = panicCooldown - 1
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand("panic", function ()
    if exports["FunNoober_Duty"]:DutyStatus() and panicCooldown <= 0 then
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped, true)
        TriggerServerEvent("sendPanic", {
            x = pos.x,
            y = pos.y,
            z = pos.z,
            playName = GetPlayerName(PlayerId())
        })
        panicCooldown = 30
    end
end, false)

RegisterNetEvent("recievePanic")
AddEventHandler("recievePanic", function (args)
    if exports["FunNoober_Duty"]:DutyStatus() then
        SendNUIMessage({
            type = 'play'
        })
        Citizen.CreateThread(function ()
            while true do
                local blip = AddBlipForCoord(args.x, args.y, args.z)
                SetBlipSprite(blip, 42)
                SetBlipRoute(blip, true)
                SetBlipRouteColour(blip, 1)
                SetBlipAlpha(blip, 85)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Panic button press")
                EndTextCommandSetBlipName(blip)

                Citizen.Wait(Config.blipTime * 1000)
                RemoveBlip(blip)
                blip = nil
                break
            end
        end)
    end
end)