function(allstates, event, ...)
    local ValkyrsGrabWidget = aura_env
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, subEvent,_,_,_,_,_,_, spellID = ...
        if subEvent == "SPELL_SUMMON" and spellID == 69037 then
            if GetTime() - ValkyrsGrabWidget.lastSummon < 10 then 
                ValkyrsGrabWidget.threshold = ValkyrsGrabWidget.threshold + 1
                ValkyrsGrabWidget.lastSummon = GetTime()
            return end
            local update = false
            for _, state in pairs(allstates) do
                update = true
                state.show = false
                state.changed = true
            end
            ValkyrsGrabWidget.ExitScan = false
            ValkyrsGrabWidget.mark = 2
            ValkyrsGrabWidget.threshold = 3
            ValkyrsGrabWidget.grab = {}
            ValkyrsGrabWidget.lastSummon = GetTime()
            ValkyrsGrabWidget.StartScanEntered()
            return update
        end     
    elseif event == "VALKYRS_GRABBED_WIDGET" then
        local subEvent = ...
        if subEvent == "SCAN_ENTERED" then
            if ( ValkyrsGrabWidget.mark < ValkyrsGrabWidget.threshold ) and ( GetTime() - ValkyrsGrabWidget.lastSummon < 5 ) then
                local update = false
                for unit in WA_IterateGroupMembers() do
                    if ValkyrsGrabWidget.mark < 5 and UnitInVehicle(unit) and not ValkyrsGrabWidget.grab[unit] then
                        local unitName = UnitName(unit)
                        ValkyrsGrabWidget.grab[unit] = true
                        if not allstates[ValkyrsGrabWidget.mark] then
                            allstates[ValkyrsGrabWidget.mark] = {
                                show = true,
                                changed = true,
                                progressType = "static",
                                value = 100,
                                total = 100,
                                autoHide = false,
                                unitName = unitName,
                                name = WA_ClassColorName(unitName),
                                targeticon = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..ValkyrsGrabWidget.mark..":16|t",
                                icon = "", 
                                index = ValkyrsGrabWidget.mark,
                            }
                            ValkyrsGrabWidget.mark = ValkyrsGrabWidget.mark + 1
                            if not ValkyrsGrabWidget.ExitScan then
                                ValkyrsGrabWidget.StartScanExited()
                                ValkyrsGrabWidget.ExitScan = true
                            end
                            update = true
                        end
                    end
                end
                ValkyrsGrabWidget.StartScanEntered()
                return update
            end
        elseif subEvent == "SCAN_EXITED" then
            local update, stopTimer = false, true
            aura_env.CheckHP()
            for _, state in pairs(allstates) do
                if not UnitInVehicle(state.unitName) then
                    state.show = false
                    state.changed = true
                    update = true
                elseif stopTimer then 
                    stopTimer = false
                end
            end
            
            if not stopTimer then
                ValkyrsGrabWidget.StartScanExited()
            end 
            return update
        elseif subEvent == "HP_SCAN" then
            local _, value, raidTI, isStunned, icon = ...
            if value and raidTI then
                if allstates[raidTI] then
                    local state = allstates[raidTI]
                    state.changed = true
                    state.value = value
                    state.isStunned = isStunned
                    state.icon = icon
                    return true
                end
            end
        end
    elseif event == "OPTIONS" then
        ValkyrsGrabWidget.mark = 2
        local testNames = { 
            ["|cFFF48CBACheeta|r"] = 80, 
            ["|cFFFFFFFFEmpress|r"] = 60, 
            ["|cFF8788EEMerfin|r"]  = 100}
        for unitName, value in pairs(testNames) do
            local icon, stunned
            if ValkyrsGrabWidget.mark == 2 then
                icon = "Interface\\Icons\\Spell_Holy_SealOfMight"
                stunned = true
            end
            allstates[ValkyrsGrabWidget.mark] = {
                show = true,
                changed = true,
                progressType = "static",
                value = value,
                total = 100,
                autoHide = false,
                name = unitName,
                icon = icon,
                isStunned = stunned,
                targeticon = "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..ValkyrsGrabWidget.mark..":16|t",
                index = ValkyrsGrabWidget.mark,
            }
            ValkyrsGrabWidget.mark = ValkyrsGrabWidget.mark + 1
        end
    end  
end