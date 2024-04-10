local isTunedDarkWeb = false

TriggerEvent("chat:addSuggestion", "/" .. Config.darkWebTuneCommand, 'Tune into and out of the darkweb')
TriggerEvent("chat:addSuggestion", "/" .. Config.darkWebMessageCommand, 'Send a message on the darkweb')

RegisterCommand(Config.darkWebTuneCommand, function (source, args, rawCommand)
    if exports['FunNoober_Duty']:DutyStatus() == true then
        TriggerEvent("chat:addMessage", {
            color = Config.darkWebAssistantColor,
            multiline = true,
            args = {Config.darkWebName .. " ASSISTANT", "YOU CAN NOT BE ON DUTY AND USE THE DARK WEB"}
        })
        return
    end
    if isTunedDarkWeb == false then
        isTunedDarkWeb = true
        TriggerEvent("chat:addMessage", {
            color = Config.darkWebAssistantColor,
            multiline = true,
            args = {Config.darkWebName .. " ASSISTANT", Config.darkWebTuneMessage}
        })
        return
    end
    if isTunedDarkWeb == true then
        isTunedDarkWeb = false
        TriggerEvent("chat:addMessage", {
            color = Config.darkWebAssistantColor,
            multiline = true,
            args = {Config.darkWebName .. " ASSISTANT", Config.darkWebLeaveMessage}
        })
        return
    end
end, false)

RegisterCommand(Config.darkWebMessageCommand, function (source, args, rawCommand)
    if isTunedDarkWeb then
        if #args >= 1 then
            TriggerServerEvent("sendAnonMessage", args)
        else
            TriggerEvent("chat:addMessage", {
                color = Config.darkWebAssistantColor,
                multiline = true,
                args = {Config.darkWebName .. " ASSISTANT", "INVALID MESSAGE"}
            })
        end
    end
end, false)

RegisterNetEvent("recieveAnonMessage")
AddEventHandler("recieveAnonMessage", function (args)
    if isTunedDarkWeb then
        TriggerEvent("chat:addMessage", {
            color = Config.darkWebNameColor,
            multiline = true,
            args = {Config.darkWebName, args}
        })
    end
end)