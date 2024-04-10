RegisterNetEvent("notGovernmentOfficial")
AddEventHandler("notGovernmentOfficial", function ()
    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"THE GOVERNMENT", "YOU ARE NOT A GOVERNMENT OFFICIAL"}
    })
end)

RegisterNetEvent("purge")
AddEventHandler("purge", function ()
    SendNUIMessage({
        type = 'purge',
    })
end)