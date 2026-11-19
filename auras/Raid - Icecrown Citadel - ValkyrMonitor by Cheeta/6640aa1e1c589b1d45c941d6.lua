-- The aura coding is provided by Merfin
local GetTime = GetTime
local pairs, select, strsub, tonumber = pairs, select, strsub, tonumber
local UnitInVehicle, UnitName, UnitAura, UnitExists, UnitGUID, UnitHealth, UnitHealthMax = UnitInVehicle, UnitName, UnitAura, UnitExists, UnitGUID, UnitHealth, UnitHealthMax
local WA_ClassColorName, WA_IterateGroupMembers = WA_ClassColorName, WA_IterateGroupMembers
local GetRaidTargetIndex, GetSpellInfo = GetRaidTargetIndex, GetSpellInfo

local ValkyrsGrabWidget = aura_env
ValkyrsGrabWidget.ExitScan = false 
local scanTime = 0.3
ValkyrsGrabWidget.mark = 2
--ValkyrsGrabWidget.EnteredTimer
--ValkyrsGrabWidget.ExitedTimer
ValkyrsGrabWidget.threshold = 3
ValkyrsGrabWidget.lastSummon = GetTime()

function ValkyrsGrabWidget.StartScanEntered()
    ValkyrsGrabWidget.EnteredTimer = WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, scanTime, "VALKYRS_GRABBED_WIDGET", "SCAN_ENTERED")
end

function ValkyrsGrabWidget.StartScanExited()
    ValkyrsGrabWidget.ExitedTimer = WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, scanTime, "VALKYRS_GRABBED_WIDGET", "SCAN_EXITED")
end

aura_env.stuns = {
    -- Kidney Shot
    [GetSpellInfo(8643)] = true,
    -- Cheap Shot
    [GetSpellInfo(1833)] = true,
    
    -- Schockwave
    [GetSpellInfo(46968)] = true,
    
    -- Gnaw
    [GetSpellInfo(47481)] = true,
    
    -- Hammer of Justice
    [GetSpellInfo(10308)] = true,
    -- Holy Wrath
    [GetSpellInfo(48817)] = true,
    
    -- Bash
    [GetSpellInfo(8983)] = true,
    
    -- Deterrence
    [GetSpellInfo(19577)] = true, 
}

aura_env.stun = function(unit)
    if UnitExists(unit) then
        for spell, _ in pairs(aura_env.stuns) do 
            local icon = select(3, UnitAura(unit, spell, nil, "HARMFUL"));
            if icon then 
                return true, icon
            end
        end
    end
    return false, ""
end
aura_env.CheckHP = function()
    for unit in WA_IterateGroupMembers() do
        local target = unit.."target"
        local unitGUID = UnitGUID(target)
        if unitGUID and tonumber(strsub(unitGUID,9,12), 16) == 36609 then
            local raidTI = GetRaidTargetIndex(target)
            if raidTI then
                local h, mh = UnitHealth(target), UnitHealthMax(target)
                if h == 0 or h == 1 then return end
                local value = math.ceil(100*h/mh)
                local isStunned, icon = aura_env.stun(target)
                if value >= 50 then 
                    WeakAuras.ScanEvents(
                        "VALKYRS_GRABBED_WIDGET",
                        "HP_SCAN",
                        value,
                        raidTI,
                        isStunned,
                        icon
                    )
                end
            end
        end
    end
end


