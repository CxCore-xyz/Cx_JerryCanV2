Config = Config or {}

--Authentication
Config.ScriptAuthentication = true -- Server will not work with this function set to false this is for security reasons
Config.ScriptLicense = "FREE-USE" -- Don't touch this, this is free use licensekey
Config.ScriptAuthor = "CxCore.xyz" -- Don't touch this or the script won't work
Config.ScriptDiscord = "Dsc.gg/CxCCore" -- Don't touch this or the script won't work

--Fuel decor settings
Config.FuelDecor = "_FUEL_LEVEL" -- Do not touch this just leave it alone

--Distance checking settings
Config.FillDistance = 2.5 -- Recommended 2.5 or above no lower

--Fill time settings
Config.FillTime = 15000 -- 15Seconds

--Item & Fill settings
Config.JerryCanItem = "jerry_can" -- Your jerrycan item name | The item wich you want to work as jerrycan/gas can
Config.FillAmount = 20 -- Fill amount from 0 to 100 | This will add the amount to the current vehicle gas amount

--JerryCan props
Config.BackProps = true -- If you don't want on back prop make it false
Config.JerryCanProp = "weapon_petrolcan" -- An item wich the ped will hold when the animation starts

--Target settings for gas station purchasing
Config.TargetPurchase = true -- Don't need it? Make it false
Config.TargetScript = "qb-target" -- Your target script name
Config.TargetType = "server" -- Client or server
Config.TargetIcon = "fas fa-gas-pump" -- Icon for target
Config.TargetTrigger = "CxC:Purchase:JerryCan:Server" -- Trigger for purchasing boat gas can
Config.TargetTranslation = "Purchase JerryCan For $"
Config.GasPumpModels = { -- Models for the target
    "prop_gas_pump_1d",
    "prop_gas_pump_1a",
    "prop_gas_pump_1b",
    "prop_gas_pump_1c",
    "prop_vintage_pump",
    "prop_gas_pump_old2",
    "prop_gas_pump_old3"
}

--Purchasing gas can in gas station settingss
Config.GasCanAmount = 1 -- Amount wich will be given to player after purchase
Config.GasPaymentType = "cash" -- Cash or bank
Config.GasCanPrice = 200 -- Price for jerry can at gas station

--Debug settings
Config.Debug = false -- Set true if you want console debug
