RegisterCommand("pas", function (source, args)
    if #args < 1 then
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"PAS", "Type a message for the public alert system"}
        })
        return
    end
    if IsPlayerAceAllowed(source, "pas.alert") then
        pas(args)
    else
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"PAS", "You are not a government official"}
        })
    end
end, false)

function pas(args)
    local message = ""
    for i = 1, #args do
        message = message .. ' ' .. args[i]
    end
    TriggerClientEvent("pas:alert", -1, message)
end