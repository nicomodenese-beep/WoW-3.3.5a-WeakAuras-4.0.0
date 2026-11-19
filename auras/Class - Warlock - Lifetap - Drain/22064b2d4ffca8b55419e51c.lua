aura_env.locName = GetSpellInfo(57946) -- Life Tap
aura_env.loaded = true

function aura_env.SetSpec()
    local tab, max = 1, 0
    for i=1, 3 do
        local _, _, pointsSpent = GetTalentTabInfo(i)
        if pointsSpent > max then
            tab = i
            max = pointsSpent
        end
    end
    return tab
end

function aura_env.OnInit()
    aura_env.mySpec = aura_env.SetSpec()
    if aura_env.mySpec == 1 then
        aura_env.setName = "Affli"
    elseif aura_env.mySpec == 2 then
        aura_env.setName = "Demo"
    else
        aura_env.setName = "PvP"
    end
end

function aura_env.SwitchBack(mySpec)
    if (mySpec == 1) then
        -- Equip Affli Gear
        EquipItemByName("Sanctified Dark Coven Shoulderpads")
        EquipItemByName("Sanctified Dark Coven Robe")
        EquipItemByName("Plaguebringer's Stained Pants")
        EquipItemByName("Sanctified Dark Coven Gloves")
        EquipItemByName("Crushing Coldwraith Belt")
        EquipItemByName("Bloodsurge, Kel'Thuzad's Blade of Agony")
        EquipItemByName("Ring of Rapid Ascent")
        EquipItemByName("Hitem:50684:0:3560:0:0:0:0:0:80h[Corpse-Impaling Spike]h")
    elseif (mySpec == 2) then
        -- Equip Demo Gear
    else
        -- Equip Destro Gear
    end
end

aura_env:OnInit()