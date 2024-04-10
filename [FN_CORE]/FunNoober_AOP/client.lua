local text = "Whole Map"

RegisterNetEvent("aop:updateText")
AddEventHandler("aop:updateText", function (args)
    text = ""
    for i = 1, #args do
        text = text .. ' ' ..args[i]
    end
    exports['FunNoober_Misc']:NUINotify(text, 'info')
    print(text)
end)

RegisterNetEvent("aop:noPerms")
AddEventHandler("aop:noPerms", function ()
    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"AOP", "NOT ENOUGH PERMS"}
    })
end)

RegisterNetEvent("aop:notEnoughArgs")
AddEventHandler("aop:notEnoughArgs", function ()
    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        multiline = true,
        args = {"AOP", "NOT ENOUGH ARGS"}
    })
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
            AddTextComponentString("~c~AOP: " .. "~o~" .. text)
            DrawText(Config.textLocationX, Config.textLocationY)
        end
    end
end)
