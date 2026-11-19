-- define all special TTD cases and bosses
local lk = "The Lich King"
local prof = "Professor Putricide"
local sindra = "Sindragosa"
local vali = "Valithria Dreamwalker"
local halion = "Halion"
local anub = "Anub'arak"
local valk = "Val'kyr Shadowguard"
local gor = "Gorranax"
aura_env.lady = "Lady Deathwhisper"

if (GetLocale() == "deDE") then
    lk = "Der Lichkönig"
    prof = "Professor Seuchenmord"
    vali = "Valithria Traumwandler"
    valk = "Schattenwächterin der Val'kyr"
    aura_env.lady = "Lady Todeswisper"
end

aura_env.specialCases = {
    [lk] = {
        ["P2"] = 0.7,
        ["P3"] = 0.4,
        ["End"] = 0.104,
    },
    [prof] = {
        ["P2"] = 0.8,
        ["P3"] = 0.35,    
    },
    [sindra] = {
        ["P2"] = 0.35,   
    },
    [vali] = {
        ["End"] = 1,   
    },
    [halion] = {
        ["P2"] = 0.75,
        ["P3"] = 0.5,    
    },
    [anub] = {
        ["P2"] = 0.3,    
    },
    [valk] = {
        ["End"] = 0.5,
    },
    [gor] = {
        ["End"] = 0.0515,
    },
}



aura_env.timestamps = {}
aura_env.healthstamps = {}
aura_env.timerID = nil
--print("clearing all timers")
--WeakAuras.timer:CancelAllTimers() -- stop all timers if weakaura settings got adjusted

local weights = {}
for i = 1, aura_env.config.eventAmount do
    weights[i] = i
end

-- Function to calculate weighted sums
local function calculate_weighted_sums(x, y, w)
    local n, n_w = #x, #w
    local sum_w, sum_wx, sum_wy, sum_wxy, sum_wx2 = 0, 0, 0, 0, 0
    
    for i = 1, n do
        sum_w = sum_w + w[i + n_w - n]
        sum_wx = sum_wx + w[i + n_w - n] * x[i]
        sum_wy = sum_wy + w[i + n_w - n] * y[i]
        sum_wxy = sum_wxy + w[i + n_w - n] * x[i] * y[i]
        sum_wx2 = sum_wx2 + w[i + n_w - n] * x[i] * x[i]
    end
    
    return sum_w, sum_wx, sum_wy, sum_wxy, sum_wx2
end

-- Weighted least squares fit
function aura_env.weighted_least_squares(x, y)
    local sum_w, sum_wx, sum_wy, sum_wxy, sum_wx2 = calculate_weighted_sums(x, y, weights)
    
    -- Calculate coefficients
    local a = (sum_w * sum_wxy - sum_wx * sum_wy) / (sum_w * sum_wx2 - sum_wx * sum_wx)
    local b = (sum_wy - a * sum_wx) / sum_w
    
    return a, b
end

-- Function to format time in seconds into readable string
function aura_env.format_time(seconds)
    local hours = floor(seconds / 3600)
    seconds = seconds % 3600
    local minutes = floor(seconds / 60)
    seconds = seconds % 60
    
    if hours > 0 then
        return string.format("%d:%02d:%02d", hours, minutes, seconds)
    elseif minutes > 0 then
        return string.format("%d:%02d", minutes, seconds)
    else
        return string.format("%d", seconds)
    end
end