local cycloneID = 33786
local cycloneName = GetSpellInfo(cycloneID)

-- 3.3.5a: Castzeit ist der 7. Rueckgabewert, in Millisekunden.
local castTime = select(7, GetSpellInfo(cycloneID))

local region = aura_env.region
local bar = region and region.bar
if not bar then
    return
end

local function HideSparks()
    if bar.spark1 then bar.spark1:Hide() end
    if bar.spark2 then bar.spark2:Hide() end
end

if not cycloneName or not castTime then
    HideSparks()
    return
end

-- Dauer des vom Aura-Trigger erkannten Cyclones.
-- Funktioniert unabhaengig vom aktuell ausgewaehlten Target.
local state = aura_env.state
local duration = state and state.duration
local spellDuration

if duration and duration > 0 then
    spellDuration = duration * 1000
end

if not spellDuration then
    HideSparks()
    return
end


local function CreateSpark()
    local spark = bar:CreateTexture(nil, "ARTWORK")
    
    if bar.spark then
        spark:SetTexture(bar.spark:GetTexture())
        spark:SetBlendMode(bar.spark:GetBlendMode())
        spark:SetWidth(bar.spark:GetWidth())
        spark:SetHeight(bar.spark:GetHeight())
    else
        spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        spark:SetBlendMode("ADD")
        spark:SetWidth(16)
        spark:SetHeight(bar:GetHeight() * 2)
    end
    
    return spark
end

bar.spark1 = bar.spark1 or CreateSpark()

local function DrawSpark(timeRemaining, spark)
    -- Ausserhalb der dargestellten Zeitspanne keine Marke anzeigen.
    if timeRemaining < 0 or timeRemaining > spellDuration then
        spark:Hide()
        return
    end
    
    local fraction = timeRemaining / spellDuration
    
    spark:ClearAllPoints()
    spark:SetPoint(
        "CENTER",
        bar,
        "LEFT",
        bar:GetWidth() * fraction,
        0
    )
    spark:Show()
end

DrawSpark(castTime, bar.spark1)



