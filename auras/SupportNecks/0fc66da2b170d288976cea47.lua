function(allstates, event, ...)
    if event == "OPTIONS" then
        if WeakAuras.IsOptionsOpen() and aura_env.loaded then
            --aura_env.SaveLastSession()
            aura_env.loaded = false
            --aura_env.versionControl = {}
        end
        --aura_env.LoadLastSession()
    elseif event == "SN_ON_LOADED" then -- dummy event getting triggered when aura loads (order from triggerorder)
        if UnitIsConnected("player") then -- World is loaded
            --aura_env.LoadLastSession()
            aura_env.loaded = true
            aura_env.checkSpec()
            aura_env.checkNecks()
            if UnitInRaid("player") then
                aura_env.SendVersion(UnitName("player"))
                aura_env.RequestVersion()
                aura_env.RequestNeckInfos()
            end
        else -- On logging in let the world load
            C_Timer.After(5, function()
                    WeakAuras.ScanEvents("SN_ON_LOADED")
            end)
        end
    elseif aura_env.loaded then -- AURA LOADED
        if event == "SUPPORT_NECKS" then
            local subEvent, subEventArg1, subEventArg2 = ...
            if subEvent == "SN_BAG_UPDATE" then
                aura_env.BAG_UPDATE_EVENT = nil
                aura_env.checkNecks()
            elseif subEvent == "SN_DUEL_FINISHED" then
                aura_env.checkNecks()
            elseif subEvent == "RETRY_NECK_EQUIP" then
                if aura_env.scheduledNeckID then
                    aura_env.retryTimer = nil
                    aura_env.retryEquipNeck()
                end
            elseif subEvent == "IGNORE" then
                aura_env.ignoreThisSession[subEventArg1] = true
                print("SN: Ignoring " .. WA_ClassColorName(subEventArg1) .. " this session!")
                return aura_env.updateGUI(allstates)
            elseif subEvent == "RESET_IGNORE" then
                aura_env.ignoreThisSession = {}
                return aura_env.updateGUI(allstates)
            elseif subEvent == "CHECK_NECKS" then
                aura_env.checkNecks()
            elseif subEvent == "UPDATE_GUI" then
                return aura_env.updateGUI(allstates)
            elseif subEvent == "REQUEST_EQUIP" then
                -- WeakAuras.ScanEvents("SUPPORT_NECKS", "REQUEST_EQUIP", 24114, "Paraxis")
                aura_env.SendEquipCommand(subEventArg1, subEventArg2)
            end
        elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
            local timestamp, subEvent, _, srcName, _, _, dstName, _, spellID = ...
            -- only watch for neck spell ids
            if not aura_env.neckSpellIDs[spellID] then return end
            --print(subEvent .. ": " .. srcName .. " -> " .. dstName .. " (" .. spellID .. ")")
            -- only check auras affecting player
            if dstName ~= UnitName("player") then return end
            if srcName == UnitName("player") then
                -- source is player -> update info and send to raid
                -- delay to allow charges to change
                WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, .1, "SUPPORT_NECKS", "CHECK_NECKS")
            elseif not aura_env.versionControl[srcName] then
                -- source is other unit and doesnt have WA
                if subEvent == "SPELL_AURA_REMOVED" then
                    aura_env.ReceiveCancelInfo(srcName)
                else
                    local _, _, _, _, _, duration, expirationTime = WA_GetUnitBuff("player", spellID)
                    local info = GetTime() .. "_1_" .. aura_env.neckSpellIDs[spellID] .. "_1_" .. expirationTime - duration .. "_" .. duration
                    aura_env.ReceiveNeckInfo(info, srcName)
                end
            end
        elseif event == "PLAYER_EQUIPMENT_CHANGED" and ... == 2 then -- neck changed
            -- for k, v in pairs(aura_env.necks) do
            --     if IsEquippedItem(k) then
            --         print(GetItemInfo(k) .. " is equipped")
            --         --aura_env.checkCurrentNeckCharge()
            --     end
            -- end
            aura_env.checkNecks()
        elseif event == "BAG_UPDATE" then -- fires extremely often and results in errors when checking ItemCounts
            if not aura_env.BAG_UPDATE_EVENT then
                aura_env.BAG_UPDATE_EVENT = true
                WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, .1, "SUPPORT_NECKS", "SN_BAG_UPDATE")
            end
        elseif event == "DUEL_FINISHED" then
            WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, .1, "SUPPORT_NECKS", "SN_DUEL_FINISHED")
        elseif event == "RAID_ROSTER_UPDATE" then
            --print("RaidRosterUpdate")
            if UnitInRaid("player") and not aura_env.inRaid then
                aura_env.SendVersion()
                aura_env.RequestVersion()
                aura_env.SendNeckInfos()
                aura_env.RequestNeckInfos()
                aura_env.inRaid = true
            elseif UnitInRaid("player") then
                -- update on player leaving or logging out
                --return aura_env.updateGUI(allstates)
                WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, .1, "SUPPORT_NECKS", "UPDATE_GUI")
            elseif not UnitInRaid("player") then
                aura_env.inRaid = false
                aura_env.roster = {}
                aura_env.versionControl = {}
                aura_env.ignoreThisSession = {}
                return aura_env.updateGUI(allstates)
            end
        elseif event == "PLAYER_REGEN_ENABLED" then
            if aura_env.scheduledNeckID then
                aura_env.retryEquipNeck()
            end
        elseif event == "INSPECT_TALENT_READY" then
            if not aura_env.currentSpec then
                aura_env.checkSpec()
            end
        elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
            aura_env.checkSpec()
            -- if UnitInRaid("player") then
            --     if aura_env.specEnabled then
            --         aura_env.SendNeckInfos()
            --     else
            --         aura_env.SendCancelInfo()
            --     end
            -- end
        elseif event == "CHAT_MSG_ADDON" then -- comms with other users of this WA
            local prefix, msg, channel, sender = ...
            if prefix ~= "SN" then return end
            --if UnitIsUnit("player", sender) then return end
            aura_env.ReceiveComms(msg, sender, channel)
        end
    end
end


-- Chain of the Twilight Owl - 45 crit
-- 24121
-- Braided Eternium Chain - 28 crit
-- 24114
-- Eye of the Night - 34 sp
-- 24116
-- Embrace of the Dawn - 10 all
-- 24117





-- if change gear sent while infight -> wait for next PLAYER_REGEN_ENABLED