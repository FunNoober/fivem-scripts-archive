Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        TriggerServerEvent("ceoBenefits:RequestPerms", GetPlayerServerId(PlayerId()))
        break
    end
end)

RegisterNetEvent("ceoBenefits:AllowBenefits")
AddEventHandler("ceoBenefits:AllowBenefits", function ()
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(1000 * 300)
            exports["FN_CORE"]:AddMoney(150, "CEO")
        end
    end)
end)