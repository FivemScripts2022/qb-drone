TeleportPlayer = function(x,y,z,h)
  local xType = type(x)
  local plyPed = PlayerPedId()
  local pos = (xType == "table" and x or xType == "vector3" and x or vector3(x,y,z))
  local head = (xType == "table" and y or xType == "vector3" and y or h and h or GetEntityHeading(plyPed))

  SetEntityCoordsNoOffset(plyPed, pos.x,pos.y,pos.z)
  SetEntityHeading(plyPos,head)
  Wait(0)

  if not HasCollisionLoadedAroundEntity(PlayerPedId()) then
    FreezeEntityPosition(PlayerPedId(),true)
    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do Wait(0); end
    FreezeEntityPosition(PlayerPedId(),false)
  end
end

exports('TeleportPlayer', TeleportPlayer)