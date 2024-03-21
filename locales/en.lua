local Translations = {
    error = {
        ["canceled"] = "Refueling was canceled!",
        ["toofaraway"] = "You are too far away from any vehicle!",
        ["nomoney"] = "You don't have enough money for an gas can!",
        ["full_tank"] = "Vehicles fuel tank is full!",
    },
    success = {
        ["success"] = "You successfully refueled vehicle!",
    },
    info = {
        ["invehicle"] = "You can't be inside any vehicle while refueling!",
        ["progress_bar"] = "Refueling Vehicle",
    },
    warning = {},
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})