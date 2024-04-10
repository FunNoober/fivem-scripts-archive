RegisterNetEvent("coroner:reviveAtHospital")
AddEventHandler("coroner:reviveAtHospital", function (args)
    respawn(args)
end)

RegisterNetEvent("ems:respawnAtScene")
AddEventHandler("ems:respawnAtScene", function ()
    revive()
end)

TriggerEvent("chat:addSuggestion", "/coroner", "Call coroner on a player", {
    {name="Player ID", help="The ID of the player you want to send to the coroners office"},
    {name="Hospital", help="The hospital they respawn at. 1: Sandy, 2: Paleto, 3: Strawberry, 4: Mount Zonah"}
})

TriggerEvent("chat:addSuggestion", "/ems", "Call EMS on a player", {
    {name="Player ID", help="The ID of the player you want to revive"}
})

function respawn(args)
    local playerPed = GetPlayerPed(-1)
    math.random()
    local hospital = 1
    if args.hospitalNum ~= 0 then
        hospital = args.hospitalNum
    else
        hospital = math.random(1, #Config.hospitals)
    end
    local hX = Config.hospitals[hospital].x
    local hY = Config.hospitals[hospital].y
    local hZ = Config.hospitals[hospital].z
    SetEntityCoordsNoOffset(playerPed, hX, hY, hZ, 0, 0, 0)
    TriggerEvent("chat:addMessage", {
        color = Config.coronerColor,
        multiline = true,
        args = {Config.coronerName, Config.coronerMessage}
    })
    resetHealth(playerPed)
    TriggerEvent("triggerResetDeathTimers")
end

function revive()
    local playerPed = GetPlayerPed(-1)
    TriggerEvent("chat:addMessage", {
        color = Config.emsColor,
        multiline = true,
        args = {Config.emsName, Config.emsMessage}
    })
    resetHealth(playerPed)
    TriggerEvent("triggerResetDeathTimers")
end

function resetHealth(playerPed)
    NetworkResurrectLocalPlayer(GetEntityCoords(playerPed, true), true, true, false)
    ClearPedBloodDamage(playerPed)
    if IsPedMale(playerPed) then
        SetEntityHealth(playerPed, 200)
    else
        SetEntityHealth(playerPed, 100)
    end
end

if Config.hospitalBlips == true then
    for i = 1, #Config.hospitals do
        local blip = AddBlipForCoord(Config.hospitals[i].x, Config.hospitals[i].y, Config.hospitals[i].z)
        SetBlipSprite(blip, 61)
    end
end

if Config.healZones == true then
    Citizen.CreateThread(function ()
        while true do
            for i = 1, #Config.hospitals do
                local playerPed = GetPlayerPed(-1)
                local playerCoords = GetEntityCoords(playerPed)
                local hospital = Config.hospitals[i]
                if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, hospital.x, hospital.y, hospital.z, true) < hospital.radius then
                    if IsPedMale(playerPed) then
                        if GetEntityHealth(playerPed) <= 200 then
                            SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 1)
                        end
                    else
                        if GetEntityHealth(playerPed) <= 100 then
                            SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 1)
                        end
                    end
                end
            end
            Citizen.Wait(1)
        end
    end)
end