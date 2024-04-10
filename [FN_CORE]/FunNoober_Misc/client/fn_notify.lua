exports("Notify", function (notifcationMessage, txdName, author, subHeading)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(notifcationMessage)
    EndTextCommandThefeedPostMessagetext(txdName, txdName, true, 0, author, subHeading)
    EndTextCommandThefeedPostTicker(false, false)
end)

exports("URRPNotify", function (notifcationMessage, author, subHeading)
    RequestStreamedTextureDict("CHAR_WSARP", false)
    exports["FunNoober_Misc"]:Notify(notifcationMessage, "CHAR_WSARP", author, subHeading)
    SetStreamedTextureDictAsNoLongerNeeded("CHAR_WSARP")
end)

exports("NUINotify", function (messageContents, typeOfNotif)
    SendNUIMessage({
        notifText = messageContents,
        notifType = typeOfNotif
    })
end)

exports("Draw3dText", function (textContents, position)
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(1)
            local playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()))
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, position.x, position.y, position.z, true)
            if distance < 10 then
                local onScreen, _x, _y = World3dToScreen2d(position.x, position.y, position.z)
                local scale = (1 / distance)
                if onScreen then
                    SetTextScale(0.0, scale)
                    SetTextFont(4)
                    SetTextDropshadow(1, 0, 0, 0, 255)
                    SetTextEdge(1, 0, 0, 0, 255)
                    SetTextProportional(true)
                    SetTextOutline()
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString(textContents)
                    DrawText(_x, _y)
                end
            end
            break
        end
    end)
end)