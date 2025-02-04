local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bobbypin', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  
  if xPlayer.getInventoryItem('bobbypin').count > 0 then
    if Config.Break then
      xPlayer.removeInventoryItem('bobbypin', 1)
      TriggerClientEvent('esx_bobbypin:use', source)
    else
      TriggerClientEvent('esx_bobbypin:use', source)
    end
  end
end)

RegisterNetEvent('esx_bobbypin:success')
AddEventHandler('esx_bobbypin:success', function(target)
  local targetXplayer = ESX.GetPlayerFromId(target)
  TriggerClientEvent('esx_policejob:unrestrain', targetXplayer.source) --Head over to esx_policejob: Line 1928
end)

RegisterNetEvent('esx_bobbypin:notifyTarget')
AddEventHandler('esx_bobbypin:notifyTarget', function(target)

  local targetXplayer = ESX.GetPlayerFromId(target)


  TriggerClientEvent("mythic_progressbar:client:progress", targetXplayer.source, {
    name = "target_picking_cuffs",
    duration = Config.Time * 1000,
    label = "Someone is trying to uncuff you",
    useWhileDead = false,
    canCancel = false,
    controlDisables = {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    },
    animation = {
      animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
      anim = "machinic_loop_mechandplayer",
      flags = 49,
    },
  }, function(status)
  end)

end)
