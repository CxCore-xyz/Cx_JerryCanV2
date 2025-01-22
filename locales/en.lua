local Translations = {
    error = {
        ["canceled"] = "Refueling was canceled!",
        ["toofaraway"] = "You are too far away from any vehicle!",
        ["nomoney"] = "You don't have enough money for an gas can!",
        ["full_tank"] = "Vehicles fuel tank is full!",
        ["nospace"] = "Your inventory is full!",
    },
    success = {
        ["success"] = "You successfully refueled vehicle!",
        ["jerrycan"] = "You successfully purchased jerrycan!",
    },
    info = {
        ["invehicle"] = "You can't be inside any vehicle while refueling!",
        ["progress_bar"] = "Refueling Vehicle",
        ["progress_buyjerry"] = "Purchasing Jerrycan",
    },
    target = {
        ["buy_can"] = "Buy Jerrycan For $",
    },
    warning = {},
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
