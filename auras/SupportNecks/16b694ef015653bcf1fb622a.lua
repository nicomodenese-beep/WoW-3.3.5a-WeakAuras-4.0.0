local function OnClick(self, button)
    --print("reset ignore")
    WeakAuras.ScanEvents("SUPPORT_NECKS", "RESET_IGNORE")
end

aura_env.button = nil
if #aura_env.unusedButtons == 0 then
    aura_env.button = CreateFrame("Button", nil, aura_env.region)  
    aura_env.button:SetFrameStrata("MEDIUM")
else
    aura_env.button = table.remove(aura_env.unusedButtons)
    aura_env.button:SetParent(aura_env.region)
    aura_env.button:SetFrameStrata("MEDIUM")
    aura_env.button:Show()
end

aura_env.button:SetAllPoints()
--aura_env.state.button:RegisterForClicks("RightButtonUp")
aura_env.button:SetScript("OnClick", OnClick)

--aura_env.button.texture = aura_env.button:CreateTexture()
--aura_env.button.texture:SetAllPoints(aura_env.button)
--aura_env.button.texture:SetTexture(1, 0, 0)