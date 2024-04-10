TriggerEvent("chat:addSuggestion", "/pas", "Trigger a Public Alert Broadcast", {
    {name="contents", help="What to brodcast"}
})

RegisterNetEvent("pas:alert")
AddEventHandler("pas:alert", function (args)
    Citizen.CreateThread(function ()
        while true do
            SendNUIMessage({
                type = 'show',
                text = args,
            })
            exports["npwd"]:createSystemNotification({
                uniqId = "pasAlert",
                content = args,
                secondaryTitle = "Public Alert System",
                keepOpen = true,
                duration = 5000,
                controls = false
            })
            Citizen.Wait(Config.displayTime * 1000)
            SendNUIMessage({
                type = 'hide',
            })
            break
        end
    end)
end)