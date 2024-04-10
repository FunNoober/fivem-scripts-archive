RegisterCommand("notepad", function ()
    SendNUIMessage({
        type = 'open'
    })
    SetNuiFocus(true, true)
end, false)

TriggerEvent("chat:addSuggestion", "/notepad", "Open the notepad", {})

RegisterNUICallback('closeNotepad', function (data, cb)
    SetNuiFocus(false, false)
    return
end)