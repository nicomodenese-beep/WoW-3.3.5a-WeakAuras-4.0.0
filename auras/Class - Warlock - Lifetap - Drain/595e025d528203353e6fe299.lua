function(event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, subEvent, _,srcName,_,_,_,_,_, spellName = ...
        
        -- check if aura is loaded
        if not aura_env.loaded then
            return nil
        end
        -- check if player casted life tap
        if srcName ~= UnitName("player") or spellName ~= aura_env.locName then
            return nil
        end
        -- check for naked condition to disable if chosen
        if aura_env.config.nakedSwap and not IsEquippedItemType("Head") then
            return nil
        end
        -- switch back on successful or failed cast
        if (subEvent == "SPELL_CAST_SUCCESS") then
            --aura_env.SwitchBack(aura_env.mySpec)
            WeakAuras.timer:ScheduleTimer(aura_env.SwitchBack, .1, aura_env.mySpec)
            WeakAuras.timer:ScheduleTimer(aura_env.SwitchBack, .2, aura_env.mySpec)
        else
            WeakAuras.timer:ScheduleTimer(aura_env.SwitchBack, .1, aura_env.mySpec)
            WeakAuras.timer:ScheduleTimer(aura_env.SwitchBack, .2, aura_env.mySpec)
        end
    elseif event == "PLAYER_TALENT_UPDATE" or event == "LIFE_TAP" then
        aura_env:OnInit()
        if aura_env.config.talentchange then
            UseEquipmentSet(aura_env.setName)
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, 1, "LIFE_TAP")
    elseif event == "UNIT_SPELLCAST_SENT" then
        local unit, spellName = ...  
        -- check if player is about to cast life tap
        if unit ~= "player" or spellName ~= aura_env.locName then
            return nil
        end
        -- check for naked condition to disable if chosen
        if aura_env.config.nakedSwap and not IsEquippedItemType("Head") then
            return nil
        end
        -- check for manathreshold
        if aura_env.config.manaToggle and 
        UnitPower("player") / UnitPowerMax("player") < aura_env.config.manaThreshold / 100 then
            return nil
        end
        -- check for spec specific enable
        if (aura_env.mySpec == 1 and aura_env.config.spec1) or
        (aura_env.mySpec == 2 and aura_env.config.spec2) or
        (aura_env.mySpec == 3 and aura_env.config.spec3) then
            UseEquipmentSet("T7")
        end
    end
end