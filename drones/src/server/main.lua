local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("Drones:Buy")
AddEventHandler('Drones:Buy', function(drone)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if xPlayer.PlayerData.money['bank'] >= drone.price then
    	xPlayer.Functions.AddItem(drone.name, 1)
    	xPlayer.Functions.RemoveMoney(Config.BankAccountName, drone.price)
    	TriggerClientEvent("Drones:CloseUI", src)
    else

    end
end)

RegisterServerEvent("Drones:Disconnect")
AddEventHandler('Drones:Disconnect', function(drone, drone_data, pos)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('Drones:DropDrone', xPlayer.source, drone, drone_data, pos)
end)

RegisterServerEvent("Drones:Back")
AddEventHandler('Drones:Back', function(drone_data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer.Functions.AddItem(drone_data.name, 1)
end)


QBCore.Functions.CreateUseableItem("drone_flyer_1", function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local drone_data = Config.Drones[1]
    TriggerClientEvent("Drones:UseDrone", source, drone_data)
    xPlayer.Functions.RemoveItem('drone_flyer_1', 1)
end)


-- RegisterServerEvent("drone6")
-- AddEventHandler("drone6",function(source)
--     local xPlayer = QBCore.Functions.GetPlayer(source)
--     xPlayer.Functions.RemoveItem('drone', 1)
--     local drone_data = Config.Drones[6]
--     TriggerClientEvent('Drones:UseDrone', xPlayer.source, drone_data)
-- end)
