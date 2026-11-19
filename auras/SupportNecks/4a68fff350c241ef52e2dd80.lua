aura_env.button:Hide()
aura_env.button:SetParent(nil)
table.insert(aura_env.unusedButtons, aura_env.button)
--print("recycle " .. aura_env.state.unitName .. " " .. aura_env.state.neckID)