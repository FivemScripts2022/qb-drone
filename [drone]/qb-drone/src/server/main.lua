local QBCore = exports['qb-core']:GetCoreObject()

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

QBCore.Functions.CreateUseableItem("drone", function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local drone_data = Config.Drones[1]
    TriggerClientEvent("Drones:UseDrone", source, drone_data)
    xPlayer.Functions.RemoveItem('drone', 1)
end)
