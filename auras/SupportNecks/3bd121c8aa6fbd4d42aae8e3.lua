aura_env.state.button:Hide()
aura_env.state.button:SetParent(nil)
table.insert(aura_env.unusedButtons, aura_env.state.button)
--print("recycle " .. aura_env.state.unitName .. " " .. aura_env.state.neckID)