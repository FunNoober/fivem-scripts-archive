for i = 1, #Config.Commands do
    TriggerEvent("chat:addSuggestion", "/" .. Config.Commands[i].commandName, Config.Commands[i].commandDesc, {
        {name="Message", help="What do you want to say"}
    })
end