Config = {}

Config.weapons = {
    {
        hash = "WEAPON_NIGHTSTICK",
        damage = 0.1
    },
    {
        hash = "WEAPON_FLASHLIGHT",
        damage = 0.1
    },
    {
        hash = "WEAPON_PISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_PISTOL_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_COMBATPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_APPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_STUNGUN",
        damage = 0.0
    },
    {
        hash = "WEAPON_PISTOL50",
        damage = 3.0
    },
    {
        hash = "WEAPON_SNSPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_SNSPISTOL_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_HEAVYPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_REVOLVER",
        damage = 3.0
    },
    {
        hash = "WEAPON_REVOLVER_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_MICROSMG",
        damage = 3.0
    },
    {
        hash = "WEAPON_SMG",
        damage = 3.0
    },
    {
        hash = "WEAPON_SMG_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_ASSAULTSMG",
        damage = 3.0
    },
    {
        hash = "WEAPON_COMBATPDW",
        damage = 3.0
    },
    {
        hash = "WEAPON_MACHINEPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_MINISMG",
        damage = 3.0
    },
    {
        hash = "WEAPON_TECPISTOL",
        damage = 3.0
    },
    {
        hash = "WEAPON_PUMPSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_PUMPSHOTGUN_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_SANOFFSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_ASSAULTSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_BULLPUPSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_MUSKET",
        damage = 0.25
    },
    {
        hash = "WEAPON_HEAVYSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_DBSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_AUTOSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_COMBATSHOTGUN",
        damage = 3.0
    },
    {
        hash = "WEAPON_ASSAULTRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_ASSAULTRIFLE_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_CARBINERIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_CARBINERIFLE_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_ADVANDEDRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_SPECIALCARBINE",
        damage = 3.0
    },
    {
        hash = "WEAPON_SPECIALCARBINE_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_BULLPUPRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_BULLPUPRIFLE_MK2",
        damage = 3.0
    },
    {
        hash = "WEAPON_COMPACTRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_MILITARYRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_HEAVYRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_TACTICALRIFLE",
        damage = 3.0
    },
    {
        hash = "WEAPON_BZGAS",
        damage = 0.0
    }
}

Citizen.CreateThread(function ()
    while true do
        for i = 1, #Config.weapons do
            local weaponHash = GetHashKey(Config.weapons[i].hash)
            SetWeaponDamageModifier(weaponHash, Config.weapons[i].damage)
        end
        Citizen.Wait(5000)
    end
end)