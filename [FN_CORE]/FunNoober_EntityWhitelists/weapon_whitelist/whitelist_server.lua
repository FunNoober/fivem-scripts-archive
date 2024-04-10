local WeaponList = {
    {
        acePerm = "weapons.blacklisted",
        weapons = {
            "weapon_rayminigun",
            "weapon_raypistol",
            "weapon_raycarbine",
            "weapon_raypistol",
            "weapon_emplauncher",
            "weapon_minigun",
            "weapon_railgun",
            "weapon_railgunxm3"
        }
    },
    {
        acePerm = "weapons.owner",
        weapons = {
            "WEAPON_BFG9000"
        }
    },
    {
        acePerm = "weapons.coOwner",
        weapons = {
        }
    },
    {
        acePerm = "weapons.masterAdmin",
        weapons = {
        }
    },
    {
        acePerm = "weapons.heavy",
        weapons = {
        }
    },
    {
        acePerm = "weapons.explosives",
        weapons = {
        }
    }
}

RegisterNetEvent("fn_whitelist:checkWeapon")
AddEventHandler("fn_whitelist:checkWeapon", function (currentlySelectedWeapon, playerId)
    for i = 1, #WeaponList do
        for x = 1, #WeaponList[i].weapons do
            local hasAccessToCategory = IsPlayerAceAllowed(playerId, WeaponList[i].acePerm)
            if currentlySelectedWeapon == GetHashKey(WeaponList[i].weapons[x]) and hasAccessToCategory == false then
                TriggerClientEvent("fn_whitelist:weaponBlacklisted", playerId, currentlySelectedWeapon)
            end
        end
    end
end)