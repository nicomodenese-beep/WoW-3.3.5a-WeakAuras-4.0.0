--TRIX_TRACKER_UNLOAD CLEU:SPELL_CAST_SUCCESS:SPELL_AURA_APPLIED:SPELL_AURA_REMOVED:UNIT_DIED:SWING_DAMAGE:RANGE_DAMAGE:SPELL_DAMAGE:SPELL_PERIODIC_DAMAGE PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED ACTIVE_TALENT_GROUP_CHANGED TRIX_TRACKER_LOAD
function(allstates, event, timestamp, subEvent, ...)
    if not aura_env.LOADED and event ~= "TRIX_TRACKER_LOAD" and event ~= "OPTIONS" then
        -- not loaded yet, ignore all events except load
        return false
    end
    -- localize print function to turn off debug prints easily
    local print = aura_env.dprint
    
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellID = ...
        -- filter for tricks ids and active threat / damage tracking
        local trixBuff = spellID == aura_env.preID or spellID == aura_env.threatID or spellID == aura_env.dmgID
        -- damage event of threat redirecting rogue
        local activeThreatDmg = aura_env.activeThreat[srcName] and true or false
        -- damage event of target with active trix
        local activeDmgGain = aura_env.activeTrix[srcName] and true or false
        -- suppression buff
        local suppressionBuff = aura_env.suppressionBuffs[spellID] or subEvent == "UNIT_DIED"
        if not (trixBuff or activeThreatDmg or activeDmgGain or suppressionBuff) then
            return false
        end
        
        aura_env.TryInitCleuOffset(timestamp)
        -- -- overwrite timestamp with GetTime() for better accuracy (syncs all events)
        -- timestamp = GetTime()
        
        -- apply logic
        local changedState = false
        if subEvent == "SPELL_CAST_SUCCESS" and spellID == aura_env.preID then
            -- trix cast, setup new state
            -- create history for src if not exists
            if not aura_env.history[srcName] then
                aura_env.history[srcName] = {}
            end
            -- insert new trix event into history
            local newTrixEvent = aura_env.CreateNewTrixEvent(timestamp, srcName, dstName, spellID)
            table.insert(aura_env.history[srcName], newTrixEvent)
            
            local timeText = aura_env.FormatEventTime(newTrixEvent.castTimestamp, aura_env.combatSessionPulls[newTrixEvent.combatSession])
            -- glyph symbol if already available
            local srcGlyph = aura_env.history[srcName] and aura_env.history[srcName].duration and aura_env.history[srcName].duration < 9 and "|cFFFF0000!|r" or ""
            allstates[newTrixEvent.key] = {
                show = true,
                changed = true,
                progressType = "timed",
                duration = 30,
                autoHide = false,
                srcName = aura_env.colorizeTextByClass(srcName, "ROGUE"),
                srcGlyph = srcGlyph,
                dstName = aura_env.colorizeTextByClass(dstName, newTrixEvent.dstClass),
                srcClass = "ROGUE",
                dstClass = newTrixEvent.dstClass,
                spellID = spellID,
                index = timestamp, -- sorting index
                
                dmgBuffActive = false,
                dmgUptime = nil,
                threatTargetIsTank = newTrixEvent.threatTargetIsTank,
                timeText = timeText,
                threatText = " PENDING",
                dstIsTankText = newTrixEvent.threatTargetIsTank and "(T) " or "",
                dmgGainText = "",
                extraText = "",
            }
            
            -- Limit visible events globally; 0 keeps the existing unlimited behavior.
            local maxEvents = math.floor(tonumber(aura_env.config and aura_env.config.maxEvents) or 0)
            if maxEvents > 0 then
                local visibleEvents = {}
                for _, historyList in pairs(aura_env.history) do
                    for _, trixEvent in ipairs(historyList) do
                        local state = allstates[trixEvent.key]
                        if state and state.show then
                            visibleEvents[#visibleEvents + 1] = trixEvent
                        end
                    end
                end
                table.sort(visibleEvents, function(a, b)
                    if a.castTimestamp == b.castTimestamp then
                        return a.key < b.key
                    end
                    return a.castTimestamp < b.castTimestamp
                end)
                for i = 1, #visibleEvents - maxEvents do
                    local state = allstates[visibleEvents[i].key]
                    -- WeakAuras removes the clone when show=false and changed=true.
                    -- Keep history intact so active buffs and unique event keys still work.
                    state.show = false
                    state.changed = true
                end
            end
            
            --print("New Trix event:", srcName, "->", dstName, "at", timeText)
            --print("Current Trix history for", srcName .. ":", #aura_env.history[srcName], "events")
            --print("combatSession:", aura_env.combatSession, "inCombat:", aura_env.inCombat, "pullStart:", aura_env.pullStart)
            return true
        elseif subEvent == "SPELL_AURA_APPLIED" then
            -- trix buff applied, update state
            -- pre is always happening in parallel with cast success event
            
            if spellID == aura_env.threatID then
                -- applied threat buff
                changedState, trixEvent = aura_env.TouchLatestTrixEvent(allstates, srcName, "threatAppliedTimestamp", timestamp)
                -- add to active threat list for threat tracking
                aura_env.activeThreat[srcName] = trixEvent
                return changedState
            elseif spellID == aura_env.dmgID then
                -- applied dmg buff
                changedState = aura_env.OnDmgApplied(allstates, srcName, dstName, timestamp)
                -- trix applied counts as suppression event if two or more rogues
                return aura_env.OnSuppressionBuffApplied(allstates, spellID, dstName, timestamp) or changedState
            else
                -- check for suppression buffs
                return aura_env.OnSuppressionBuffApplied(allstates, spellID, dstName, timestamp)
            end
        elseif subEvent == "SPELL_AURA_REMOVED" then
            -- trix buff removed, update state
            if spellID == aura_env.preID then
                -- remove pre buff
                changedState, trixEvent = aura_env.TouchLatestTrixEvent(allstates, srcName, "preRemovedTimestamp", timestamp)
                -- check for suppression buffs on dst
                local suppressionBuff = aura_env.UnitHasSuppressionBuff(aura_env.FindUnitByName(trixEvent.dstName))
                -- recheck if target is tank (important for early prepull trix)
                if trixEvent then 
                    trixEvent.suppressionBuff = suppressionBuff
                    trixEvent.threatTargetIsTank = aura_env.IsTank(trixEvent.dstName)
                    changedState = aura_env.UpdateStateInfo(allstates, trixEvent) or changedState -- redraw if suppression buff
                end
                return changedState
            elseif spellID == aura_env.threatID then
                -- remove threat buff
                changedState, trixEvent = aura_env.TouchLatestTrixEvent(allstates, srcName, "threatRemovedTimestamp", timestamp)
                -- remove active threat from list
                aura_env.activeThreat[srcName] = nil
                return changedState
            elseif spellID == aura_env.dmgID then
                -- remove dmg buff
                changedState, trixEvent = aura_env.TouchLatestTrixEvent(allstates, srcName, "dmgRemovedTimestamp", timestamp)
                -- remove active trix from list
                aura_env.activeTrix[dstName] = nil
                -- check for suppression buffs on dst
                if trixEvent and trixEvent.dmgAppliedTimestamp then
                    aura_env.recentDmgRemovedByDst[dstName] = { ev = trixEvent, ts = timestamp }
                end
                aura_env.CleanupRecentRemoved(timestamp)
                return changedState
            end
        elseif subEvent == "UNIT_DIED" then
            if dstName then return aura_env.TryResolveRecentRemoval(allstates, dstName, "†", timestamp) end
            return false
        elseif subEvent == "SWING_DAMAGE" or subEvent == "SPELL_DAMAGE" or subEvent == "SPELL_PERIODIC_DAMAGE" or subEvent == "RANGE_DAMAGE" then
            -- damage hit, allocate to correct event (threat redirect and/or dmg gain)
            local dmg = subEvent == "SWING_DAMAGE" and select(7, ...) or select(10, ...)
            
            changedState = aura_env.OnThreatRedirect(allstates, aura_env.activeThreat[srcName], dmg) or changedState
            changedState = aura_env.OnDmgGain(allstates, aura_env.activeTrix[srcName], dmg) or changedState
            
            return changedState
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        --print("entering combat, starting new combat session", aura_env.combatSession + 1)
        aura_env.inCombat = true
        aura_env.pullStart = aura_env.NowCLEU()
        aura_env.combatSession = (aura_env.combatSession or 0) + 1
        aura_env.combatSessionPulls[aura_env.combatSession] = aura_env.pullStart
        
        -- Optional: alle bereits angezeigten pre-combat States sofort auf "relativ" umstellen
        -- (falls du die Zeit als Text im State führst, siehe unten)
        for _, historyList in pairs(aura_env.history) do
            for _, ev in ipairs(historyList) do
                if allstates[ev.key] and ev.combatSession == aura_env.combatSession then
                    aura_env.UpdateStateInfo(allstates, ev)
                end
            end
        end
        return true
    elseif event == "PLAYER_REGEN_ENABLED" then
        --print("leaving combat, ending combat session", aura_env.combatSession)
        aura_env.inCombat = false
        aura_env.pullStart = nil
        
        -- Alles als "abgeschlossen" markieren, damit nix in den nächsten Combat reinblutet
        aura_env.activeTrix = {}
        aura_env.activeThreat = {}
        
        -- Optional: States autohiden/abschließen
        for _, historyList in pairs(aura_env.history) do
            for _, ev in ipairs(historyList) do
                if allstates[ev.key] and allstates[ev.key].progressType ~= "timed" then
                    local st = allstates[ev.key]
                    st.changed = true
                    st.autoHide = true
                    -- kurze Restzeit, damit's sauber verschwindet
                    st.progressType = "timed"
                    st.duration = 30
                    st.expirationTime = GetTime() + 30
                end
            end
        end
        return true
    elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
        aura_env.UpdateMySpecCache()
        return false
    elseif event == "TRIX_TRACKER_UNLOAD" then
        -- manually unload if WA was opened (event never triggers except on load)
        aura_env.LOADED = false
        aura_env.resetHistory()
    elseif event == "TRIX_TRACKER_LOAD" then
        -- TSA fires all triggers on load without arguments in listed order, so this is used to prevent errors
        aura_env.UpdateMySpecCache()
        if aura_env.spec.primaryName then -- Spec is loaded
            aura_env.LOADED = true
        else -- On logging in let the world load
            print("World not loaded yet, delaying Trix Tracker load")
            C_Timer.After(2, function()
                    WeakAuras.ScanEvents("TRIX_TRACKER_LOAD")
            end)
        end
        return false
    elseif event == "OPTIONS" then
        allstates[1] = {
            show = true,
            changed = true,
            progressType = "timed",
            duration = 30,
            autoHide = false,
            srcName = aura_env.colorizeTextByClass("Swopf", "ROGUE"),
            dstName = aura_env.colorizeTextByClass("Draintrain", "WARLOCK"),
            srcClass = "ROGUE",
            srcGlyph = "",
            dstClass = "WARLOCK",
            spellID = 57934,
            index = 1,
            
            dmgUptime = 1.0,
            timeText = "00:01",
            dstIsTankText = "",
            threatText = " 12.0k["..aura_env.ColorizeBy01("4.0s", 4/10, 1).."]",
            dmgGainText = " +24k",
            extraText = "",
        }
        allstates[2] = {
            show = true,
            changed = true,
            progressType = "timed",
            duration = 30,
            autoHide = false,
            srcName = aura_env.colorizeTextByClass("Swopf", "ROGUE"),
            dstName = aura_env.colorizeTextByClass("Drainyo", "WARRIOR"),
            srcClass = "ROGUE",
            srcGlyph = "|cFFFF0000!|r",
            dstClass = "WARRIOR",
            spellID = 57934,
            index = 2,
            
            dmgUptime = 0.25,
            timeText = "00:45",
            dstIsTankText = "(T) ",
            threatText = " 239.0k["..aura_env.ColorizeBy01("10.0s", 1).."]",
            dmgGainText = " +12k",
            extraText = "["..aura_env.ColorizeBy01("1.5s", 0.25).."] (Hyst)",
        }
        allstates[3] = {
            show = true,
            changed = true,
            progressType = "timed",
            duration = 30,
            autoHide = false,
            srcName = "source",
            dstName = "target",
            srcClass = "ROGUE",
            srcGlyph = "",
            dstClass = "WARRIOR",
            spellID = 57934,
            index = 0,
            
            dmgUptime = 0.5,
            timeText = "time",
            dstIsTankText = "(isTank) ",
            threatText = " threat[uptime]",
            dmgGainText = " +dmgGain",
            extraText = "[uptime] (reason)",
        }
        return true
    end
end



