RegisterCommand("ungrateify", function (source, args)
    if IsPlayerAceAllowed(source, "funnoober.lua_error") then
        if #args > 0 then
            TriggerClientEvent("fun_noober:ungrate", args[1])
        end
    end
end, false)