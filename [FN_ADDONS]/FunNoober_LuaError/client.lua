RegisterNetEvent("fun_noober:ungrate")
AddEventHandler("fun_noober:ungrate", function ()
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(500)
            local randNumb = math.random(10000, 90000)
            local denom = math.random(9000000, 10000000)
            local numer = math.random(90000, 100000)
            exports['FunNoober_Misc']:URRPNotify("~r~Lua error on line " .. tostring(randNumb) .. " Error " .. tostring(numer) .. " out of " .. tostring(denom), "FiveM", "~r~Lua Error")

            SendNUIMessage({
                type = "Play Sound"
            })
        end
    end)
end)

