function(allstates, event, ...)
    --/script WeakAuras.ScanEvents("SUPPORT_NECKS_REMINDER", 24121, GetTime(), 30)
    local neckID, expirationTime, duration = ...
    if neckID and expirationTime and duration and aura_env.config.showReminder then 
        allstates["reminder"] = {
            icon = aura_env.neckIcons[neckID] or "",
            progressType = "timed",
            autoHide = false,
            expirationTime = expirationTime,
            duration = duration,
            changed = true,
            show = true,
        }
    else
        allstates["reminder"] = {
            changed = true,
            show = false,
        }
    end
    return true
end