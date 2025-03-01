local QBCore = exports['qb-core']:GetCoreObject()
local fueling = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        fueling = false
        TriggerServerEvent('remove:can:prop')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
        fueling = false
        TriggerServerEvent('remove:can:prop')
end)

RegisterNetEvent('CxC-Bakelis:client:UseJerrycan')
AddEventHandler('CxC-Bakelis:client:UseJerrycan', function()
    local src = source
    local ped = GetPlayerPed(-1)
    local invehicle = IsPedInAnyVehicle(ped)
    local curVehD = QBCore.Functions.GetClosestVehicle()
    local PlayerCoords = GetEntityCoords(ped)
    local vehicleCoords = GetEntityCoords(curVehD)
    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)
    if distanceToVehicle > Config.FillDistance then
        QBCore.Functions.Notify(Lang:t("error.toofaraway"),"error")
        TriggerServerEvent('debug:server:side:new', 'four')
        return
    end
    if invehicle then
        QBCore.Functions.Notify(Lang:t("info.invehicle"), 'error')
        TriggerServerEvent('debug:server:side:new', 'five')
        return
    end
    local curVeh = QBCore.Functions.GetClosestVehicle()
    local vehicleFuel = DecorGetFloat(curVeh, Config.FuelDecor)
    if vehicleFuel < 100 then
        TaskTurnPedToFaceEntity(ped, curVeh, 1000)
        Wait(1000)
        TriggerServerEvent('server:can:prop:new', 'add')
        Wait(500)
        TriggerEvent('CxC:JerryCan:Animation:Trigger')
        fueling = true
        TriggerEvent("cxc:displayItems", false)
        QBCore.Functions.Progressbar("reful_veh", Lang:t("info.progress_bar"), Config.FillTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            AddFuelToVehicle(curVeh, vehicleFuel + Config.FillAmount)
            QBCore.Functions.Notify(Lang:t("success.success"), 'success')
            TriggerServerEvent('CxC-Bakelis:server:RemoveItem', Config.JerryCanItem, 1)
            TriggerServerEvent('debug:server:side:new', 'three')
            TriggerServerEvent('server:can:prop:new', 'remove')
            TriggerEvent("cxc:displayItems", true)
        end, function() -- Cancel
            TriggerServerEvent('server:can:prop:new', 'remove')
            TriggerServerEvent('debug:server:side:new', 'two')
            TriggerEvent("cxc:displayItems", true)
            fueling = false
            QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
        end)
    else
        QBCore.Functions.Notify(Lang:t("error.full_tank"), 'error')
    end
end)

RegisterNetEvent('CxC-Bakelis:client:BuyJerrycan')
AddEventHandler('CxC-Bakelis:client:BuyJerrycan', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
    QBCore.Functions.Progressbar("buy_jerrycan", Lang:t("info.progress_buyjerry"), Config.PurchaseTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('CxC:Purchase:JerryCan:Server')
        TriggerServerEvent('debug:server:side:new', 'seven')
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        TriggerServerEvent('debug:server:side:new', 'eight')
        QBCore.Functions.Notify(Lang:t("error.canceled"), 'error')
        ClearPedTasks(PlayerPedId())
    end)
end)
