aura_env.region:ClearAllPoints()
aura_env.region:SetAnchor("LEFT", aura_env.state.anchorTo, "RIGHT")
aura_env.region:SetXOffsetRelative(aura_env.region.width * (aura_env.state.anchorIndex - 1))

local function OnClick(self, button)
    --print(self.unitName .. " " .. self.neckID)
    WeakAuras.ScanEvents("SUPPORT_NECKS", "REQUEST_EQUIP", self.neckID, self.unitName)
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
    --print("reuse " .. aura_env.state.unitName .. " " .. aura_env.state.neckID)
end
aura_env.state.button:SetAllPoints()
aura_env.state.button.unitName = aura_env.state.unitName
aura_env.state.button.neckID = aura_env.state.neckID
--aura_env.state.button:RegisterForClicks("RightButtonUp")
aura_env.state.button:SetScript("OnClick", OnClick)

--aura_env.state.button.texture = aura_env.state.button:CreateTexture()
--aura_env.state.button.texture:SetAllPoints(aura_env.state.button)
--aura_env.state.button.texture:SetTexture(1, 0, 0)



