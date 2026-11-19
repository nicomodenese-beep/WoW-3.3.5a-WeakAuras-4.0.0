-- request immunities from RAID_COOLDOWNS
if GetSpellInfo(aura_env.state.spellId) == "Gaseous Bloat" then
    WeakAuras.ScanEvents("RAID_COOLDOWNS","START_TRACKING","PROF_GASEOUS",aura_env.state.unitName,aura_env.cloneId,aura_env.region)
else
    WeakAuras.ScanEvents("RAID_COOLDOWNS","START_TRACKING","PROF_VOLATILE",aura_env.state.unitName,aura_env.cloneId,aura_env.region)
end

--print(aura_env.cloneId)    






