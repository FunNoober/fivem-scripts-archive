RegisterNetEvent("sendAnonMessage")
AddEventHandler("sendAnonMessage", function (args)
    local message = ""
    for i = 1, #args do
        message = message .. ' ' ..args[i]
    end
    TriggerClientEvent("recieveAnonMessage", -1, message)
end)