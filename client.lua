vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      DisableControlAction(0, 140, active)
      DisableControlAction(0, 263, active)
       DisableControlAction(0, 257, active)
       
       
       local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
            	end

-- MeleeAttackAlternate
    end
    Citizen.Wait(0)
end)



function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 250, false, false)
  
end
    
RegisterCommand("giveweapon", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
print(user_id)  
    
	local playerPed = GetPlayerPed(-1)
    local weaponHash = GetHashKey(args[1])
	local ammoCount = 9999
	
    notify("~w~[ZEDD]~w~ ~g~Ai primit o arma")

    
	GiveWeaponToPed(playerPed, weaponHash, ammoCount, false)
	
end)


RegisterCommand('dacie', function(player)
    local car = GetHashKey("1310s")
    local user_id = vRP.getUserId({player})
    print(user_id)
   

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
    print(viata)
    
    SetEntityHealth(ped, 0)
   Wait(1500)
    SetEntityHealth(ped, viata)
    Wait(500)
    SetEntityHealth(ped, 0)
Wait(1500)    
    SetEntityHealth(ped, viata)

    
    

   



end)