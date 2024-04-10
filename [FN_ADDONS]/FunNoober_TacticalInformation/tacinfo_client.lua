local last911CallTime = 0
local directions = {
    NORTH = 360, 0,
    NORTH_EAST = 315,
    EAST = 270,
    SOUTH_EAST = 225,
    SOUTH = 180,
    SOUTH_WEST = 135,
    WEST = 90,
    NORTH_WEST = 45
}

local isVisible = false

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        UpdateUI()
        return
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsControlPressed(1, 311) then
            SendNUIMessage({
                type = "show"
            })
            isVisible = true
        else
            SendNUIMessage({
                type = "hide"
            })
            isVisible = false
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(50)
        if isVisible then
            UpdateUI()
        end
    end
end)

Citizen.CreateThread(function ()
    while true do
        if last911CallTime > 0 then
            last911CallTime = last911CallTime - 1
        end
        Citizen.Wait(1000)
    end
end)

AddEventHandler("fnDuty:newCall", function (location)
    last911CallTime = 300
end)

function UpdateUI()
    local playerPed = GetPlayerPed(PlayerId())
    local playerPedCoords = GetEntityCoords(playerPed)
    local gameTimeGet = GetGameTimer()
    local minuteGet = GetClockMinutes()
    local hourGet = GetClockHours()
    local aop = string.upper(GetConvar("unrealroleplay_aop", "Whole Map"))
    local streetName = GetStreetNameAtCoord(playerPedCoords.x, playerPedCoords.y, playerPedCoords.z)
    local location = string.upper(GetStreetNameFromHashKey(streetName))
    local playerNameGet = string.upper(GetPlayerName(PlayerId()) .. " (" .. GetPlayerServerId(PlayerId()) .. ")")
    local new911CallText = "NO NEW 911 CALLS"
    local dutyString = "OFF DUTY"
    local compassDirection = tostring(GetCompassDirection())
    local postalGet = exports["nearest-postal"]:getPostal()

    if last911CallTime > 0 then
        new911CallText = "NEW 911 CALL"
    end
    if last911CallTime <= 0 then
        new911CallText = "NO NEW 911 CALLS"
    end

    if exports["FunNoober_Duty"]:DutyStatus() == true then
        dutyString = "ON DUTY"
    else
        dutyString = "OFF DUTY"
    end

    SendNUIMessage({
        type = "update",
        info = {
            x = string.format("%.2f", playerPedCoords.x),
            y = string.format("%.2f", playerPedCoords.y),
            z = string.format("%.2f",playerPedCoords.z),
            day = string.upper(DayOfWeek()),
            minute = minuteGet,
            hour = hourGet,
            aop = aop,
            location = location,
            playerName = playerNameGet,
            recent911Call = new911CallText,
            dutyStatus = dutyString,
            dir = compassDirection,
            postal = postalGet
        }
    })
end

function DayOfWeek()
    local intDayOfWeek = GetClockDayOfWeek()

    if intDayOfWeek == 0 then
        return "Sunday"
    end
    if intDayOfWeek == 1 then
        return "Monday"
    end
    if intDayOfWeek == 2 then
        return "Tuesday"
    end
    if intDayOfWeek == 3 then
        return "Wednesday"
    end
    if intDayOfWeek == 4 then
        return "Thursday"
    end
    if intDayOfWeek == 5 then
        return "Friday"
    end
    if intDayOfWeek == 6 then
        return "Saturday"
    end
end

function GetCompassDirection()
    local heading = GetEntityHeading(GetPlayerPed(PlayerId()))
    for k, v in pairs(directions) do
        if math.abs(heading - v) < 22.5 then
            heading = k
            if heading == 1 then
                heading = 'NORTH'
            end
            return heading
        end
    end
end