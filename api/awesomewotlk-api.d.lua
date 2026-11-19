---@meta
C_NamePlate = {}
---@return table plates
function C_NamePlate.GetNamePlates() end

---@param unit string
---@return table? plate
function C_NamePlate.GetNamePlateForUnit(unit) end

---@param unit string
---@return boolean controlled
function UnitIsControlled(unit) end

---@param unit string
---@return boolean disarmed
function UnitIsDisarmed(unit) end

---@param unit string
---@return boolean silenced
function UnitIsSilenced(unit) end

---@param unit string
---@param slot integer
---@return integer item
---@return integer enchant
function GetInventoryItemTransmog(unit, slot) end

function FlashWindow() end

function FocusWindow() end

---@return 1? focused
function IsWindowFocused() end

---@param text string
function CopyToClipboard(text) end
