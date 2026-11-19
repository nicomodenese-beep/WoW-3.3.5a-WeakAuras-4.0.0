---@meta
---@class WAState
---@field show boolean
---@field changed boolean
---@field progressType? "timed"|"static"
---@field duration? number
---@field expirationTime? number
---@field value? number
---@field total? number
---@field stacks? number
---@field autoHide? boolean
---@alias WAStates table<string, WAState>
---@alias WATrigger fun(event: string, ...): boolean
---@alias WATSU fun(states: WAStates, event: string, ...): boolean?
---@class AuraEnvironment
---@field id string
---@field cloneId string?
---@field state WAState?
---@field states table?
---@field region table?
---@type AuraEnvironment
aura_env = {}
WeakAuras = {}
---@param id string
---@param cloneId? string
---@return table? region
function WeakAuras.GetRegion(id, cloneId) end

---@param event string
---@param ... any
function WeakAuras.ScanEvents(event, ...) end

---@param unit string
---@return string name
function WA_ClassColorName(unit) end

---@param reversed? boolean
---@param forceParty? boolean
---@return fun():string?
function WA_IterateGroupMembers(reversed, forceParty) end
