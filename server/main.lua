if Config.Core == "NewQB" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Core == "OldQB" then 
    QBCore = nil
    TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
end

RegisterServerEvent('CxC-Bakelis:server:RemoveItem')
AddEventHandler('CxC-Bakelis:server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Removing jerry can from this player-ID: ^5"..src) end
end)

QBCore.Functions.CreateUseableItem(Config.JerryCanItem, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("CxC-Bakelis:client:UseJerrycan", source)
    if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Used jerrycan! ID: ^5"..src) end
end)

RegisterServerEvent('server:can:prop:new')
AddEventHandler('server:can:prop:new', function(type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if type == 'add' then
       GiveWeaponToPed(src,Config.JerryCanProp,5,true,true)
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Jerry can prop was spawned for this player-ID: ^5"..src) end
    elseif type == 'remove' then
       GiveWeaponToPed(src,"weapon_unarmed",0,true,true)
       if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Jerry can prop was deleted for this player-ID: ^5"..src) end
    end
end)

RegisterNetEvent("CxC:Purchase:JerryCan:Server")
AddEventHandler("CxC:Purchase:JerryCan:Server", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.GasCanPrice then
       if not Player.Functions.AddItem(Config.JerryCanItem, Config.GasCanAmount) then return TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nospace"), "error") end
          Player.Functions.RemoveMoney(Config.GasPaymentType, Config.GasCanPrice)
          TriggerClientEvent('QBCore:Notify', src, Lang:t("success.jerrycan"), "success")
          if Config.Core == "OldQB" then
             TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.JerryCanItem], "add")
          elseif Config.Core == "NewQB" then
             TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.JerryCanItem], "add")
          end
      else
          TriggerClientEvent('QBCore:Notify', src, Lang:t("error.nomoney"), "error")
      end
end)

RegisterServerEvent('debug:server:side:new')
AddEventHandler('debug:server:side:new', function(type)
    local src = source
    if type == 'one' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Animation loop started for this player-ID: ^5"..src) end
    elseif type == 'two' then
       if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Refueling was canceled for this player-ID: ^5"..src) end
    elseif type == 'three' then
       if Config.Debug then print("^0[^5Debug^7][^2Success^0]: Vehicle was successfully refueled for this player-ID: ^5"..src) end
    elseif type == 'four' then
       if Config.Debug then print("^0[^5Debug^7][^1Error^0]: Couldn't use jerrycan on vehicle because this player-ID: ^4"..src.." ^0is to far from the vehicle wich he is trying to refill") end
    elseif type == 'five' then
       if Config.Debug then print("^0[^5Debug^7][^1Error^0]: Couldn't use jerrycan on vehicle because this player-ID: ^4"..src.." ^0was in vehicle driverseat when trying to fill the tank") end
    elseif type == 'six' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Items prop loop was started player-ID: ^5"..src) end
    elseif type == 'seven' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Successfully bought an jerrycan from gas station player-ID: ^5"..src) end
    elseif type == 'eight' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Jerrycan purchasing was canceled player-ID: ^5"..src) end
    elseif type == 'nine' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Jerrycan was successfully refilled rom gas station player-ID: ^5"..src) end    
    elseif type == 'ten' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: Jerrycan refilling was canceled player-ID: ^5"..src) end    
    elseif type == 'eleven' then
       if Config.Debug then print("^0[^5Debug^7][^3Information^0]: An error occured player-ID: ^5"..src) end               
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    local scriptshuttimer = math.random(5500,8500)
    local scriptlicensekey = Config.ScriptLicense
    if Config.ScriptAuthentication and Config.ScriptLicense == "FREE-USE" then
        print("^0[^3Authentication^0]: ^2Found ^2Free ^2Use ^2Licenses: ^3"..scriptlicensekey)
    else
        Wait(5000)
        print("^0[^3Authentication^0]: ^1No ^1License ^1Found! ^1Server ^1Shutting ^1Down ^1In: "..scriptshuttimer)
        Wait(scriptshuttimer)
        os.exit()
    end
end)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
	Citizen.Wait(5000)
        print('^2>>-----------------^4CxCore^2----------------<<')
	print('^4Cx_JerryCanV2 ^0(Created By CxCore)')
        print('^1Discord : ^0https://discord.gg/CcVQHbJCSH')
        print('^5Discord #2 : ^0https://dsc.gg/CxCCore')
        print('^2>>-----------------^4CxCore^2----------------<<')
   end
end)
