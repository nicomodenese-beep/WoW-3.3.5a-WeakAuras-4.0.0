aura_env.active = false
if aura_env.worker then aura_env.worker:Hide() end
for _, card in pairs(aura_env.cards or {}) do card:Hide() end


