RegisterNetEvent("backup:CoronerBroadcast")
AddEventHandler("backup:CoronerBroadcast", function (playerName)
    TriggerClientEvent("backup:CoronerBroadcastRecieve", -1, playerName)
end)

RegisterNetEvent("backup:TowBroadcast")
AddEventHandler("backup:TowBroadcast", function (playerName)
    TriggerClientEvent("backup:TowBroadcastRecieve", -1, playerName)
end)