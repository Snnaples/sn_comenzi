local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_comenzi")

RegisterCommand("kickrestart", function(player, args)
    if player == 0 then
        local users = vRP.getUsers({})
        for user_id,player in pairs(users) do
            DropPlayer(player,"Server-ul se restarteaza , reveniti in 2 minute.Pentru lista cu update , puteti vizita discord-ul") --vRPclient.teleport(target_src, {-541.18426513672,-210.87506103516,37.649757385254})
        end
    end
end, false)

RegisterCommand('respawn', function(source, args, msg)
  local user_id = vRP.getUserId({source})
  msg = msg:sub(9)
  if msg:len() >= 1 then
    msg = tonumber(msg)
    local target = vRP.getUserSource({msg})
    if target ~= nil then
      if vRP.hasPermission({user_id, "admin.tickets"}) then
        vRPclient.varyHealth(target,{100})
        vRPclient.teleport(target, {-541.18426513672,-210.87506103516,37.649757385254})

        TriggerClientEvent('chatMessage', -1, "^0Adminul ^1 "..GetPlayerName(source).." ^0 i-a dat respawn lui^1 "..GetPlayerName(target))
      else
        TriggerClientEvent('chatMessage', source, "^8Eroare^7: Nu ai acces la aceasta comanda.")
      end
    else
      TriggerClientEvent('chatMessage', source, "^8Eroare^7: Player-ul nu este conectat.")
    end
  else
    TriggerClientEvent('chatMessage', source, "^8Syntax^7: /respawn <user-id>")
  end
end)

RegisterCommand('arevive', function(source, args, msg)
  local user_id = vRP.getUserId({source})
  msg = msg:sub(9)
  if msg:len() >= 1 then
    msg = tonumber(msg)
    local target = vRP.getUserSource({msg})
    if target ~= nil then
      if vRP.hasPermission({user_id, "admin.tickets"}) then
        vRPclient.varyHealth(target,{100})

        TriggerClientEvent('chatMessage', -1, "^0Arevive: ^1 "..GetPlayerName(source).." ^0>^1 "..GetPlayerName(target))
      else
        TriggerClientEvent('chatMessage', source, "^8Eroare^7: Nu ai acces la aceasta comanda.")
      end
    else
      TriggerClientEvent('chatMessage', source, "^8Eroare^7: Player-ul nu este conectat.")
    end
  else
    TriggerClientEvent('chatMessage', source, "^8Syntax^7: /arevive <user-id>")
  end
end)

RegisterCommand("noclip", function(player)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.noclip"}) then
    vRPclient.toggleNoclip(player, {})
end
end)
