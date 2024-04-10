RegisterNetEvent("fn_robberies:notifyDispatch")
AddEventHandler("fn_robberies:notifyDispatch", function (robberyLocation, streetNameFinal)
    TriggerClientEvent("fn_robberies:notifyActiveLEO", -1, robberyLocation, streetNameFinal)
end)