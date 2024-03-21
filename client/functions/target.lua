CreateThread(function() 
   if Config.TargetPurchase then exports[Config.TargetScript]:AddTargetModel(Config.GasPumpModels, { 
      options = { 
          { 
             type = Config.TargetType, 
             event = Config.TargetTrigger, 
             icon =  Config.TargetIcon, label = Config.TargetTranslation ..Config.GasCanPrice 
          } 
      }, 
      distance = 2.5 
      }) 
   end 
end)