function(allstates, event, unitName, data, anchorTo)
    if event == "SUPPORT_NECKS_ICONS" and unitName then
        if not allstates then allstates = {} end
        
        -- remove all icons not needed anymore
        for _, state in pairs(allstates) do
            -- clone which sent data
            if state.unitName == unitName then
                -- check if current state is still included in data
                if not data or not data[state.neckID] then
                    state.show = false
                    state.changed = true
                end
            end
        end
        
        -- save all region anchors in case new icon is generated
        if anchorTo then aura_env.anchors[unitName] = anchorTo end
        -- create new icons and update from data
        if data then
            local anchorIndexTable = aura_env.getSortedAnchorIndexTable(data)
            --aura_env.debug("notification1", "anchor", "data", data, "anchorIndexTable", anchorIndexTable)
            for neckID, neckData in pairs(data) do
                if type(neckID) == "number" then
                    -- ignore equipping cooldown
                    local recentlyEquippedCD = neckData.duration <= 30
                    if not allstates[unitName..neckID] then
                        -- clone does not exist yet -> create new one
                        allstates[unitName..neckID] = {
                            show = true,
                            changed = true,
                            progressType = "timed",
                            -- disregard equipment cd of 30 seconds
                            expirationTime = recentlyEquippedCD and 0 or (neckData.startTime + neckData.duration),
                            duration = recentlyEquippedCD and 0 or neckData.duration,
                            autoHide = false,
                            icon = aura_env.neckIcons[neckID],
                            
                            unitName = unitName,
                            neckID = neckID,
                            charges = neckData.charges,
                            isEquipped = data.currentNeck.id == neckID,
                            OmniCC = aura_env.OmniCC,
                            anchorTo = aura_env.anchors[unitName],
                            anchorIndex = anchorIndexTable[neckID],
                        }
                    else
                        -- hack solution for repositioning (hide and show)
                        if allstates[unitName..neckID].anchorIndex ~= anchorIndexTable[neckID] then
                            allstates[unitName..neckID].show = false
                            WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, .1, "SUPPORT_NECKS_ICONS", unitName, data, aura_env.anchors[unitName])
                        end
                        
                        -- clone already exists -> update data if necessary
                        allstates[unitName..neckID].expirationTime = recentlyEquippedCD and 0 or (neckData.startTime + neckData.duration)
                        allstates[unitName..neckID].duration = recentlyEquippedCD and 0 or neckData.duration
                        allstates[unitName..neckID].charges = neckData.charges
                        allstates[unitName..neckID].isEquipped = data.currentNeck.id == neckID
                        allstates[unitName..neckID].anchorIndex = anchorIndexTable[neckID]
                        allstates[unitName..neckID].changed = true
                    end
                end
            end
        end
        
        -- update trigger
        return true
    end
end