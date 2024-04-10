RegisterCommand("countycoroner", function ()
    CallCountyCoroner()
end, false)

RegisterCommand("cc", function ()
    CallCountyCoroner()
end, false)

TriggerEvent("chat:addSuggestion", "/countycoroner", "Show that you requested county coroner", {})
TriggerEvent("chat:addSuggestion", "/cc", "Show that you requested county coroner", {})

function CallCountyCoroner()
    if onDuty then
        local playerName = tostring(GetPlayerName(PlayerId()))
        TriggerServerEvent("backup:CoronerBroadcast", playerName)
    end
end

RegisterNetEvent("backup:CoronerBroadcastRecieve")
AddEventHandler("backup:CoronerBroadcastRecieve", function (playerName)
    if onDuty then
        TriggerEvent("chat:addMessage", {
            color = { 114, 204, 114},
            multiline = true,
            args = {'[County Coroner]', playerName ..  ' has called for county coroner'}
        })
    end
end)

RegisterCommand("countytow", function ()
    CallCountyTow()
end, false)

RegisterCommand("ct", function ()
    CallCountyTow()
end, false)

TriggerEvent("chat:addSuggestion", "/countytow", "Show that you requested county tow", {})
TriggerEvent("chat:addSuggestion", "/ct", "Show that you requested county tow", {})

function CallCountyTow()
    if onDuty then
        local playerName = tostring(GetPlayerName(PlayerId()))
        TriggerServerEvent("backup:TowBroadcast", playerName)
    end
end

RegisterNetEvent("backup:TowBroadcastRecieve")
AddEventHandler("backup:TowBroadcastRecieve", function (playerName)
    if onDuty then
        TriggerEvent("chat:addMessage", {
            color = {114, 204, 114},
            multiline = true,
            args = {'[County Tow]', playerName .. ' has called for county tow'}
        })
    end
end)