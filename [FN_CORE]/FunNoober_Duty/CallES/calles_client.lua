TriggerEvent("chat:addSuggestion", "/911", "Make a 911 call", {
    { name="Report", help="What do you need to report to 911"}
})

RegisterCommand("911", function (_, args)
    local playerName = GetPlayerName(PlayerId()) .. " (" .. GetPlayerServerId(PlayerId()) .. ")"
    local playerPed = GetPlayerPed(PlayerId())
    local playerPedPos = GetEntityCoords(playerPed)
    local streetName = GetStreetNameAtCoord(playerPedPos.x, playerPedPos.y, playerPedPos.z)
    local location = GetStreetNameFromHashKey(streetName)

    local callContents = ""
    for i = 1, #args do
        callContents = callContents .. " " .. args[i]
    end
    TriggerServerEvent("funnoober:911callserver", callContents, playerName, location)
end, false)

RegisterNetEvent("funnoober:911callbroadcast")
AddEventHandler("funnoober:911callbroadcast", function(callContents, source, location)
    if onDuty == true then
        TriggerEvent("chat:addMessage", "^*^4----------")
        TriggerEvent("chat:addMessage", "^*^4 NEW 911 REPORT:")
        TriggerEvent("chat:addMessage", "^*^4 CALLER INFORMATION:^r^7 " .. source)
        TriggerEvent("chat:addMessage", "^*^4 CALL INFORMATION:^r^7 " .. callContents)
        TriggerEvent("chat:addMessage", "^*^4 CALL TRIANGULATION:^r^7 " .. location)
        TriggerEvent("chat:addMessage", "^*^4----------")
        exports["FunNoober_Misc"]:Notify("~r~New 911 call. View messages for more information.", DutyConfig.DISPATCH_TXD, DutyConfig.DISPATCH_AUTHOR, DutyConfig.DISPATCH_SUBHEADING)
        TriggerEvent("fnDuty:newCall", location)
    end
    TriggerEvent("funnoober:BroadcastEmergencyCall", source, callContents, location)
end)