WeakAuras.ScanEvents("SUPPORT_NECKS_ICONS",aura_env.state.name,aura_env.roster[aura_env.state.name],aura_env.region)

local function OnClick(self, button)
    WeakAuras.ScanEvents("SUPPORT_NECKS", "IGNORE", self.unitName)
end

aura_env.state.button = nil
if #aura_env.unusedButtons == 0 then
    aura_env.state.button = CreateFrame("Button", nil, aura_env.region)  
    aura_env.state.button:SetFrameStrata("MEDIUM")
else
    aura_env.state.button = table.remove(aura_env.unusedButtons)
    aura_env.state.button:SetParent(aura_env.region)
    aura_env.state.button:SetFrameStrata("MEDIUM")
    aura_env.state.button:Show()
end
aura_env.state.button:SetAllPoints()
aura_env.state.button.unitName = aura_env.state.name
--print(aura_env.state.button.unitName)
aura_env.state.button:RegisterForClicks("RightButtonUp")
aura_env.state.button:SetScript("OnClick", OnClick)
--print("Button Parent:", aura_env.state.button:GetParent())
--print("OnClick Script:", aura_env.state.button:GetScript("OnClick"))

--aura_env.state.button.texture = aura_env.state.button:CreateTexture()
--aura_env.state.button.texture:SetAllPoints(aura_env.state.button)
--aura_env.state.button.texture:SetTexture(1, 0, 0)