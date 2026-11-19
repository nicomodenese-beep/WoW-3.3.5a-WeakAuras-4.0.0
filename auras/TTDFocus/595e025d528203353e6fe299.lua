function(event, ...)
    -- target health changed
    if (event == "TTD_FOCUS" and UnitName("focus")) then 
        -- store health info for prediction
        aura_env.timestamps[#aura_env.timestamps + 1] = GetTime()
        -- special case lady LG
        if (UnitName("focus") ~= aura_env.lady or UnitMana("focus") == 0) then
            aura_env.healthstamps[#aura_env.healthstamps + 1] = UnitHealth("focus") / UnitHealthMax("focus")
        else
            aura_env.healthstamps[#aura_env.healthstamps + 1] = UnitMana("focus") / UnitManaMax("focus")
        end
        -- remove after 30 events
        if (#aura_env.timestamps > 30) then
            table.remove(aura_env.timestamps, 1)
            table.remove(aura_env.healthstamps, 1)
        end
        
        -- cancel prediction if less than 2 events logged
        if (#aura_env.timestamps < 2) then
            return false
        end
        
        -- start prediction
        local a, b = aura_env.weighted_least_squares(aura_env.timestamps, aura_env.healthstamps)
        -- a == 0 means division by zero
        if (a == 0) then
            return false
        end      
        aura_env.pred = - b / a - GetTime()
        
        -- handle special cases and phase transitions
        if aura_env.specialCases[UnitName("focus")] then
            local breakPoints = aura_env.specialCases[UnitName("focus")]
            local nextBPIn = 100000
            local nextBPName = ""
            -- check each special breakpoint listed and show the next one happening
            for bp, value in pairs(breakPoints) do
                local BPIn = (value - b) / a - GetTime()
                -- only show next breakpoint
                if BPIn < nextBPIn and BPIn >= 0 then
                    nextBPIn = BPIn 
                    nextBPName = bp
                end
            end
            -- add special cases to output
            if nextBPName ~= "" then
                if (nextBPIn < 0 or nextBPIn > 3600) then
                    aura_env.output = ""
                else
                    aura_env.output = nextBPName .. ": " .. aura_env.format_time(ceil(nextBPIn))
                end
            else
                if (aura_env.pred < 0 or aura_env.pred > 3600) then
                    aura_env.output = ""
                else
                    aura_env.output = aura_env.format_time(ceil(aura_env.pred))
                end
            end
            
        else
            if (aura_env.pred < 0 or aura_env.pred > 3600) then
                aura_env.output = ""
            else
                aura_env.output = aura_env.format_time(ceil(aura_env.pred))        
            end
        end
        
        return true
    end
    -- entering fight -> start timer events
    if (event == "PLAYER_REGEN_DISABLED") then
        WeakAuras.timer:CancelTimer(aura_env.timerID) -- cancel timer before starting new one
        aura_env.timerID = WeakAuras.timer:ScheduleRepeatingTimer(WeakAuras.ScanEvents, .4, "TTD_FOCUS")
    end
    -- cancel timer after fight ends
    --[[if (event == "PLAYER_REGEN_ENABLED") then
        WeakAuras.timer:CancelTimer(aura_env.timerID) 
    end]]
end