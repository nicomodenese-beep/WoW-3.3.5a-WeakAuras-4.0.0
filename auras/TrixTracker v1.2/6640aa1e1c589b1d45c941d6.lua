aura_env.debug = aura_env.config.dprint

aura_env.dprint = aura_env.debug and function(...)
    print("|cFF33FF99Trix|r", ...)
end or function() end
local print = aura_env.dprint

-- events happening:
-- SPELL_CAST_SUCCESS rogue -> target, prebuff
-- SPELL_AURA_APPLIED rogue -> rogue, prebuff
-- time till meleehit
-- SPELL_AURA_REMOVED rogue -> rogue, prebuff
-- SPELL_AURA_APPLIED rogue -> target, dmgbuff - can also be SPELL_AURA_REFRESH
-- SPELL_AURA_APPLIED rogue -> rogue, threatbuff
-- time till cancel / fade
-- SPELL_AURA_REMOVED rogue -> rogue, threatbuff
-- time if canceled or same as previous
-- SPELL_AURA_REMOVED rogue -> target, dmgbuff

aura_env.LOADED = false

aura_env.preID = 57934
aura_env.threatID = 59628
aura_env.dmgID = 57933

aura_env.me = UnitName("player")

aura_env.pullStart = nil          -- time() beim Combat-Enter
aura_env.combatSession = 0        -- zählt Pulls hoch, damit nichts „über den Combat hinaus“ verrechnet wird
aura_env.inCombat = false
aura_env.combatSessionPulls = {}

aura_env.activeTrix = {}
aura_env.activeThreat = {}

aura_env.history = {}
function aura_env.resetHistory()
    aura_env.history = {}
end

aura_env.recentDmgRemovedByDst = {}
aura_env.SUPP_WINDOW = 0.5         -- Sekunden: max Abstand dmgRemoved -> suppression APPLIED

aura_env.cleuOffset = nil          -- GetTime() - cleuTimestamp
aura_env.cleuOffsetSession = 0     -- zu welcher combatSession der Offset gehört

aura_env.suppressionBuffs = {
    [31884] = "Wings", -- Avenging Wrath
    [12292] = "DW", -- Deathwish
    [12042] = "AP", -- Arcane Power
    [49016] = "Hyst", -- Hysteria
    [57933] = "Trix", -- Tricks of the Trade (other rogue)
}

aura_env.TankAuras = {
    [48263] = true, -- Frost Presence
    [25780] = true, -- Righteous Fury
    [5487] = true, -- Bear Form
    [9634] = true, -- Dire Bear Form
}

aura_env.TankClasses = {
    ['DRUID'] = true,
    ['PALADIN'] = true,
    ['DEATHKNIGHT'] = true,
    ['WARRIOR'] = true,
}

aura_env.spec = {}

function aura_env.UpdateMySpecCache()
    local class = select(2, UnitClass("player"))
    
    -- Dualspec: aktive Gruppe (1 oder 2), falls nicht vorhanden => 1
    local activeGroup = (GetActiveTalentGroup and GetActiveTalentGroup()) or 1
    
    local numTabs = GetNumTalentTabs and GetNumTalentTabs() or 0
    local bestTab, bestPoints, bestName = nil, -1, nil
    
    for tab = 1, numTabs do
        -- WotLK API: (tabIndex, isInspect, isPet, talentGroup)
        local name, _, pointsSpent = GetTalentTabInfo(tab, false, false, activeGroup)
        if pointsSpent and pointsSpent > bestPoints then
            bestPoints = pointsSpent
            bestTab = tab
            bestName = name
        end
    end
    
    aura_env.spec.class = class
    aura_env.spec.activeGroup = activeGroup
    aura_env.spec.primaryTab = bestTab
    aura_env.spec.primaryName = bestName
    aura_env.spec.primaryPoints = bestPoints
    
    -- Optional: Tank-Erkennung (konservativ; Druide Feral ist Tank/Katze => "feral")
    local isTank = false
    if class == "WARRIOR" then
        isTank = (bestTab == 3) -- Arms=1, Fury=2, Prot=3
    elseif class == "PALADIN" then
        isTank = (bestTab == 2) -- Holy=1, Prot=2, Ret=3
    elseif class == "DEATHKNIGHT" then
        isTank = (bestTab == 1) -- Blood=1, Frost=2, Unholy=3 (WotLK-typisch)
    elseif class == "DRUID" then
        isTank = (bestTab == 2) -- Feral (Tank/Katze gemischt)
    end
    aura_env.spec.isTank = isTank
    
    if aura_env.spec.primaryName then
        print("Current Spec:", aura_env.spec.class, aura_env.spec.primaryName, "(Tank:", (aura_env.spec.isTank and "True" or "False") .. ")")
    end
    return aura_env.spec
end

---------------------------------------------------------------------
-- Event handling functions for cast, buff application/removal, damage application and threat changes
---------------------------------------------------------------------

function aura_env.OnDmgApplied(allstates, srcName, dstName, timestamp)
    local changed, latestTrixEvent = aura_env.TouchLatestTrixEvent(allstates, srcName, "dmgAppliedTimestamp", timestamp)
    
    -- track active trix for overwrite handling
    aura_env.activeTrix[dstName] = latestTrixEvent
    
    -- glyph check
    local hasBuff, duration = aura_env.UnitHasBuffSpellID(dstName, aura_env.dmgID)
    if hasBuff and duration then
        aura_env.history[srcName].duration = duration
        changed = aura_env.UpdateSrcGlyph(allstates, srcName) or changed
    end
    
    return changed
end

function aura_env.OnThreatRedirect(allstates, trixEvent, dmg)
    if not trixEvent then return false end
    trixEvent.threatDmg = trixEvent.threatDmg + dmg
    local changed = aura_env.UpdateStateInfo(allstates, trixEvent)
    -- handle sound warning for high threat
    -- check if threshold exceeded and not already warned for this event
    if trixEvent.threatDmg >= aura_env.config.threatDmgThreshold * 1000 and trixEvent.threatTime >= aura_env.config.threatTimeThreshold and not trixEvent.warnedHighThreat then
        -- if target is me and I'm not a tank, play dps warning sound
        if aura_env.config.threatWarningDPS and trixEvent.dstName == aura_env.me and not aura_env.spec.isTank then
            PlaySoundFile("Interface\\Addons\\WeakAuras\\Media\\Sounds\\Drums.ogg", "Master")
            trixEvent.warnedHighThreat = true
        end
        -- if target is not me and not a tank, play tank warning sound
        if aura_env.config.threatWarningTank and not trixEvent.threatTargetIsTank and aura_env.spec.isTank then
            PlaySoundFile("Interface\\Addons\\WeakAuras\\Media\\Sounds\\Drums.ogg", "Master")
            trixEvent.warnedHighThreat = true
        end
    end
    return changed
end
function aura_env.OnDmgGain(allstates, trixEvent, dmg)
    if not trixEvent then return false end
    -- effective damage gain
    trixEvent.dmgGain = trixEvent.dmgGain + dmg * 0.15 / 1.15
    return aura_env.UpdateStateInfo(allstates, trixEvent)
end

function aura_env.TouchLatestTrixEvent(allstates, srcName, field, value)
    local latestTrixEvent = aura_env.GetLatestTrixEvent(srcName)
    if not latestTrixEvent then return false, nil end
    latestTrixEvent[field] = value
    return aura_env.UpdateStateInfo(allstates, latestTrixEvent), latestTrixEvent
end

---------------------------------------------------------------------
-- Utility functions for event history management, buff checks and unit lookups
---------------------------------------------------------------------

function aura_env.GetLatestTrixEvent(srcName)
    local srcHistory = aura_env.history[srcName]
    if not srcHistory or #srcHistory == 0 then return nil end
    return srcHistory[#srcHistory]
end

function aura_env.UnitHasSuppressionBuff(unit)
    if not unit or not UnitExists(unit) then return false end
    for i = 1, 40 do
        local sID = select(11, UnitBuff(unit, i))
        if not sID then break end
        if aura_env.suppressionBuffs[sID] then
            return aura_env.suppressionBuffs[sID]
        end
    end
    
    return false
end

function aura_env.UnitHasBuffSpellID(unit, spellID)
    if not unit or not UnitExists(unit) then return false end
    for i = 1, 40 do
        local name, _, icon, _, _, duration, expirationTime, caster, _, _, sID = UnitBuff(unit, i)
        if not name then break end
        if sID == spellID then
            return true, duration, expirationTime, caster, icon
        end
    end
    
    return false
end

function aura_env.FindUnitByName(name)
    name = name and name:lower()
    if not name then return nil end
    
    -- player/target/focus/mouseover optional
    local candidates = {"player"}
    
    for _, unit in ipairs(candidates) do
        if UnitExists(unit) and UnitName(unit) and UnitName(unit):lower() == name then
            return unit
        end
    end
    
    if IsInRaid() then
        for i = 1, 40 do
            local unit = "raid"..i
            if UnitExists(unit) and UnitName(unit) and UnitName(unit):lower() == name then
                return unit
            end
        end
    elseif IsInGroup() then
        for i = 1, 4 do
            local unit = "party"..i
            if UnitExists(unit) and UnitName(unit) and UnitName(unit):lower() == name then
                return unit
            end
        end
    end
    
    return nil
end

---------------------------------------------------------------------
-- Utility functions for event handling, state updates and formatting
---------------------------------------------------------------------

function aura_env.CreateNewTrixEvent(timestamp, srcName, dstName, spellID)
    return {
        -- relevant timestamps
        castTimestamp = timestamp,
        preRemovedTimestamp = nil,
        threatAppliedTimestamp = nil,
        threatRemovedTimestamp = nil,
        dmgAppliedTimestamp = nil,
        dmgRemovedTimestamp = nil,
        --
        threatDmg = 0,
        threatTime = 0,
        warnedHighThreat = false,
        threatTargetIsTank = aura_env.IsTank(dstName),
        --
        dmgUptime = 0.0, -- relative time between 0 and 1
        dmgGain = 0,
        suppressionBuff = false,
        --
        srcName = srcName,
        srcClass = "ROGUE",
        dstName = dstName,
        dstClass = select(2, UnitClass(dstName)) or "",
        spellID = spellID,
        --
        combatSession = aura_env.combatSession + (aura_env.inCombat and 0 or 1),
        key = srcName .. (#aura_env.history[srcName] + 1), -- unique key for this event, can be used to reference in states
    }
end

function aura_env.UpdateSrcGlyph(allstates, srcName)
    if not allstates or not srcName then return false end
    
    local anyChanged = false
    
    for _, state in pairs(allstates) do
        if state and state.show and state.srcName == aura_env.colorizeTextByClass(srcName, "ROGUE") then
            local dur = aura_env.history[srcName] and aura_env.history[srcName].duration or 10
            local srcGlyph = (dur > 9) and "" or "|cFFFF0000!|r"
            
            if state.srcGlyph ~= srcGlyph then
                state.srcGlyph = srcGlyph
                state.changed = true
                anyChanged = true
            end
        end
    end
    
    return anyChanged
end

local function UpdateStateField(state, k, v)
    if state and state[k] ~= v then
        state[k] = v
        state.changed = true
        return true
    end
    return false
end

function aura_env.UpdateStateInfo(allstates, trixEvent)
    -- %timeText [Icon] %srcGlyph%srcName%threatText > %dstName%dmgGainText %extraText
    -- threatText = " 150k(10.0s)"
    -- dmgGainText = " +34k"
    -- extraText = "[5.6s]" / "EXPIRED" / "CANCEL FAIL"
    
    -- 1:28 [Icon] Swopf > Draintrain EXPIRED
    -- 1:28 [Icon] Swopf > Draintrain CANCEL FAIL
    -- 1:28 [Icon] Swopf 150k(10.0s) > Draintrain +34k
    -- 1:28 [Icon] Swopf 150k(10.0s) > Draintrain SUPPRESSED Hyst
    -- 1:28 [Icon] Swopf 150k(10.0s) > Draintrain +34k [5.6s]
    local anyChanged = false
    if trixEvent and allstates[trixEvent.key] and trixEvent.preRemovedTimestamp then
        local timeText = aura_env.FormatEventTime(trixEvent.preRemovedTimestamp or trixEvent.castTimestamp, aura_env.combatSessionPulls[trixEvent.combatSession])
        local indexTimestamp = trixEvent.preRemovedTimestamp or trixEvent.castTimestamp
        local threatText = ""
        local dstIsTankText = trixEvent.threatTargetIsTank and "(T) " or ""
        local dmgGainText = ""
        local extraText = ""
        local maxUptime = 10.0
        
        -- handle dmg uptime
        local dmgBuffActive = trixEvent.dmgAppliedTimestamp and not trixEvent.dmgRemovedTimestamp
        local trixDmgUptime = trixEvent.dmgUptime
        if not trixEvent.dmgAppliedTimestamp then
            -- no dmg buff applied (yet) -> count as fail for now
            trixDmgUptime = 0.0
            extraText = "|cFFFF0000SUPPRESSED|r"
            extraText = extraText .. (trixEvent.suppressionBuff and " (" .. trixEvent.suppressionBuff .. ")" or "")
        else
            -- dmg buff applied
            if not trixEvent.dmgRemovedTimestamp then
                -- dmg buff still going -> count as full uptime for now
                trixDmgUptime = 1.0
                -- show dmg gain for target
                dmgGainText = " +" .. aura_env.FormatDamage(trixEvent.dmgGain)
            else
                -- dmg buff removed -> calculate uptime
                if aura_env.history[trixEvent.srcName] and aura_env.history[trixEvent.srcName].duration then
                    maxUptime = aura_env.history[trixEvent.srcName].duration
                end
                trixDmgUptime = (trixEvent.dmgRemovedTimestamp - trixEvent.dmgAppliedTimestamp) / maxUptime
                -- show dmg gain and uptime for target
                dmgGainText = string.format(" +%s", aura_env.FormatDamage(trixEvent.dmgGain))
                if trixDmgUptime < 0.98 then
                    extraText = string.format("[%s]", aura_env.ColorizeBy01(aura_env.FormatSeconds(trixEvent.dmgRemovedTimestamp - trixEvent.dmgAppliedTimestamp), trixDmgUptime))
                    extraText = extraText .. (trixEvent.suppressionBuff and " (" .. trixEvent.suppressionBuff .. ")" or "")
                end
            end
        end
        trixEvent.dmgUptime = trixDmgUptime
        
        -- handle threat
        if trixEvent.threatAppliedTimestamp then
            -- threat applied, show duration and threatdmg
            local threatDuration = trixEvent.threatRemovedTimestamp and (trixEvent.threatRemovedTimestamp - trixEvent.threatAppliedTimestamp) or (aura_env.NowCLEU() - trixEvent.threatAppliedTimestamp)
            trixEvent.threatTime = threatDuration
            local threatDurationText = aura_env.ColorizeBy01(aura_env.FormatSeconds(threatDuration), threatDuration / maxUptime, not trixEvent.threatTargetIsTank) -- flip color if target is tank (green = good for tanks, red = bad for dps)
            threatText = string.format(" %s[%s]", aura_env.FormatDamage(trixEvent.threatDmg), threatDurationText)
        elseif trixEvent.preRemovedTimestamp then
            -- prebuff removed but no threat applied, so it was a cancelled / expired
            if trixEvent.preRemovedTimestamp - trixEvent.castTimestamp < 29 then
                extraText = "|cFFFF0000FAIL CANCEL|r"
            else
                extraText = "|cFFFF0000EXPIRED|r"
            end
        end
        
        -- update timeText
        local state = allstates[trixEvent.key]
        anyChanged = UpdateStateField(state, "timeText", timeText) or anyChanged
        -- update indexTimestamp to resort if necessary
        anyChanged = UpdateStateField(state, "index", indexTimestamp) or anyChanged
        -- update threatText
        anyChanged = UpdateStateField(state, "threatText", threatText) or anyChanged
        -- update dstIsTankText
        anyChanged = UpdateStateField(state, "dstIsTankText", dstIsTankText) or anyChanged
        -- update dmgGainText
        anyChanged = UpdateStateField(state, "dmgGainText", dmgGainText) or anyChanged
        -- update extraText
        anyChanged = UpdateStateField(state, "extraText", extraText) or anyChanged
        -- update dmg uptime
        anyChanged = UpdateStateField(state, "dmgUptime", trixDmgUptime) or anyChanged
        -- update dmg buff active
        anyChanged = UpdateStateField(state, "dmgBuffActive", dmgBuffActive) or anyChanged
        -- change to static
        if state.progressType ~= "static" then
            state.progressType = "static"
            state.value = 100
            state.total = 100
            state.changed = true
            anyChanged = true
        end
    end
    return anyChanged
end

---------------------------------------------------------------------
-- Utility functions for suppression buff handling
---------------------------------------------------------------------

function aura_env.CleanupRecentRemoved(nowTs)
    for dst, item in pairs(aura_env.recentDmgRemovedByDst) do
        if (nowTs - item.ts) > 1.0 then
            aura_env.recentDmgRemovedByDst[dst] = nil
        end
    end
end

function aura_env.TryResolveRecentRemoval(allstates, dstName, label, timestamp)
    if not dstName or not label or not timestamp then return false end
    
    local rec = aura_env.recentDmgRemovedByDst[dstName]
    if not rec or not rec.ev then return false end
    
    local ev = rec.ev
    
    -- already resolved
    if ev.suppressionBuff then
        aura_env.recentDmgRemovedByDst[dstName] = nil
        return false
    end
    
    -- only check if recent trix removal happened
    if not ev.dmgAppliedTimestamp or not ev.dmgRemovedTimestamp then return false end
    if ev.dmgUptime and ev.dmgUptime >= 0.98 then return false end
    
    local dt = timestamp - rec.ts
    if dt < 0 or dt > (aura_env.SUPP_WINDOW or 0.20) then
        return false
    end
    
    ev.suppressionBuff = label
    aura_env.recentDmgRemovedByDst[dstName] = nil
    print("Cancelled trix on", ev.dstName, "by", label, "after", string.format("%.3f", dt), "s")
    
    return aura_env.UpdateStateInfo(allstates, ev)
end

function aura_env.OnSuppressionBuffApplied(allstates, spellID, dstName, timestamp)
    local label = spellID and aura_env.suppressionBuffs and aura_env.suppressionBuffs[spellID]
    if not label then return false end
    return aura_env.TryResolveRecentRemoval(allstates, dstName, label, timestamp)
end

---------------------------------------------------------------------
-- Utility functions for threat redirection checks
---------------------------------------------------------------------

function aura_env.GetTankAuras(unit)
    for i = 1, 40 do
        local spellId = select(11, UnitBuff(unit, i))
        if not spellId then return end
        if aura_env.TankAuras[spellId] then
            return true
        end
    end
    local _, class = UnitClass(unit)
    if class == 'WARRIOR' then
        if UnitHealth(unit) > 50000 then
            return true
        end
    end
end

function aura_env.IsTank(unit)
    return aura_env.TankClasses[select(2, UnitClass(unit))] and aura_env.GetTankAuras(unit)
end

---------------------------------------------------------------------
-- Utility functions for formatting damage, time and colorizing text
---------------------------------------------------------------------

function aura_env.FormatDamage(value)
    if not value then return "0" end
    
    local sign = ""
    if value < 0 then
        sign = "-"
        value = -value
    end
    
    value = math.floor(value)
    
    -- Millionen
    if value >= 1000000 then
        return sign .. math.floor(value / 10000) / 100.0 .. "M"
        
        -- Tausender
    elseif value >= 1000 then
        local thousands = value / 1000
        
        -- Unter 10k → eine Nachkommastelle
        if thousands < 10 then
            return sign .. string.format("%.1fk", thousands)
        else
            return sign .. math.floor(thousands) .. "k"
        end
    end
    
    return sign .. tostring(value)
end

function aura_env.FormatSeconds(value)
    if not value then return "0.0s" end
    return string.format("%.1fs", value)
end

function aura_env.FormatRel(sec)
    local sign = ""
    -- prevents showing -0:00 for negative times very close to 0
    if sec < 0 then
        sign = "-"
        sec = -sec
    end
    local m = math.floor(sec / 60)
    local s = math.floor(sec % 60)
    return string.format("%s%02d:%02d", sign, m, s)
end

function aura_env.FormatEventTime(eventTimestamp, pullStart)
    -- Wenn kein Pull aktiv: Uhrzeit anzeigen
    if not pullStart then
        return date("%H:%M:%S", eventTimestamp)
    end
    
    -- Pull aktiv: relativ zu pullStart anzeigen (kann negativ sein)
    return aura_env.FormatRel(eventTimestamp - pullStart)
end

function aura_env.ColorizeBy01(text, v, flip)
    if text == nil then text = "" end
    if v == nil then v = 0 end
    if flip == nil then flip = false end
    
    -- clamp
    if v < 0 then v = 0 elseif v > 1 then v = 1 end
    -- flip
    if flip then v = 1 - v end
    
    local r, g, b
    if v <= 0.5 then
        -- red -> yellow: R stays 255, G goes 0..255, B stays 0
        local t = v / 0.5 -- 0..1
        r = 255
        g = math.floor(255 * t + 0.5)
        b = 0
    else
        -- yellow -> green: G stays 255, R goes 255..0, B stays 0
        local t = (v - 0.5) / 0.5 -- 0..1
        r = math.floor(255 * (1 - t) + 0.5)
        g = 255
        b = 0
    end
    
    return string.format("|cFF%02X%02X%02X%s|r", r, g, b, tostring(text))
end

function aura_env.colorizeTextByClass(text, class)
    -- colorize me in green
    local color = RAID_CLASS_COLORS[class]
    if text == aura_env.me then
        color = {colorStr = "FF00FF00"}
    end
    if color then
        return "|c" .. color.colorStr .. text .. "|r"
    else
        return text
    end
end

---------------------------------------------------------------------
-- Utility functions for time offset management, mapping GetTime() to CLEU timestamps and calculating relative event times
---------------------------------------------------------------------

-- optional smoothing gegen jitter
aura_env.timeOffsetAlpha = 0.15  -- 0..1 (klein = stabiler)

function aura_env.TryInitCleuOffset(cleuTimestamp)
    -- Offset nur einmal pro combatSession setzen
    if aura_env.cleuOffset and aura_env.cleuOffsetSession == aura_env.combatSession then
        return
    end
    aura_env.cleuOffset = GetTime() - cleuTimestamp
    aura_env.cleuOffsetSession = aura_env.combatSession
end

function aura_env.NowCLEU()
    -- "jetzt" in CLEU-Zeitbasis (für PLAYER_REGEN_*, laufende Duration etc.)
    if aura_env.cleuOffset then
        return GetTime() - aura_env.cleuOffset
    end
    -- Fallback, falls noch kein CLEU Event kam
    return GetTime()
end