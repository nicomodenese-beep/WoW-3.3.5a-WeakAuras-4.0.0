function(allstates, event, tarName, data)
    -- dummy trigger to start tracking
    if event == "DUMMY_TRIGGER" then
        WeakAuras.ScanEvents("RAID_COOLDOWNS","START_TRACKING","RAID_EXTERNALS","nil") 
    end
    
    if not event == "RAID_EXTERNALS" or not data then return end
    
    for stateName, state in pairs(allstates) do
        if not data[stateName] then
            state.show = false
            state.changed = true
        end
    end
    
    
    for unitName, unitData in pairs(data) do
        for spellName, spellData in pairs(unitData.spells) do
            if not allstates[unitName] then
                allstates[unitName] = {
                    show = true,
                    changed = true,
                    progressType = "timed",
                    expirationTime = spellData.expTime or GetTime(),
                    duration = (spellData.expTime or GetTime()) - GetTime(),
                    activeEnd = GetTime(),
                    autoHide = false,
                    icon = select(3, GetSpellInfo(spellData.spellID)),
                    srcName = unitName,
                    dstName = spellData.dstName or "",
                }
            elseif allstates[unitName].expirationTime ~= spellData.expTime then
                allstates[unitName].changed = true
                allstates[unitName].expirationTime = spellData.expTime or GetTime()
                allstates[unitName].duration = (spellData.expTime or GetTime()) - GetTime()
                allstates[unitName].activeEnd = GetTime()
                allstates[unitName].dstName = spellData.dstName
                
                if spellData.expTime then -- expTime = false shouldnt cause activeEnd to be updated
                    if spellData.spellID == 10060 then
                        -- PI
                        allstates[unitName].activeEnd = GetTime() + 15
                    elseif spellData.spellID == 49016 then
                        -- Hysteria
                        allstates[unitName].activeEnd = GetTime() + 30
                    elseif spellData.spellID == 57934 then
                        -- Tricks
                        allstates[unitName].activeEnd = GetTime() + 10
                    end
                end
            end
        end
    end
    
    
    
    return true
end