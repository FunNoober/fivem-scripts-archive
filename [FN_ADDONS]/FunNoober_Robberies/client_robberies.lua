local playerWithinRobberRadius = false
local currentlyDuringRobbery = false
local timeLeftOnCooldown = 0
local onCooldown = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(playerPed)
        for i = 1, #Config.RobberyLocations do
            local playerDist = PlayerDistanceToMarker(playerLoc, Config.RobberyLocations[i])
            if playerDist <= 0.5 then
                playerWithinRobberRadius = true
                if IsControlJustPressed(1, 51) and currentlyDuringRobbery == false and onCooldown == false then
                    StartRobbery(Config.RobberyLocations[i].subTitle, Config.RobberyLocations[i].description, Config.RobberyLocations[i].moneyToAdd, Config.RobberyLocations[i].title)
                end
            else
                playerWithinRobberRadius = false
            end
            DrawMarker(29, Config.RobberyLocations[i].x, Config.RobberyLocations[i].y, Config.RobberyLocations[i].z + 0.5,
                0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 1.0, 1.0, 2.0, 112, 25, 25, 50, false, true, 2, nil, nil, false)
            if playerWithinRobberRadius == true and currentlyDuringRobbery == false and onCooldown == false then
                BeginTextCommandDisplayHelp("THREESTRINGS")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to start robbery")
            end
            EndTextCommandDisplayHelp(0, false, true, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if onCooldown == true then
            if timeLeftOnCooldown > 0 then
                timeLeftOnCooldown = timeLeftOnCooldown - 1
            end
            if timeLeftOnCooldown <= 0 then
                onCooldown = false
            end
        end
    end
end)

function StartRobbery(title, subtitle, moneyToAdd, robberyLocation)
    currentlyDuringRobbery = true
    local timeLeftOnRobbery = 10
    notifyDispatch(robberyLocation)
    Citizen.CreateThread(function()
        local scaleform = InitializeScaleform(title, subtitle)
        while true do
            if currentlyDuringRobbery == true then
                -- DisableAllControlActions(2)
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
                FreezeEntityPosition(PlayerPedId(), true)
            else
                FreezeEntityPosition(PlayerPedId(), false)
                break
            end
            Citizen.Wait(1)
        end
    end)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if currentlyDuringRobbery == true then
                if timeLeftOnRobbery > 0 then
                    timeLeftOnRobbery = timeLeftOnRobbery - 1
                end
                if timeLeftOnRobbery <= 0 then
                    exports['FN_CORE']:AddMoney(moneyToAdd, 'Robbery')
                    onCooldown = true
                    timeLeftOnCooldown = Config.CooldownTime
                    currentlyDuringRobbery = false
                    PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", true)
                    return
                end
            end
        end
    end)
end

function notifyDispatch(robberyLocation)
    local playerPed = GetPlayerPed(PlayerId())
    local playerPedPos = GetEntityCoords(playerPed)
    local streetName = GetStreetNameAtCoord(playerPedPos.x, playerPedPos.y, playerPedPos.z)
    local streetNameFinal = GetStreetNameFromHashKey(streetName)
    TriggerServerEvent("fn_robberies:notifyDispatch", robberyLocation, streetNameFinal)
end

RegisterNetEvent("fn_robberies:notifyActiveLEO")
AddEventHandler("fn_robberies:notifyActiveLEO", function (robberyLocation, streetNameFinal)
    if exports['FunNoober_Duty']:DutyStatus() then
        TriggerEvent("chat:addMessage", "^*^4----------")
        TriggerEvent("chat:addMessage", "^*^4 ROBBERY IN PROGRESS:")
        TriggerEvent("chat:addMessage", "^*^4 ROBBERY LOCATION:^r^7" .. robberyLocation)
        TriggerEvent("chat:addMessage", "^*^4 STREET NAME:^r^7" .. streetNameFinal)
        TriggerEvent("chat:addMessage", "^*^4----------")
        exports['FunNoober_Misc']:Notify("~r~New silent alarm. View messages for more information.", "CHAR_CALL911", "Overwatch", "Police")
        TriggerEvent("fn_robberies:RobberyOccured", robberyLocation, streetNameFinal)
    end
end)

function InitializeScaleform(title, subtitle)
    scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString(title)
    PushScaleformMovieFunctionParameterString(subtitle)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

for i = 1, #Config.RobberyLocations do
    if Config.RobberyLocations[i].blip then
        local blip = AddBlipForCoord(Config.RobberyLocations[i].x, Config.RobberyLocations[i].y, Config.RobberyLocations[i].z)
        SetBlipSprite(blip, Config.RobberyLocations[i].blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.RobberyLocations[i].title)
        EndTextCommandSetBlipName(blip)
    end
end

function PlayerDistanceToMarker(playerCoords, FleecaStore)
    return GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, FleecaStore.x, FleecaStore.y,
        FleecaStore.z,
        true)
end
