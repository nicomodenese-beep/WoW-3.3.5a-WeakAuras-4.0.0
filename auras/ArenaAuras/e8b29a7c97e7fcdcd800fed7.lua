function(event, ...)
    if event == "PLAYER_LOGOUT" then
        aura_env.loggingOut = true
        if aura_env.worker then aura_env.worker:Hide() end
        return true
    end
    if event == "PLAYER_ENTERING_WORLD" then
        aura_env.loggingOut = false
        aura_env.accountReady = false
        aura_env.teamDataReady = false
        aura_env.enteredAt = GetTime()
    end
    if event == "ARENA_TEAM_ROSTER_UPDATE" and not (...) then
        aura_env.rosterReplyAt = time()
        aura_env.rosterReplySerial = (aura_env.rosterReplySerial or 0) + 1
    end
    if aura_env.RecordMatchMMR then aura_env.RecordMatchMMR(event) end
    if aura_env.CheckFlush then aura_env.CheckFlush() end
    if event == "ARENA_TEAM_UPDATE" then
        aura_env.teamDataReady = true
        aura_env.accountReady = true
        aura_env.dataCycle = aura_env.FlushCycle(time())
    end
    if aura_env.InstallHooks then aura_env.InstallHooks() end
    if aura_env.Queue then aura_env.Queue() end
    return true
end