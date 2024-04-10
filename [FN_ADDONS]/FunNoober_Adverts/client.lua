RegisterNetEvent("funnoober:sendAd")
AddEventHandler("funnoober:sendAd", function (adContents, authorColor, agencyName)
    TriggerEvent("chat:addMessage", {
        color = authorColor,
        multiline = true,
        args = {" [" .. agencyName .. "]", adContents}
    })
    exports['FunNoober_Misc']:Notify(adContents, "CHAR_BLANK_ENTRY", tostring(agencyName .. "        "), "~c~Advertisement")
end)

for i = 1, #Config.adAgencies do
    TriggerEvent("chat:addSuggestion", "/" .. Config.adAgencies[i].command, Config.adAgencies[i].suggestion, {
        { name="Ad Contents", help="What should the ad contain"}
    })
end