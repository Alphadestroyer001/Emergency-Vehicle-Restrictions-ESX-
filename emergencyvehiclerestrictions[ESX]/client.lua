ESX                    = nil
local PlayerData    = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local ped = GetPlayerPed(-1)
        PlayerData = ESX.GetPlayerData()
        
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
            if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'marshals' then
               
                TaskLeaveVehicle(ped,vehicle,0)
                TriggerEvent('esx:showNotification', "~r~You are not allowed to drive this ~y~vehicle.")
            end
	end
    end
end)
