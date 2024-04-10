local NOOBER_FIVEM = "fivem:10421411"
local DISTANT_FIVEM = "fivem:8451866"
local AXE_FIVEM = "fivem:10832589"

local Perms = {
    {
        perm = "group.vehicleblacklistallow",
        members = {

        }
    },
    {
        perm = "staff.owner",
        members = {
            NOOBER_FIVEM, -- Noober
        }
    },
    {
        perm = "staff.coOwner",
        members = {
            NOOBER_FIVEM, -- Noober
            DISTANT_FIVEM, -- Distant Shadows
        }
    },
    {
        perm = "staff.headStaff",
        members = {
        }
    },
    {
        perm = "staff.communityDirector",
        members = {
            DISTANT_FIVEM -- Distant Shadows
        }
    },
    {
        perm = "staff.headAdmin",
        members = {

        }
    },
    {
        perm = "staff.masterAdmin",
        members = {
            NOOBER_FIVEM,
            DISTANT_FIVEM,
            AXE_FIVEM
        }
    },
    {
        perm = "staff.headModerator",
        members = {

        }
    },
    {
        perm = "staff.seniorAdmin",
        members = {

        }
    },
    {
        perm = "staff.adminI",
        members = {

        }
    },
    {
        perm = "staff.adminII",
        members = {
            AXE_FIVEM -- Axe Spray
        }
    },
    {
        perm = "staff.adminIII",
        members = {

        }
    },
    {
        perm = "staff.juniorAdmin",
        members = {

        }
    },
    {
        perm = "staff.cadetAdmin",
        members = {

        }
    },
    {
        perm = "staff.seniorModerator",
        members = {

        }
    },
    {
        perm = "staff.moderatorI",
        members = {

        }
    },
    {
        perm = "staff.moderatorII",
        members = {

        }
    },
    {
        perm = "staff.moderatorIII",
        members = {

        }
    },
    {
        perm = "staff.juniorModerator",
        members = {

        }
    },
    {
        perm = "staff.trialModerator",
        members = {

        }
    },
    {
        perm = "misc.governor",
        members = {

        }
    }
}

function OnPlayerConnectingManagePerms(name, setKickReason, deferrals)
    local player = source
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    Wait(0)

    for v = 1, #identifiers do
        if string.find(identifiers[v], "fivem") then
            local fivemIdent = identifiers[v]
            for i = 1, #Perms do
                for x = 1, #Perms[i].members do
                    if Perms[i].members[x] == fivemIdent then
                        ExecuteCommand("add_principal " .. "identifier." .. fivemIdent .. " " .. Perms[i].perm)
                        print("add_principal " .. "identifier." .. fivemIdent .. " " .. Perms[i].perm)
                    end
                end
            end
        end
    end

    deferrals.done()
end

AddEventHandler("playerConnecting", OnPlayerConnectingManagePerms)

AddEventHandler("playerDropped", function (reason)
    local player = source
    local identifiers = GetPlayerIdentifiers(player)

    for v = 1, #identifiers do
        if string.find(identifiers[v], "fivem") then
            local fivemIdent = identifiers[v]
            for i = 1, #Perms do
                for x = 1, #Perms[i].members do
                    if Perms[i].members[x] == fivemIdent then
                        ExecuteCommand("remove_principal " .. "identifier." .. fivemIdent .. " " .. Perms[i].perm)
                        print("remove_principal " .. "identifier." .. fivemIdent .. " " .. Perms[i].perm)
                    end
                end
            end
        end
    end
end)