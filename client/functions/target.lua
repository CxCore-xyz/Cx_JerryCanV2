CreateThread(function() 
   if Config.TargetPurchase then exports[Config.TargetScript]:AddTargetModel(Config.GasPumpModels, { 
      options = { 
          { 
             type = Config.TargetType, 
             event = Config.TargetTrigger, 
             icon =  Config.TargetIcon, 
             label = Lang:t("target.buy_can") ..Config.GasCanPrice 
          } 
          if Config.UseRefillSystem then
                     
          end
      }, 
      distance = 2.5 
      }) 
   end 
end)
