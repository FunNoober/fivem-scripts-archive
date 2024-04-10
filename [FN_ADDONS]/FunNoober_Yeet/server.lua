RegisterCommand("yeet", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.yeet") then
        local playerid = tonumber(args[1])
        local ped = GetPlayerPed(playerid)
        SetEntityCoords(ped, Config.yeetLocation[1], Config.yeetLocation[2], Config.yeetLocation[3], 0, 0, 0, false)
    end
end, false)

RegisterCommand("kill", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.kill") then
        local playerid = tonumber(args[1])
        local ped = GetPlayerPed(playerid)
        TriggerClientEvent("yeet:kill", playerid)
    end
end, false)

RegisterCommand("disablecontrols", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.controls") then
        local playerid = tonumber(args[1])
        TriggerClientEvent("disablecontrols", playerid)
    end
end, false)

RegisterCommand("enablecontrols", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.controls") then
        local playerid = tonumber(args[1])
        TriggerClientEvent("enablecontrols", playerid)
    end
end, false)

RegisterCommand("deletev", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.deletev") then
        local playerid = tonumber(args[1])
        TriggerClientEvent("deletev", playerid)
    end
end, false)

RegisterCommand("crashgame", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.crash") then
        local playerid = tonumber(args[1])
        TriggerClientEvent("crashgame", playerid)
    end
end, false)

RegisterCommand("takew", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.takew") then
        local playerid = tonumber(args[1])
        local ped = GetPlayerPed(playerid)
        RemoveAllPedWeapons(ped, false)
    end
end, false)

RegisterCommand("explodev", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.explodev") then
        local playerid = tonumber(args[1])
        TriggerClientEvent("explodev", playerid)
    end
end, false)

RegisterCommand("heal", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.kill") then
        if #args > 0 then
            local playerid = tonumber(args[1])
            local ped = GetPlayerPed(playerid)
            TriggerClientEvent("yeet:heal", playerid)
        end
    end
end, false)

RegisterCommand("gun", function (source, args)
    if IsPlayerAceAllowed(source, "yeet.gun") then
        if #args > 0 then
            TriggerClientEvent("yeet:givegun", source, args[1])
        end
    end
end, false)