if Config.Language == "lt" then
local Translations = {
    error = {
        ["canceled"] = "Degalų pilimas atšauktas!",
        ["toofaraway"] = "Esate per toli nuo tr.priemonės!",
        ["nomoney"] = "Neturite pakankamai pinigu degalų bakeliui!",
        ["full_tank"] = "Tr.Priemonės degalų bakas yra pilnas!",
    },
    success = {
        ["success"] = "Sėkminga užpilėtę degalus į tr.priemonę!",
    },
    info = {
        ["invehicle"] = "Negalite atlikti šio veiksmo sėdint tr.priemonei!",
        ["progress_bar"] = "Pilami Degalai",
    },
    warning = {},
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
end