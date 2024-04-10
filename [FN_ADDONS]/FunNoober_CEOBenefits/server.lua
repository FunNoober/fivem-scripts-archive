RegisterNetEvent("ceoBenefits:RequestPerms")
AddEventHandler("ceoBenefits:RequestPerms", function (playerId)
    if IsPlayerAceAllowed(playerId, "ceo_benefits") then
        TriggerClientEvent("ceoBenefits:AllowBenefits", playerId)
    end
end)