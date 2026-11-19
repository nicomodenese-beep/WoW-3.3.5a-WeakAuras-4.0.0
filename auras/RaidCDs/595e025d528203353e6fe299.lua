function(event, ...)
    if event == "OPTIONS" or event == "ON_LOADED" or (aura_env.loaded and not event == "COMBAT_LOG_EVENT_UNFILTERED") then
        aura_env.debug("notification1", event, "Timestamp", date(), "args", ...)
    end
    if event == "OPTIONS" then
        if WeakAuras.IsOptionsOpen() and aura_env.loaded then
            aura_env.SaveLastSession()
            aura_env.loaded = false
        end
        aura_env.LoadLastSession()
        return true
    elseif event == "ON_LOADED" then -- dummy event getting triggered when aura loads (order from triggerorder)
        if UnitIsConnected("player") then -- World is loaded
            aura_env.LoadLastSession()
            aura_env.loaded = true
            aura_env.debug("success", "aura loaded")
            aura_env.updateRoster()
            return true
        else -- On logging in let the world load
            C_Timer.After(2, function()
                    WeakAuras.ScanEvents("ON_LOADED")
            end)
        end
    elseif aura_env.loaded then -- AURA LOADED
        if event == "RAID_COOLDOWNS" then
            local subEvent, subEventSpecifier = ...
            if subEvent == "UPDATE_ROSTER" then
                aura_env.debug("warning", "RAID_COOLDOWNS UPDATE_ROSTER")
                aura_env.updateRoster()
            elseif subEvent == "UPDATE_ROSTER_PET" then
                aura_env.debug("warning", "RAID_COOLDOWNS UPDATE_ROSTER_PET", "unit", subEventSpecifier)
                aura_env.updateRosterPet(subEventSpecifier)
            elseif subEvent == "START_TRACKING" then
                if subEventSpecifier == "PROF_VOLATILE" or subEventSpecifier == "PROF_GASEOUS" or
                subEventSpecifier == "ICEHOWL_BREATH" or subEventSpecifier == "FESTERGUT_VACCINATION" or
                subEventSpecifier == "RAID_EXTERNALS" or subEventSpecifier == "RAID_INTERRUPTS" or
                subEventSpecifier == "RAID_STUNS" then
                    -- WeakAuras.ScanEvents("RAID_COOLDOWNS","PROF_VOLATILE","Ohfknrly",cloneId,region)
                    aura_env.SendWARequest(select(2, ...))
                end
            elseif subEvent == "STOP_TRACKING" then
                aura_env.StopWARequest(select(2, ...))
            elseif subEvent == "RAID_ROLES" then
                aura_env.SendWARequest(select(1, ...))
            end
        elseif event == "PLAYER_LEAVING_WORLD" then
            aura_env.SaveLastSession()
        elseif event == "GROUP_ROSTER_UPDATE" then
            aura_env.updateRoster()
        elseif event == "UNIT_PET" then
            local unit = ...
            aura_env.updateRosterPet(unit)
        elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
            local timestamp, subEvent, srcGUID, srcName, srcFlg, dstGUID,
            dstName, dstFlg, spellID, spellName, spellRank = ...
            if subEvent == "SPELL_CAST_SUCCESS" then
                -- handle pets too
                if bit.band(srcFlg or 0, COMBATLOG_OBJECT_TYPE_PET) ~= 0 then
                    srcName = aura_env.getPetOwner[srcName] or srcName
                end
                local _, srcClass = UnitClass(srcName or "")
                if srcClass and aura_env.CDs[srcClass] and aura_env.CDs[srcClass][spellName] and aura_env.roster[srcName] then
                    -- spell should be tracked and src is group / raid member
                    aura_env.updateCD(srcName, srcClass, dstName, spellID, spellName)
                    aura_env.pruneRosterCDs()
                elseif aura_env.CDs["ALL"][spellName] then
                    -- spell should be tracked and src is group / raid member
                    aura_env.updateCD(srcName, "ALL", dstName, spellID, spellName)
                    aura_env.pruneRosterCDs()
                end
            elseif subEvent == "SPELL_AURA_APPLIED" then
                if aura_env.roster[dstName] then
                    -- defender, forbearance
                    if spellName == GetSpellInfo(66233) or spellName == GetSpellInfo(25771) then
                        -- 1739192794.171 SPELL_AURA_APPLIED 0x00000000006E99D8 Acendra 1298 0x00000000007EDDED Ohfknrly 1297 25771 Forbearance 2 DEBUFF
                        aura_env.updateCD(dstName, select(2, UnitClass(dstName)), nil, spellID, spellName, 120)
                        aura_env.pruneRosterCDs()
                    end
                end
            elseif subEvent == "SPELL_AURA_REMOVED" then
                if aura_env.roster[srcName] then
                    -- Tricks, MD, Feign Death
                    if spellName == GetSpellInfo(57934) or spellName == GetSpellInfo(34477) or spellName == GetSpellInfo(5384) then
                        -- target for tricks and MD is determined by original cast
                        --aura_env.updateCD(dstName, select(2, UnitClass(dstName)), nil, spellID, spellName)
                        --aura_env.pruneRosterCDs()
                    end
                end
            end
        elseif event == "UNIT_HEALTH" then -- also triggers on player logging out and in
            local unit = ...
            local unitName = unit and UnitName(unit)
            if aura_env.roster and aura_env.roster[unitName] then
                aura_env.updateStatus(unitName, UnitIsDeadOrGhost(unit) or false, UnitIsConnected(unit) and true or false)
            end
        elseif event == "CHAT_MSG_ADDON" then -- read BLT glyph information
            local prefix, msg, _, sender = ...
            if prefix ~= "BLT" then return end
            local arg1, arg2 = strsplit(":", msg)
            if arg1 == "Glyphs" then
                aura_env.handleGlyphInfo(sender, arg2)
                if not UnitIsUnit("player", sender) and not UnitAffectingCombat("player") then aura_env.TalentQuery(sender) end
            end
        end
    end
end