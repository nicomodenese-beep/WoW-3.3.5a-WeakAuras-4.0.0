for i = 1, 40 do
    local name, _, _, _, _, _, _, _, _, _, spellId = UnitBuff("player", i)
    if not name then break end
    if spellId == 58597 then
        CancelUnitBuff("player", i)
        break
    end
end