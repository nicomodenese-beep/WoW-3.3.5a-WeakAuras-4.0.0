function()
    local channel = UnitChannelInfo("player")
    if channel ~= GetSpellInfo(27213) then return false end
    
    for i = 1, 40 do
        local name, _, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", i)
        if not name then break end
        if spellId == 58597 then return true end
    end
    return false
end