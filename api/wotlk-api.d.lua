---@meta

---@param unit string
---@return string? guid
function UnitGUID(unit) end

---@param unit string
---@return string? name
---@return string? realm
function UnitName(unit) end

---@param unit string
---@return string localized
---@return string token
function UnitClass(unit) end

---@param unit string
---@return 1? exists
function UnitExists(unit) end

---@param unit string
---@return number health
function UnitHealth(unit) end

---@param unit string
---@return number maximum
function UnitHealthMax(unit) end

---@param unit string
---@return 1? dead
function UnitIsDeadOrGhost(unit) end

---@return number seconds
function GetTime() end

---@return integer count
function GetNumPartyMembers() end

---@return integer count
function GetNumRaidMembers() end

---@return integer count
function GetNumBattlefieldScores() end

---@return integer count
function GetNumArenaOpponents() end

---@param spell number|string
---@return string? name
---@return string rank
---@return string icon
---@return number cost
---@return boolean funnel
---@return number powerType
---@return number castMS
---@return number minRange
---@return number maxRange
function GetSpellInfo(spell) end

---@param spell number|string
---@return number start
---@return number duration
---@return number enabled
function GetSpellCooldown(spell) end

---@param unit string
---@param index integer
---@param filter? string
---@return string? name
---@return string rank
---@return string icon
---@return number stacks
---@return string? debuffType
---@return number duration
---@return number expiration
---@return string? caster
---@return 1? stealable
---@return 1? consolidate
---@return integer spellId
function UnitAura(unit, index, filter) end

---@param prefix string
---@param message string
---@param distribution string
---@param target? string
function SendAddonMessage(prefix, message, distribution, target) end

---@param frameType string
---@param name? string
---@param parent? table
---@param template? string
---@return table frame
function CreateFrame(frameType, name, parent, template) end
