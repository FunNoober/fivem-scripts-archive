Citizen.CreateThread(function ()
    for i, blip in ipairs(Config.blips) do
        localBlip = AddBlipForCoord(Config.blips[i].x, Config.blips[i].y, Config.blips[i].z)
        SetBlipSprite(localBlip, Config.blips[i].id)
        SetBlipDisplay(localBlip, 4)
        SetBlipScale(localBlip, 1.0)
        SetBlipColour(localBlip, Config.blips[i].Color)
        SetBlipAsShortRange(localBlip, Config.blips[i].ShortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.blips[i].Title)
        EndTextCommandSetBlipName(localBlip)
    end
end)



function noFlyZone()
    local blip = AddBlipForRadius(-149.84, -985.63, 29.31, 100)
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 3)
	SetBlipAlpha (blip, 128)
end

noFlyZone()