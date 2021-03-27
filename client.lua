vRP = Proxy.getInterface("vRP")



function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 250, false, false)
end
    
RegisterCommand("giveweapon", function(args, rawCommand)
 
local playerPed = GetPlayerPed(-1)
    local weaponHash = GetHashKey(args[1])
	local ammoCount = 9999
    notify("~w~[ZEDD]~w~ ~g~Ai primit o arma")
	GiveWeaponToPed(playerPed, weaponHash, ammoCount, false)
end)

RegisterCommand('dacie', function()
    local car = GetHashKey("1310s")

    RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle("1310s", x + 3, y + 3, z+1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)

end, false)

function notify(msg)

SetNotificationTextEntry("STRING")
AddTextComponentString(msg)
DrawNotification(true, false)

end

RegisterCommand("tinta", function(source)

   local ped = GetPlayerPed(-1)
    viata = (GetEntityHealth(ped)-0)
  
   
    SetEntityHealth(ped, 0)
   Wait(1500)
    SetEntityHealth(ped, viata)
    Wait(500)
    SetEntityHealth(ped, 0)
Wait(1500)    
    SetEntityHealth(ped, viata)
end)
