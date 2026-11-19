function(allstates, event, show)
    --/script WeakAuras.ScanEvents("SUPPORT_NECKS_RESET_IGNORE", true/false)
    allstates["resetIgnore"] = {
        changed = true,
        show = show or false,
    }
    return true
end