aura_env.debug = function(group,msg,...)
    return WeakAuras.ScanEvents("DPRINT",group,aura_env.id,msg,...)
end
-------------------------------------------------------------------
aura_env.roster = {}
aura_env.rosterTarget = {}
aura_env.RDps = 0
aura_env.MDps = 0
aura_env.Tank = 0
aura_env.Heal = 0
aura_env.Unknown = 0
local spellID = 70352 -- Ooze (70352) - Gas (70353)
aura_env.spellName = GetSpellInfo(spellID)
local correctTar = GetLocale() == "deDE" and "Flüchtiger Schlamm" or "Volatile Ooze"
local wrongTar = GetLocale() == "deDE" and "Gaswolke" or "Gas Cloud"
local profTar = GetLocale() == "deDE" and "Professor Seuchenmord" or "Professor Putricide"
-- switch for gas cloud weak aura
if spellID == 70353 then correctTar, wrongTar = wrongTar, correctTar end

if aura_env.timerID then WeakAuras.timer:CancelTimer(aura_env.timerID) end
aura_env.timerID = nil

function aura_env.getTargetInfo(tarName)
    return tarName == correctTar and "correct" or tarName == wrongTar and "wrong" or tarName == profTar and "prof" or "else"
end

function aura_env.createAndUpdatePlayers(allstates)
    -- get all raid targets
    for unit in WA_IterateGroupMembers() do
        aura_env.rosterTarget[UnitName(unit)] = UnitName(unit .. "target")
    end
    
    -- create and update each player
    for unitName, role in pairs(aura_env.roster) do
        if not UnitIsDeadOrGhost(unitName) and not allstates[unitName] and aura_env.config[role] then
            if WA_GetUnitDebuff(unitName, aura_env.spellName) then
                local index = role == "RDps" and 100 or role == "MDps" and 200 or role == "Tank" and 300 or role == "Heal" and 400 or 500
                aura_env[role] = aura_env[role] + 1
                allstates[unitName] = {
                    show = true,
                    changed = true,
                    name = WA_ClassColorName(unitName),
                    target = aura_env.rosterTarget[unitName] or "",
                    isHeader = false,
                    index = index + aura_env[role],
                }
                allstates[unitName].targetInfo = aura_env.getTargetInfo(allstates[unitName].target)
            end
        elseif not UnitIsDeadOrGhost(unitName) and aura_env.config[role] then
            if WA_GetUnitDebuff(unitName, aura_env.spellName) then
                local currentTarget = aura_env.rosterTarget[unitName] or ""
                local changedTarget = allstates[unitName].target ~= currentTarget
                
                if changedTarget then
                    allstates[unitName].target = currentTarget
                    allstates[unitName].targetInfo = aura_env.getTargetInfo(currentTarget)
                    allstates[unitName].changed = true
                end
            end
        elseif aura_env.config[role] and allstates[unitName] then
            allstates[unitName].show = false
            allstates[unitName].changed = true
        end
    end
end

function aura_env.createHeaders(allstates)
    local headers = { "RDps", "MDps", "Tank", "Heal", "Unknown" }
    allstates["Title"] = {
        show = true,
        changed = true,
        name = aura_env.spellName,
        target = "",
        targetInfo = "",
        isHeader = true,
        index = 0,
    }
    for i, h in ipairs(headers) do
        if not allstates[h] and aura_env.config[h] then
            allstates[h] = {
                show = true,
                changed = true,
                name = h,
                target = "",
                targetInfo = "",
                isHeader = true,
                index = i * 100,
            }
        end
    end
end

function aura_env.createRoster()
    for unit in WA_IterateGroupMembers() do
        local unitName = UnitName(unit)
        aura_env.roster[unitName] = "Unknown"
    end
end

function aura_env.clearAll(allstates)
    for stateName, state in pairs(allstates) do
        state.show = false
        state.changed = true
    end
end