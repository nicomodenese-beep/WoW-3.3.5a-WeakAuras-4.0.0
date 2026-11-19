function(allstates, event, ...)
    -- save target of incoming resurrection
    if (event == "UNIT_SPELLCAST_SENT" and aura_env.res[select(2,...)]) then
        local casterGUID = UnitGUID(select(1,...))
        -- create new clone for new caster
        if not allstates[casterGUID] then
            allstates[casterGUID] = {}
        end
        -- spellcast_sent can get triggert before spellcast_success of previous cast
        allstates[casterGUID].target = select(4,...)
        -- mouseover res when target released already -> read tooltip
        if not allstates[casterGUID].target or allstates[casterGUID].target == UNKNOWN then
            allstates[casterGUID].target = string.match(GameTooltipTextLeft1:GetText(), "([%S]+)$")
        end
    end
    -- get casttime info and start clone
    if (event == "UNIT_SPELLCAST_START" and aura_env.res[select(2,...)]) then
        local unit = select(1,...)
        local casterGUID = UnitGUID(unit)
        local startCast = select(5,UnitCastingInfo(unit)) / 1000
        local endCast = select(6,UnitCastingInfo(unit)) / 1000
        local icon = select(4,UnitCastingInfo(unit))
        local myRes = UnitGUID("player") == casterGUID
        local tar = UnitIsPlayer(unit .. "target") and UnitName(unit .. "target") or ""
        local mayFail = select(2, ...) == GetSpellInfo(45872) -- Defibrillate cast can fail
        -- overwrite my target with data from UNIT_SPELLCAST_SENT since it is more accurate
        if myRes then
            tar = allstates[casterGUID].target
        end
        
        allstates[casterGUID] = {
            show = true,
            changed = true,
            progressType = "timed",
            duration = endCast - startCast,
            expirationTime = endCast,
            autoHide = false,
            icon = icon,
            target = tar,
            source = UnitName(unit),
            name = aura_env.displayRes(UnitName(unit), tar),
            status = "casting",
            redundant = false,
            myRes = myRes,
            tarMe = tar == UnitName("player"),
            mayFail = mayFail,
        }
        aura_env.checkRedundant(allstates)
        
        WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, aura_env.config.fadeOutAfter + endCast - startCast, "RESFADE", casterGUID)
        return true
    end
    
    -- interrupted resurrection cast
    if (event == "UNIT_SPELLCAST_STOP" and aura_env.res[select(2,...)]) then
        local unit = select(1,...)
        local casterGUID = UnitGUID(unit)
        -- only trigger if status is still casting since spellcast_stop gets called after success as well
        if (allstates[casterGUID].status == "casting") then
            allstates[casterGUID].status = "interrupted"
            allstates[casterGUID].duration = 0
            allstates[casterGUID].expirationTime = GetTime()
            allstates[casterGUID].changed = true
            aura_env.checkRedundant(allstates)
            --WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, aura_env.config.fadeOutAfter, "RESFADE", casterGUID)
            return true
        end
    end
    -- succeeded resurrection cast
    if (event == "UNIT_SPELLCAST_SUCCEEDED" and aura_env.res[select(2,...)]) then
        local unit = select(1,...)
        local casterGUID = UnitGUID(unit)
        if (allstates[casterGUID]) then
            allstates[casterGUID].status = "succeeded"
            allstates[casterGUID].changed = true
            --WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, aura_env.config.fadeOutAfter, "RESFADE", casterGUID)
            return true
        end
    end
    
    -- get res target from lib ResComm of in use
    if (event == "CHAT_MSG_ADDON") then
        -- RES target    channel caster (started)
        -- RESNO         channel caster (interrupted)
        -- RESYES        channel caster (successful res)
        -- RESSED        channel target
        -- NORESSED      channel target (canceled pending)
        
        -- soulstone:
        -- CANRES        channel target
        -- CANRES SS     channel target (??)
        local prefix, subEvent, channel, caster = ...
        if (prefix == "CTRA") then
            -- res cast started
            if string.find(subEvent, "^RES ") then
                casterGUID = caster and UnitGUID(caster)
                local target = string.match(subEvent, "^RES ([%S]+)")
                if not allstates[casterGUID] then return false end -- ignore resses out of range
                allstates[casterGUID].target = target
                allstates[casterGUID].tarMe = target == UnitName("player")
                allstates[casterGUID].name = aura_env.displayRes(caster, target)
                allstates[casterGUID].changed = true
                aura_env.checkRedundant(allstates)
                return true
            end
        end
    end
    
    -- fade out resurrection bar
    if (event == "RESFADE") then
        local casterGUID = select(1,...)
        -- prevent resurrect recast from fade out
        if (allstates[casterGUID] and allstates[casterGUID].expirationTime < GetTime()) then
            allstates[casterGUID].show = false
            allstates[casterGUID].changed = true
            return true
        end
    end
end