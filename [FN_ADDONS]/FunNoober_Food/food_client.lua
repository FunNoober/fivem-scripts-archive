local withinFoodPoint = false
local timeSinceLastAte = 0
local isHungry = false
local canEat = true

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1)
        local playerPed = GetPlayerPed(PlayerId())
        local playerLoc = GetEntityCoords(playerPed)
        for i = 1, #Config.FoodPoints do
            local playerDist = PlayerDistanceToMarker(playerLoc, Config.FoodPoints[i])
            if playerDist <= 15 then
                DrawMarker(1, Config.FoodPoints[i].x, Config.FoodPoints[i].y, Config.FoodPoints[i].z - 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 1.0, 255, 255, 255, 10, false, true, 2, nil, nil, false)
            end
            exports["FunNoober_Misc"]:Draw3dText("~o~[E] ~w~Food ($3.5)", {x = Config.FoodPoints[i].x, y = Config.FoodPoints[i].y, z = Config.FoodPoints[i].z})
            if playerDist <= 0.5 then
                withinFoodPoint = true
                if IsControlJustPressed(1, 51) and canEat == true then
                    ConsumeFood(Config.FoodPoints[i])
                end
            else
                withinFoodPoint = false
            end
            if withinFoodPoint == true and canEat == true then
                BeginTextCommandDisplayHelp("THREESTRINGS")
                AddTextComponentSubstringPlayerName("Press ~INPUT_CONTEXT~ to grab food from " .. Config.FoodPoints[i].title)
            end
            EndTextCommandDisplayHelp(0, false, true, 0)
        end
        if timeSinceLastAte >= Config.fullFromFoodTime then
            isHungry = true
        else
            isHungry = false
        end
        if IsEntityDead(GetPlayerPed(PlayerId())) then
            isHungry = false
            timeSinceLastAte = 0
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        timeSinceLastAte = timeSinceLastAte + 1
    end
end)

Citizen.CreateThread(function ()
    while true do
        if isHungry then
            SetEntityHealth(PlayerPedId(), GetEntityHealth(GetPlayerPed(PlayerId())) - 10)
            exports["FunNoober_Misc"]:Notify("~r~You are hungry. Find food.", "CHAR_BLANK_ENTRY", "Vitals", "~c~Hungry")
        end
        Citizen.Wait(1000 * 30)
    end
end)

function PlayerDistanceToMarker(playerCoords, Marker)
    return GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, Marker.x, Marker.y,
        Marker.z,
        true)
end



function ConsumeFood(foodPoint)
    if exports["FN_CORE"]:HasMoneyForProduct(3.5) then
        exports["FN_CORE"]:TakeMoney(3.5)
        exports["FunNoober_Misc"]:Notify("~c~You ate from ~o~" .. foodPoint.title, "CHAR_BLANK_ENTRY", "Vitals", "~c~" .. foodPoint.title)
        isHungry = false
        timeSinceLastAte = 0
        SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
        local emoteToChoose = math.random(1, 3)
        SetEntityHealth(PlayerPedId(), GetEntityHealth(GetPlayerPed(PlayerId())) + 15)
        if foodPoint.emote ~= nil then
            exports["rpemotes"]:EmoteCommandStart(foodPoint.emote, 0)
        else
            if emoteToChoose == 1 then
                exports["rpemotes"]:EmoteCommandStart("donut", 0)
            end
            if emoteToChoose == 2 then
                exports["rpemotes"]:EmoteCommandStart("hotdog", 0)
            end
            if emoteToChoose == 3 then
                exports["rpemotes"]:EmoteCommandStart("sandwich", 0)
            end
        end
        canEat = false
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(3000)
        SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
        exports["rpemotes"]:EmoteCancel(true)
        canEat = true
        FreezeEntityPosition(PlayerPedId(), false)
        return
    end
end

for i = 1, #Config.FoodPoints do
    if Config.FoodPoints[i].blip then
        local blip = AddBlipForCoord(Config.FoodPoints[i].x, Config.FoodPoints[i].y, Config.FoodPoints[i].z)
        SetBlipSprite(blip, Config.FoodPoints[i].blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.FoodPoints[i].title)
        EndTextCommandSetBlipName(blip)
    end
end