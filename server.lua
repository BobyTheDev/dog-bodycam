QBCore = exports['qb-core']:GetCoreObject()
local acik = false

TriggerEvent("QBCore:GetObject", function (obj) QBCore = obj end)



RegisterNetEvent("booleanuodate")
AddEventHandler("booleanuodate", function (bool)
    acik = bool
end)

QBCore.Functions.CreateUseableItem("bodycam" , function(source, item)
    local _src = source
    TriggerClientEvent("dog-bodycam:openBoy", _src, item, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)

if Config.Debug then
    QBCore.Commands.Add('debugbodycam', 'debugging dog-bodycam', {}, false, function(source, args)
    local _src = source
    TriggerClientEvent("dog-bodycam:openBoy", _src, item, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)
end

CreateThread(function ()
    while acik do
        Citizen.Wait(1000)
        local src = source
        TriggerClientEvent("bodycam:time", src, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
    end
end)