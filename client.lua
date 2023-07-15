local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("mask", function()
    local ped = PlayerPedId()
    local mask = GetPedDrawableVariation(ped, 1)
    local tex = GetPedTextureVariation(ped, 1)

    if mask == 0 then
        TriggerServerEvent("lucid-masks:server:MaskOnByCommand")
    else
        TriggerEvent("lucid-masks:client:MaskOff", mask, tex)
    end
end, false)


RegisterNetEvent('lucid-masks:client:MaskOn', function(item)
    local ped = PlayerPedId()
    if item.info.drawableId == nil then print("This mask has no data. Do not spawn it in. Instead go to a clothing store then remove the mask") end
    if GetPedDrawableVariation(ped, 1) ~= 0 then QBCore.Functions.Notify("You are already wearing a mask", "error") return end

    QBCore.Functions.Progressbar("maskon", "Putting Mask On..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "mp_masks@standard_car@ds@",
        anim = "put_on_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, item.info.drawableId, item.info.textureId)
        TriggerServerEvent("lucid-masks:server:RemoveMaskItem", item)
    end, function() -- Cancel

    end)
end)

RegisterNetEvent('lucid-masks:client:MaskOff', function(mask, tex)
    local ped = PlayerPedId()
    if GetPedDrawableVariation(ped, 1) == 0 then QBCore.Functions.Notify("You are not wearing a mask", "error") return end

    QBCore.Functions.Progressbar("maskoff", "Taking Mask Off..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "missfbi4",
        anim = "takeoff_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, 0)
        TriggerServerEvent("lucid-masks:server:GiveMaskItem", mask, tex)
    end, function() -- Cancel

    end)
end)
