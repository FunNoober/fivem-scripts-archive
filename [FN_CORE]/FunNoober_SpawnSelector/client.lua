local selectedSpawn = false
local hasSpawned = false

local spawns = {
    {
        x = 211.0072,
        y = -925.1548,
        z = 30.0192223
    }, -- Legion Square
    {
        x = 1687.88,
        y = 3300.03,
        z = 41.15
    }, -- Sandy Airfied
    {
        x = 121.458755,
        y = 6642.826,
        z = 31.1245975
    }, -- Paleto Gas Station
    {
        x = 1683.55322,
        y = 4889.012,
        z = 41.3532181
    }, -- Grapeseed Main Street
    {
        x = -2097.64,
        y = 3423.47,
        z = 33.03
    }, -- Fort Zancudo
    {
        x = -1845.41821,
        y = -1195.9906,
        z = 19.6468868
    }, -- Vespucci Pier
    {
        x = 4516.62,
        y = -4548.15,
        z = 4.14
    }, -- Cayo Perico
    {
        x = -1037.83,
        y = -2737.51,
        z = 20.17
    } -- LSIA
}


Citizen.CreateThread(function ()
    while selectedSpawn == false do
        Citizen.Wait(1)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = 'aop_set',
            aop_value = GetConvar("unrealroleplay_aop", "Whole Map")
        })
    end
    while selectedSpawn == true do
        Citizen.Wait(1)
        SetNuiFocus(false, false)
        hasSpawned = true
        break
    end
end)

exports('HasSpawned', function ()
    return hasSpawned
end)

RegisterNUICallback('selectedspawn', function (data, cb)
    local spawnId = data.spawnId + 1
    spawnId = math.floor(spawnId)
    SetEntityCoords(PlayerPedId(), spawns[spawnId].x, spawns[spawnId].y, spawns[spawnId].z, false, false, false, true)
    selectedSpawn = true
end)