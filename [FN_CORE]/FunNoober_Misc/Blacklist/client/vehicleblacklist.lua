local blockedModels = {

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(veh) and IsEntityAVehicle(veh) and not IsEntityDead(veh) then
                if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                    for _,car in pairs(blockedModels) do
                        local model = GetEntityModel(veh)
                        if GetHashKey(car) == model then
                            SetEntityAsMissionEntity(veh, true, true)
                            DeleteVehicle(veh)
                            notifyBlacklist("~c~This model is blacklisted, you are not allowed to drive it.")
                        end
                    end
                end
            end
        end
    end
end)