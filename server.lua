local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("mask", function(source, item)
    TriggerClientEvent("lucid-masks:client:MaskOn", source, item)
end)

RegisterNetEvent('lucid-masks:server:MaskOnByCommand', function(mask, tex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local mask = Player.Functions.GetItemByName("mask")
    if mask then
        TriggerClientEvent("lucid-masks:client:MaskOn", source, mask)
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have a mask", "error")
    end
end)

RegisterNetEvent('lucid-masks:server:GiveMaskItem', function(mask, tex)
    if mask == 0 then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {drawableId = mask, textureId = tex}

    Player.Functions.AddItem("mask", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mask"], "add")
end)

RegisterNetEvent('lucid-masks:server:RemoveMaskItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

QBCore.Functions.CreateUseableItem("hat", function(source, item)
    TriggerClientEvent("lucid-masks:client:HatOn", source, item)
end)

RegisterNetEvent('lucid-masks:server:HatOnByCommand', function(hat, tex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hat = Player.Functions.GetItemByName("hat")
    if hat then
        TriggerClientEvent("lucid-masks:client:MaskOn", source, hat)
    else
        TriggerClientEvent("QBCore:Notify", src, "You don\'t have a hat", "error")
    end
end)

RegisterNetEvent('lucid-masks:server:GiveHatItem', function(hat, tex)
    if hat == 0 then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {drawableId = hat, textureId = tex}

    Player.Functions.AddItem("hat", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hat"], "add")
end)

RegisterNetEvent('lucid-masks:server:RemoveHatItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)
