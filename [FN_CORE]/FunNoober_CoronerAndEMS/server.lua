RegisterCommand("coroner", function (source, args)
    if Config.useAcePerms then
        if IsPlayerAceAllowed(source, "dispatch.coroner") then
            if tonumber(args[1]) == source then
                coronerOnSelf(source)
            else
                if GetEntityHealth(GetPlayerPed(args[1])) > 1 then
                    coronerOnAlive(source)
                else
                    callCoroner(args)
                end
            end
        end
    else
        if tonumber(args[1]) == source then
            coronerOnSelf(source)
        else
            if GetEntityHealth(GetPlayerPed(args[1])) > 1 then
                coronerOnAlive(source)
            else
                callCoroner(args)
            end
        end
    end
end, false)

function callCoroner(args)
    local player = tonumber(args[1])
    local hospital = 0
    if args[2] ~= nil then
        hospital = tonumber(args[2])
    end
    TriggerClientEvent("coroner:reviveAtHospital", player, {hospitalNum = hospital})
end

function coronerOnSelf(source)
    TriggerClientEvent("chat:addMessage", source, {
        color = Config.coronerErrorColor,
        multiline = true,
        args = {Config.coronerName, "You can not call coroner on yourself"}
    })
end

function coronerOnAlive(source)
    TriggerClientEvent("chat:addMessage", source, {
        color = Config.coronerErrorColor,
        multiline = true,
        args = {Config.coronerName, "You can not call coroner on something that is alive"}
    })
end

RegisterCommand("ems", function (source, args)
    if Config.useAcePerms then
        if IsPlayerAceAllowed(source, "dispatch.ems") then
            if tonumber(args[1]) == source then
                emsOnSelf(source)
            else
                if GetEntityHealth(GetPlayerPed(args[1])) > 1 then
                    emsOnAlive(source)
                else
                    callEMS(args)
                end
            end
        end
    else
        if tonumber(args[1]) == source then
            emsOnSelf(source)
        else
            if GetEntityHealth(GetPlayerPed(args[1])) > 1 then
                emsOnAlive(source)
            else
                callEMS(args)
            end
        end
    end
end, false)

function emsOnSelf(source)
    TriggerClientEvent("chat:addMessage", source, {
        color = Config.emsErrorColor,
        multiline = true,
        args = {Config.emsName, "You can not call EMS on yourself"}
    })
end

function emsOnAlive(source)
    TriggerClientEvent("chat:addMessage", source, {
        color = Config.emsErrorColor,
        multiline = true,
        args = {Config.emsName, "You can not call EMS on something that is alive"}
    })
end

function callEMS(args)
    local player = tonumber(args[1])
    TriggerClientEvent("ems:respawnAtScene", player)
end