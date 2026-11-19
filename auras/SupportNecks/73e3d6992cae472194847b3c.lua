WeakAuras.ScanEvents("SUPPORT_NECKS_ICONS",aura_env.state.name,nil,aura_env.region)

aura_env.state.button:SetScript("OnClick", nil)
aura_env.state.button:Hide()
aura_env.state.button:SetParent(nil)
table.insert(aura_env.unusedButtons, aura_env.state.button)