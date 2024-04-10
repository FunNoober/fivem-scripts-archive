-- SetRiotModeEnabled(true)

Citizen.CreateThread(function ()
    while true do
        ReplaceHudColour(116, 3)
        DisableIdleCamera(true)
        Citizen.Wait(1)
    end
end)