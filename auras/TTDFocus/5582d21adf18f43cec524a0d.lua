function(event, ...)
    -- reset current estimate if target changed
    if (event == "PLAYER_FOCUS_CHANGED") then
        aura_env.timestamps = {}
        aura_env.healthstamps = {}
        return true
    end
    -- cancel timer after leaving combat (only if not dead)
    if (event == "PLAYER_REGEN_ENABLED" and not UnitIsDeadOrGhost("player")) then
        aura_env.timestamps = {}
        aura_env.healthstamps = {}
        WeakAuras.timer:CancelTimer(aura_env.timerID)
        return true
    end
    -- player accepts res or releases to graveyard
    if (event == "PLAYER_ALIVE" and not UnitAffectingCombat("player")) then
        WeakAuras.timer:CancelTimer(aura_env.timerID)
        return true
    end
    
    -- standard case: tick timer starts with enterting combat and ends with leaving combat
    -- edge cases:
    -- player dies during combat -> leave timer running to get TTD for others
    -- player releases during encounter -> cancel timer (PLAYER_ALIVE))
    -- player accepts res after encounter is over -> cancel timer (PLAYER_ALIVE)
    -- player accepts res during encounter -> PLAYER_ALIVE triggers 
    --   case 1: player is outfight for a split second -> stop timer and restart right after
    --   case 2: player is infight directly -> don't stop timer (REGEN_DISABLED will stop and insta restart)
end