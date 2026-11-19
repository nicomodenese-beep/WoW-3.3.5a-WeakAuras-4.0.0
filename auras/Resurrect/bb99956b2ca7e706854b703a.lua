-- Resses to be tracked
aura_env.res = {
    --[GetSpellInfo(47843)] = true, -- Unstable Affliction
    --["Shadow Bolt"] = true,
    --[GetSpellInfo(47964)] = true, -- Fireball (Imp)
    
    [GetSpellInfo(48171)] = true, -- Resurrection (Priest)
    [GetSpellInfo(48950)] = true, -- Redemption (Paladin)
    [GetSpellInfo(25590)] = true, -- Ancestral Spirit (Shaman)
    [GetSpellInfo(50766)] = true, -- Revive (Druid)
    [GetSpellInfo(20748)] = true, -- Rebirth (Druid)
    [GetSpellInfo(45872)] = true, -- Defibrillate
}

function aura_env.checkRedundant(allstates)
    -- check all restargets and create table with expirationTimes and casterGUID
    local restargets = {}
    for casterGUID, resEvent in pairs(allstates) do
        if restargets[resEvent.target] and resEvent.status ~= "interrupted" and not resEvent.mayFail then
            -- restarget already found, check if faster
            if restargets[resEvent.target].expirationTime > resEvent.expirationTime then
                restargets[resEvent.target].expirationTime = resEvent.expirationTime
                restargets[resEvent.target].casterGUID = casterGUID
            end
        elseif resEvent.status ~= "interrupted" and not resEvent.mayFail then
            -- create new entry, first resEvent for this target
            restargets[resEvent.target] = {
                expirationTime = resEvent.expirationTime,
                casterGUID = casterGUID,
            }
        end
    end
    -- mark all redundant casts
    for casterGUID, resEvent in pairs(allstates) do
        local resEventPreviouslyRedundant = resEvent.redundant
        if restargets[resEvent.target] then
            -- mark redundant resses
            resEvent.redundant = restargets[resEvent.target].expirationTime < resEvent.expirationTime
        else
            -- triggers for resses that may fail and restarget is not ressed by anyone else
            resEvent.redundant = false
        end
        if resEventPreviouslyRedundant ~= resEvent.redundant then
            resEvent.changed = true
        end
    end
end

function aura_env.colorCode(unitName) 
    if (UnitClass(unitName)) then 
        local classColor = RAID_CLASS_COLORS[select(2,UnitClass(unitName))]
        return string.format("|cff%02x%02x%02x%s|r", 
        classColor.r * 255, classColor.g * 255, classColor.b * 255, unitName)
    else
        return unitName
    end
end    

function aura_env.displayRes(caster, target)
    return aura_env.colorCode(caster) .. " -> " .. aura_env.colorCode(target)
end