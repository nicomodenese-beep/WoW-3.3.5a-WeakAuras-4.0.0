--WeakAuras.ScanEvents("PROF_VOLATILE",aura_env.state.unitName,{},aura_env.cloneId)


-- stop raid cooldowns weakaura to send cd updates
WeakAuras.ScanEvents("RAID_COOLDOWNS","STOP_TRACKING",GetSpellInfo(aura_env.state.spellId) == "Gaseous Bloat" and "PROF_GASEOUS" or "PROF_VOLATILE",aura_env.state.unitName,aura_env.cloneId,aura_env.region)

-- reset immunities weakaura
WeakAuras.ScanEvents(GetSpellInfo(aura_env.state.spellId) == "Gaseous Bloat" and "PROF_GASEOUS" or "PROF_VOLATILE",aura_env.state.unitName,{},aura_env.cloneId)



