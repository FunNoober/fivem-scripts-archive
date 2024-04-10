local textContents = "RP policies are in effect"

TriggerEvent("chat:addSuggestion", "/rpstatus", "Change the RP Status", {})

RegisterNetEvent("funnoober:rpstatus")
AddEventHandler("funnoober:rpstatus", function (args)
    textContents = args
    if Config.useNotifications == true then
        exports['FunNoober_Misc']:NUINotify(textContents, 'info')
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if not IsHudHidden() then
            SetTextFont(Config.textFont)
            SetTextDropshadow(1, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextScale(Config.textScaleX, Config.textScaleY)
            SetTextEntry("STRING")
            AddTextComponentString("~c~RP Status: " .. "~o~" .. textContents)
            DrawText(Config.textLocationX, Config.textLocationY)
        end
    end
end)