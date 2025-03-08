CreateThread(function() 
   if Config.UseTargetSystem then exports[Config.TargetScript]:AddTargetModel(Config.GasPumpModels, { 
      options = {           if Config.UseRefillSystem then
          { 
             --type = Config.RefillTargetType, 
             --event = Config.RefillTargetTrigger, 
             --icon =  Config.RefillTargetIcon, 
             --label = Lang:t("target.refill_can") ..Config.GasRefillPrice 
          },                      
          end                  
          { 
             type = Config.TargetType, 
             event = Config.TargetTrigger, 
             icon =  Config.TargetIcon, 
             label = Lang:t("target.buy_can") ..Config.GasCanPrice 
          } 
      }, 
      distance = 2.5 
      }) 
   end 
end)
