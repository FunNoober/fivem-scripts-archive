pedblacklist = {

}

defaultmodel = "a_m_y_skater_01"

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        playerPed = GetPlayerPed(-1)
        if playerPed then
            playerModel = GetEntityModel(playerPed)

            if not prevPlayerModel then
                if isPedBlacklisted(prevPlayerModel) then
                    SetPlayerModel(PlayerId(), GetHaskKey(defaultmodel))
                else
                    prevPlayerModel = playerModel
                end
            else
                if isPedBlacklisted(playerModel) then
                    SetPlayerModel(PlayerId(), prevPlayerModel)
                    notifyBlacklist("~r~This ped is blacklisted, you are not allowed to use it.")
                end

                prevPlayerModel = playerModel
            end
        end
    end
end)

function isPedBlacklisted(model)
    for _, blacklistedPed in pairs(pedblacklist) do
        if model == GetHashKey(blacklistedPed) then
            return true
        end
    end

    return false
end