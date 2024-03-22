function AddFuelToVehicle(vehicle, fuel)
   if fuel < 0 then fuel = 0 end
   if fuel > 100 then fuel = 100 end
   if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
	SetVehicleFuelLevel(vehicle, fuel + 0.0)
	DecorSetFloat(vehicle, Config.FuelDecor, GetVehicleFuelLevel(vehicle))
   end
end
