function(event, unit, spellName, spellRank, targetName)
    if event == "PLAYER_ENTERING_WORLD" then
        aura_env.clonePending = nil
        aura_env.cloneCast = nil
        return false
    end
    
    local cycloneName = GetSpellInfo(33786)
    
    if unit ~= "player" or spellName ~= cycloneName then
        return false
    end
    
    if event == "UNIT_SPELLCAST_SENT" then
        aura_env.clonePending = nil
        
        if not targetName or targetName == "" then
            return false
        end
        
        -- Eindeutige GUID zum vom Client gemeldeten Zielnamen suchen.
        local matches = {}
        
        local function CheckUnit(token)
            local name, realm = UnitName(token)
            local guid = UnitGUID(token)
            
            if not name or not guid then
                return
            end
            
            local fullName = name
            if realm and realm ~= "" then
                fullName = name .. "-" .. realm
            end
            
            if targetName == name or targetName == fullName then
                matches[guid] = true
            end
        end
        
        CheckUnit("target")
        CheckUnit("focus")
        CheckUnit("mouseover")
        
        for i = 1, 5 do
            CheckUnit("arena" .. i)
            CheckUnit("arenapet" .. i)
        end
        
        local targetGUID
        local count = 0
        
        for guid in pairs(matches) do
            targetGUID = guid
            count = count + 1
        end
        
        -- Mehrere gleichnamige Einheiten: nicht raten.
        if count == 1 then
            aura_env.clonePending = {
                guid = targetGUID,
                time = GetTime(),
            }
        end
        
    elseif event == "UNIT_SPELLCAST_START" then
        local name, _, _, _, startTimeMS =
        UnitCastingInfo("player")
        
        local pending = aura_env.clonePending
        aura_env.clonePending = nil
        aura_env.cloneCast = nil
        
        if name == cycloneName
        and startTimeMS
        and pending
        and GetTime() - pending.time < 5
        then
            aura_env.cloneCast = {
                guid = pending.guid,
                startTimeMS = startTimeMS,
                warned = false,
            }
        end
    end
    
    -- Dieser Trigger sammelt nur Informationen.
    return false
end