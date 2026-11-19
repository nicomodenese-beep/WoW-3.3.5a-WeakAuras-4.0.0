aura_env.debug = function(group,msg,...)
    return WeakAuras.ScanEvents("DPRINT",group,aura_env.id,msg,...)
end

aura_env.OmniCC = IsAddOnLoaded("OmniCC") and true or false
aura_env.neckIcons = {
    [24121] = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02",
    [24114] = "Interface\\Icons\\INV_Jewelry_Necklace_07",
    [24116] = "Interface\\Icons\\INV_Jewelry_Necklace_28",
    [24117] = "Interface\\Icons\\INV_Jewelry_Necklace_29Naxxramas",
}
aura_env.anchors = {}

function aura_env.getSortedAnchorIndexTable(tbl)
    local keys = {}
    -- extract all integer keys
    for key, _ in pairs(tbl) do
        if type(key) == "number" then
            tinsert(keys, key)
        end
    end
    -- sort keys
    table.sort(keys)
    -- invert table to allow for easy referencing
    local inverted = {}
    for key, value in pairs(keys) do
        inverted[value] = key
    end
    return inverted
end

aura_env.unusedButtons = {}