local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

Citizen.CreateThread(function ()
    while QBCore == nil do
        Citizen.Wait(0)
        TriggerEvent("QBCore:GetObject", function (obj) QBCore = obj
        end)
        while QBCore.Functions.GetPlayerData() == nil do
            Citizen.Wait(10)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function (meslk)
    PlayerData.job = meslk
end)

local year --[[ integer ]], month --[[ integer ]], day --[[ integer ]], hour --[[ integer ]], minute --[[ integer ]], second --[[ integer ]] = GetLocalTime()

RegisterNetEvent("bodycam:time")
AddEventHandler("bodycam:time", function (h,m,s)
    SendNUIMessage({
        action = "zamanguncelle",
        zaman = day.."/"..month.."/"..year.." ".." - "..h..":"..m..":"..s.." GMT+3",
    })
end)

RegisterNetEvent("dog-bodycam:openBoy")
AddEventHandler("dog-bodycam:openBoy", function (item, h,m,s)
    if PlayerData.job.name == "police" then
        if PlayerData.charinfo.gender == "0" then
            gender = Config.Gender2
        else
            gender = Config.Gender1
        end
        if acik then
            acik = false
            SendNUIMessage({
                action = "hidebodycam"
            })
            TriggerServerEvent("booleanuodate", false)

        else
            SendNUIMessage({
                action = "showbodycam",
                player = PlayerData.job.grade.name.. " "..gender.." "..PlayerData.charinfo.firstname,
                callsign = "["..PlayerData.metadata['callsign'].."]",
                tarih = day.."/"..month.."/"..year.." ".." - "..h..":"..m..":"..s.." GMT+3",
            })
            TriggerServerEvent("booleanuodate", true)
            acik = true
        end
    end
end)