local blockedWeapons = {

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        playerPed = GetPlayerPed(-1)
        if playerPed then
            weapon = GetSelectedPedWeapon(playerPed)

            if isWeaponBlacklisted(weapon) then
                RemoveWeaponFromPed(playerPed, weapon)
                notifyBlacklist("~r~This weapon is blacklisted, you are not allowed to use it.")
            end
        end
    end
end)

function isWeaponBlacklisted(model)
    for _, blacklistedWeapon in pairs(blockedWeapons) do
        if model == GetHashKey(blacklistedWeapon) then
            return true
        end
    end

    return false
end
