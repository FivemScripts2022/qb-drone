Drones        = {}
Scenes        = mLibs:SynchronisedScene()
Scaleforms    = mLibs:Scaleforms()

function V3SqrMagnitude(self)
  return self.x * self.x + self.y * self.y + self.z * self.z
end

function GetGroundZ(pos)
  local found,z = GetGroundZFor_3dCoord(pos.x,pos.y,pos.z)
  if not found then
    return GetGround(vector3(pos.x,pos.y,pos.z-1.0))
  else
    return vector3(pos.x,pos.y,z)
  end
end

function V3ClampMagnitude(self,max)
  if V3SqrMagnitude(self) > (max * max) then
    self = V3SetNormalize(self)
    self = V3Mul(self,max)
  end
  return self
end

function V3SetNormalize(self)
  local num = V3Magnitude(self)
  if num == 1 then
    return self
  elseif num > 1e-5 then
    self = V3Div(self,num)
  else
    self = vector3(0.0,0.0,0.0)
  end
  return self
end

function V3Mul(self,q)
  if type(q) == "number" then
    self = self * q
  else
    self = V3MulQuat(self,q)
  end
  return self
end

function V3Magnitude(self)
  return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function V3Div(self,d)
  self = vector3(self.x / d,self.y / d,self.z / d)
  
  return self
end

function V3MulQuat(self,quat)    
  local num   = quat.x * 2
  local num2  = quat.y * 2
  local num3  = quat.z * 2
  local num4  = quat.x * num
  local num5  = quat.y * num2
  local num6  = quat.z * num3
  local num7  = quat.x * num2
  local num8  = quat.x * num3
  local num9  = quat.y * num3
  local num10 = quat.w * num
  local num11 = quat.w * num2
  local num12 = quat.w * num3
  
  local x = (((1 - (num5 + num6)) * self.x) + ((num7 - num12) * self.y)) + ((num8 + num11) * self.z)
  local y = (((num7 + num12) * self.x) + ((1 - (num4 + num6)) * self.y)) + ((num9 - num10) * self.z)
  local z = (((num8 - num11) * self.x) + ((num9 + num10) * self.y)) + ((1 - (num4 + num5)) * self.z)
  
  self = vector3(x, y, z) 
  return self
end

function V2Dist(v1, v2)
  if not v1 or not v2 or not v1.x or not v2.x or not v1.y or not v2.y then return 0; end
  return math.sqrt( ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) ) )
end

function V3Dist(v1,v2)
  if not v1 or not v2 or not v1.x or not v2.x then return 0; end
  return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  )
end

Vdist = V3Dist

function CreateBlip(pos,sprite,color,text,scale,display,shortRange,highDetail)
  local blip = AddBlipForCoord(pos.x,pos.y,pos.z)
  SetBlipSprite(blip, sprite)
  SetBlipDisplay(blip, 2)
  SetBlipScale(blip, 0.5)
  SetBlipColour(blip, color)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString((text or "Blip "..tostring(blip)))
  EndTextCommandSetBlipName(blip)
  return blip
end

function DrawText3D(pos, text)
  local camCoords = GetGameplayCamCoords()
  local distance = #(pos - camCoords)

  if not size then size = 1 end
  if not font then font = 1 end

  local dist = Vdist(GetEntityCoords(PlayerPedId()),pos)

  local scale = (size / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  scale = scale * fov

  SetTextScale(0.0 * scale, 0.55 * scale)
  SetTextFont(font)
  SetTextColour(255, 255, 255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(true)

  SetDrawOrigin(pos, 0)
  BeginTextCommandDisplayText('STRING')
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandDisplayText(0.0, 0.0)
  ClearDrawOrigin()
end

function DrawSpotlight(pos,alpha)
  local lightPos = vector3(pos.x,pos.y,pos.z + 5.0)
  local direction = pos - lightPos
  local normal = V3SetNormalize(direction)
  DrawSpotLight(lightPos.x,lightPos.y,lightPos.z, normal.x,normal.y,normal.z, 255,255,255, alpha, 1.0, 0.0, 10.0, 1.0)
end

function PointOnSphere(alt,azu,radius,orgX,orgY,orgZ)
  local toradians = 0.017453292384744
  alt,azu,radius,orgX,orgY,orgZ = ( tonumber(alt or 0) or 0 ) * toradians, ( tonumber(azu or 0) or 0 ) * toradians, tonumber(radius or 0) or 0, tonumber(orgX or 0) or 0, tonumber(orgY or 0) or 0, tonumber(orgZ or 0) or 0
  if      vector3
  then
      return
      vector3(
           orgX + radius * math.sin( azu ) * math.cos( alt ),
           orgY + radius * math.cos( azu ) * math.cos( alt ),
           orgZ + radius * math.sin( alt )
      )
  end
end

function ShowHelpNotification(msg, thisFrame, beep, duration)
  AddTextEntry('DroneHelpNotification', msg)

  if thisFrame then
    DisplayHelpTextThisFrame('DroneHelpNotification', false)
  else
    if beep == nil then beep = false; end
    BeginTextCommandDisplayHelp('DroneHelpNotification')
    EndTextCommandDisplayHelp(0, false, beep, duration or -1)
  end
end