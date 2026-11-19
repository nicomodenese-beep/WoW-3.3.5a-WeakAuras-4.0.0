function(allstates, event, tarName, data, ...)
    if (event == "PROF_VOLATILE" or event == "PROF_GASEOUS") and tarName then
        if not allstates then allstates = {} end
        
        -- get parent data
        local anchorId, anchorTo = ...
        aura_env.debug("success", "triggered", "event", event, "anchorId", anchorId, "data", data)
        
        -- remove all icons not needed anymore
        for _, state in pairs(allstates) do
            -- clone which sent data
            if state.anchorId == anchorId then
                -- check if current state is still included in data
                if not data[state.unitName] or not data[state.unitName].spells[state.spellName] then
                    state.show = false
                    state.changed = true
                end
            end
        end
        
        -- create new icons and update from data
        if data then
            --------------------------------------------------------------------
            -- manually add forbearance timer to bops and bubbles
            --------------------------------------------------------------------
            local forbearanceExpTime = data[tarName] and data[tarName]["spells"][GetSpellInfo(25771)].expTime or GetTime()
            if forbearanceExpTime > GetTime() then
                for unitName, unitData in pairs(data) do
                    for spellName, spellData in pairs(unitData.spells) do
                        if spellName == GetSpellInfo(642) or spellName == GetSpellInfo(10278) then -- Bubble, BOP
                            spellData.expTime = max(spellData.expTime or GetTime(), forbearanceExpTime)
                        end
                    end
                end
            end
            --------------------------------------------------------------------
            
            
            local anchorSelfIndex, anchorExtIndex = 1, 1
            for unitName, unitData in pairs(data) do
                for spellName, spellData in pairs(unitData.spells) do
                    -- convert expiration time to always show a number (expTime = GetTime() if ready)
                    local expTime = spellData.expTime or GetTime()
                    if not allstates[anchorId..unitName..spellName] then
                        -- clone does not exist yet -> create new one
                        local isForbearance = spellName == GetSpellInfo(25771)
                        local isSelfCd = tarName == unitName
                        -- if target class is no paladin -> handle forbearance as external
                        if isForbearance and unitData.class ~= "PALADIN" then isSelfCd = false end
                        
                        -- only show spells if below chosen cd time or isForbearance
                        if (not isForbearance and expTime < GetTime() + aura_env.config.cdmintime)
                        or (isForbearance and expTime > GetTime()) then
                            allstates[anchorId..unitName..spellName] = {
                                show = not isForbearance or expTime > GetTime(),
                                changed = true,
                                progressType = "timed",
                                expirationTime = expTime,
                                duration = expTime - GetTime(),
                                autoHide = isForbearance,
                                icon = select(3, GetSpellInfo(spellData.spellID)),
                                name = (isSelfCd or isForbearance) and "" or unitName, -- only show name for externals
                                
                                tarName = tarName,
                                unitName = unitName,
                                isSelfCd = isSelfCd,
                                isForbearance = isForbearance,
                                spellName = spellName,
                                anchorId = anchorId,
                                anchorTo = anchorTo,
                                anchorIndex = isSelfCd and anchorSelfIndex or anchorExtIndex,
                            }
                            anchorSelfIndex = anchorSelfIndex + (isSelfCd and 1 or 0)
                            anchorExtIndex = anchorExtIndex + (isSelfCd and 0 or 1)
                        end
                    else
                        aura_env.debug("fail", "update clone", "cloneid", anchorId..unitName..spellName, "duration", expTime - GetTime())
                        -- clone already exists -> update data if necessary
                        allstates[anchorId..unitName..spellName].expirationTime = expTime
                        allstates[anchorId..unitName..spellName].duration = expTime - GetTime()
                        allstates[anchorId..unitName..spellName].changed = true
                    end
                end
            end
        end
        
        -- update trigger
        return true
    end
end