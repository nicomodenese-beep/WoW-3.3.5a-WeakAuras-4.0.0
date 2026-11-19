function(allstates, event, ...)
    if event == "PROF_TARGET_ADDS_ORANGE" then
        aura_env.createAndUpdatePlayers(allstates)
        return true
    elseif event == "RAID_ROLES" then
        -- receive raid roles from RAID_COOLDOWNS weak aura
        local roles = select(2, ...)
        -- aura_env.debug("fail", "RAID_ROLES", "roles", roles)
        for unitName, _ in pairs(aura_env.roster) do
            if roles and roles[unitName] then
                aura_env.roster[unitName] = roles[unitName]
            end
        end
        
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, subEvent, _,_,_, _,dstName,_, _, spellName = ...
        if subEvent == "SPELL_AURA_APPLIED" and spellName == aura_env.spellName and not aura_env.timerID then
            -- someone in raid gets variable debuff -> start ScheduleTimer and request roles
            aura_env.createRoster()
            aura_env.createHeaders(allstates)
            WeakAuras.ScanEvents("RAID_COOLDOWNS", "RAID_ROLES", "ALL")
            aura_env.timerID = WeakAuras.timer:ScheduleRepeatingTimer(WeakAuras.ScanEvents, 1, "PROF_TARGET_ADDS_ORANGE")
        elseif subEvent == "SPELL_AURA_REMOVED" and spellName == aura_env.spellName and not UnitIsDeadOrGhost(dstName) then
            -- someone in raid lost variable debuff and didnt die -> stop Timer
            if aura_env.timerID then WeakAuras.timer:CancelTimer(aura_env.timerID) end
            aura_env.timerID = nil
            aura_env.clearAll(allstates)
            return true
        end
    elseif event == "OPTIONS" then
        aura_env.createHeaders(allstates)
        aura_env.createRoster()
        aura_env.createAndUpdatePlayers(allstates)
    end
end