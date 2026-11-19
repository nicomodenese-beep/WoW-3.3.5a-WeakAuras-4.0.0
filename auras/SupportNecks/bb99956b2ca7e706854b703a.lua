local SN = aura_env

--------- Debug ---------
SN.debug = function(group,msg,...)
    --return WeakAuras.ScanEvents("DPRINT",group,SN.id,msg,...)
end

---------- Init ---------
SN.version = "v1.4"
SN.versionControl = {}

SN.necks = {
    [24121] = true,
    [24114] = true,
    [24116] = true,
    [24117] = true,
}
SN.neckIcons = {
    [24121] = "Interface\\Icons\\INV_Jewelry_Necklace_AhnQiraj_02",
    [24114] = "Interface\\Icons\\INV_Jewelry_Necklace_07",
    [24116] = "Interface\\Icons\\INV_Jewelry_Necklace_28",
    [24117] = "Interface\\Icons\\INV_Jewelry_Necklace_29Naxxramas",
}
SN.neckSpellIDs = {
    [31035] = 24121,
    [31025] = 24114,
    [31033] = 24116,
    [31026] = 24117,
}
SN.neckCharges = {}
SN.neckCds = {}
SN.currentNeck = {}
-- currentNeck = { id, charges, startTime, duration }

SN.scheduledNeckID = nil
SN.scheduledNeckSender = nil
SN.retryTimer = nil

SN.enabledOnSpec = {
    ["ShamanRestoration"] = true,
    ["DruidRestoration"] = true,
    ["DruidFeralCombat"] = true,
    ["PaladinHoly"] = true,
    ["PaladinProtection"] = true,
    ["PriestDiscipline"] = true,
    ["PriestHoly"] = true,
    ["WarriorProtection"] = true,
    ["DeathKnightBlood"] = true,
    ["DeathKnightFrost"] = true,
}
SN.specEnabled = false
SN.currentSpec = nil
SN.charEnabled = false

SN.roster = {}
SN.ignoreThisSession = {}
SN.inRaid = false

aura_env.unusedButtons = {}

----- Slash Commands ----
-- blocked by WeakAuras
-- SLASH_SN1 = "/sn"
-- SlashCmdList["SN"] = function(payload)
--     -- parse payload
--     payload = strsplit(" ", payload)
--     local command = strlower(payload[1])
--     if command == "reset" then
--         print("SN: resetting")
--     elseif command == "ignore" then
--         print("SN: ignoring " .. payload[2] or "")
--     else
--         -- if no matching command found -> print help
--         print("SN: Slash commands")
--         print("/sn ignore X - ignores player X for this session")
--         print("/sn reset - resets ignore list")
--     end
-- end

---- Helper Functions ---
local function deepCopy(original)
    local copy
    if type(original) == "table" then
        copy = {}
        for key, value in pairs(original) do
            copy[key] = deepCopy(value)
        end
        setmetatable(copy, deepCopy(getmetatable(original)))
    else
        copy = original
    end
    return copy
end

local function compareTables(t1, t2)
    if t1 == t2 then
        return true -- Same reference
    end
    if type(t1) ~= "table" or type(t2) ~= "table" then
        return false -- One is a table and the other is not
    end
    for key, value in pairs(t1) do
        if type(value) == "table" then
            -- Recursively compare nested tables
            if not compareTables(value, t2[key]) then
                return false
            end
        else
            if value ~= t2[key] then
                return false
            end
        end
    end
    -- Check for keys in t2 that are not in t1
    for key, _ in pairs(t2) do
        if t1[key] == nil then
            return false
        end
    end
    return true
end

local function updateState(state, updates)
    local changed = false
    
    -- Iterate through fields in `updates` and compare with `state`
    for key, newValue in pairs(updates) do
        local oldValue = state[key]
        
        -- Compare the old value and the new value
        if oldValue ~= newValue then
            state[key] = newValue
            changed = true
        end
    end
    
    return changed
end

local function WrapTextInColorCode(text, colorCode)
    return string.format("|c%s%s|r", colorCode, text)
end

local function OnClick(self, button)
    print(self.unitName or "test")
    WeakAuras.ScanEvents("SUPPORT_NECKS", "IGNORE", self.unitName)
end

------- Functions -------
function SN.checkNecks()
    local cdChanged = SN.checkNeckCds()
    local chargesChanged = SN.checkNeckCharges()
    local currentChanged = SN.checkCurrentNeckInfo()
    
    if cdChanged or chargesChanged or currentChanged then
        if UnitInRaid("player") then
            SN.SendNeckInfos()
        end
        --WeakAuras.ScanEvents("SUPPORT_NECKS", "UPDATE_GUI", "checkNecks")
    end
end

function SN.checkNeckCds()
    local cdChanged = false
    for id, _ in pairs(SN.necks) do
        local startTime, duration = GetItemCooldown(id)
        -- ignore global cooldown when buffing
        startTime = duration > 3 and startTime or 0
        duration = duration > 3 and duration or 0
        if not SN.neckCds[id] or SN.neckCds[id].startTime ~= startTime then
            SN.neckCds[id] = {
                ["startTime"] = startTime,
                ["duration"] = duration,
            }
            cdChanged = true
        end
    end
    --SN.debug("notification1", "All Neck CDs", "changed", cdChanged, "neckCds", SN.neckCds)
    return cdChanged
end

function SN.checkNeckCharges()
    local totals = {}
    local unreadable = {}
    
    for id in pairs(SN.necks) do
        totals[id] = 0
    end
    
    local function AddCharges(id, equipped, bag, slot)
        local charges = SN.checkNeckCharge(equipped, bag, slot)
        
        if type(charges) == "number" then
            totals[id] = totals[id] + charges
        else
            unreadable[id] = true
        end
    end
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local id = GetContainerItemID(bag, slot)
            
            if SN.necks[id] then
                AddCharges(id, false, bag, slot)
            end
        end
    end
    
    for id in pairs(SN.necks) do
        if IsEquippedItem(id) then
            AddCharges(id, true)
        end
    end
    
    local changed = false
    
    for id, charges in pairs(totals) do
        if not unreadable[id] and SN.neckCharges[id] ~= charges then
            SN.neckCharges[id] = charges
            changed = true
        end
    end
    
    return changed
end

function SN.checkNeckCharge(equipped, bag, slot)
    -- equipped - bool - current equipped or bagslot
    local chargesPattern = "^([%d%a]+)%s[Cc]harge[s]?$"
    if GetLocale() == "deDE" then chargesPattern = "^([%d%a]+)%sAufladunge?n?$" end
    local soulboundPattern = GetLocale() == "deDE" and "^Seelengebunden$" or "^Soulbound$"
    
    GameTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
    if equipped then
        GameTooltip:SetInventoryItem("player", 2)
    else
        GameTooltip:SetBagItem(bag, slot)
    end
    GameTooltip:Show()
    local charges, soulbound = nil, false
    for i = 1, GameTooltip:NumLines() do
        local tooltipLine = _G["GameTooltipTextLeft" .. i]:GetText()
        if not soulbound then
            if tooltipLine:match(soulboundPattern) then soulbound = true end
        end
        charges = tooltipLine:match(chargesPattern)
        if charges ~= nil then break end
    end
    GameTooltip:Hide()
    if charges == "No" or charges == "Keine" then charges = 0 end
    return tonumber(charges), soulbound
end
function SN.checkCurrentNeckInfo()
    local supportNeck = {}
    for k, v in pairs(aura_env.necks) do
        if IsEquippedItem(k) then
            supportNeck.id = k
            supportNeck.charges = SN.checkNeckCharge(true)
            
            local spellID = 0
            for sID, neckID in pairs(SN.neckSpellIDs) do
                if k == neckID then spellID = sID end
            end
            local _, _, _, _, _, duration, expirationTime, caster = WA_GetUnitBuff("player", spellID)
            if caster and caster == "player" then
                supportNeck.startTime = expirationTime - duration
                supportNeck.duration = duration
            else
                supportNeck.startTime = 0
                supportNeck.duration = 0
            end
        end
    end
    
    if not compareTables(supportNeck, SN.currentNeck) then
        SN.currentNeck = supportNeck
        --SN.debug("notification1", "Equipped Neck Charges", "ID", supportNeckID, "Charges", supportNeckCharges)
        return true
    else
        return false
    end
    
end

function SN.checkBagsForNeckID(id)
    local bagSlotsWithNeck, bagSlotsWithNeckBound = {}, {}
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            if GetContainerItemID(bag, slot) == id then
                bagSlotsWithNeck[bag * 100 + slot], bagSlotsWithNeckBound[bag * 100 + slot] = SN.checkNeckCharge(false, bag, slot)
            end
        end
    end
    return bagSlotsWithNeck, bagSlotsWithNeckBound
end
function SN.equipNeck(id, sender)
    -- cancel equipping if wrong spec
    if not SN.specEnabled then return "spec" end
    -- make sure there are any charges left
    if SN.neckCharges[id] and SN.neckCharges[id] > 0 then
        if InCombatLockdown() then return "combat" end
        if UnitIsDeadOrGhost("player") then return "dead" end
        if UnitCastingInfo("player") then return "casting" end
        
        -- check if neckID already equipped and has at least 1 charge left
        if SN.currentNeck.id == id and SN.currentNeck.charges > 0 then return "redundant" end
        
        local bagSlotsWithNeck, bagSlotsWithNeckBound = SN.checkBagsForNeckID(id)
        --SN.debug("success", "found necks with charges", "bagSlotsWithNeck", bagSlotsWithNeck, "bagSlotsWithNeckBound", bagSlotsWithNeckBound)
        local bagSlotBest, chargesBest, soulboundBest = nil, 11, false
        for bagSlot, charges in pairs(bagSlotsWithNeck) do
            -- find best neck -> lowest remaining charges but at least 1 or if multiple fully charged find already soulbound one if possible
            if (charges < chargesBest and charges > 0) or (charges == chargesBest and bagSlotsWithNeckBound[bagSlot]) then
                bagSlotBest = bagSlot
                chargesBest = charges
                soulboundBest = bagSlotsWithNeckBound[bagSlot]
            end
        end
        -- equip best matching item (has lowest remaining charges but at least 1)
        if bagSlotBest then
            -- unpack bagSlot into bag, slot (bag * 100 + slot)
            if CursorHasItem() then ClearCursor() end
            PickupContainerItem(floor(bagSlotBest / 100), bagSlotBest % 100)
            AutoEquipCursorItem()
            if not soulboundBest then EquipPendingItem(0) end
            -- clear item afterwards if couldnt equip due to currently casting
            if CursorHasItem() then
                ClearCursor()
                return "failed"
            else
                if sender ~= UnitName("player") then print("SN: " .. WA_ClassColorName(sender) .. " equips " .. select(2, GetItemInfo(id)) .. " for you") end
                return "success"
            end
        end
    else
        --SN.debug("fail", "No charges / Not found", "neckID", id)
        return "failed"
    end
end
function SN.retryEquipNeck()
    if SN.scheduledNeckID then
        local equipStatus = SN.equipNeck(SN.scheduledNeckID, SN.scheduledNeckSender)
        if equipStatus == "success" or equipStatus == "spec" or equipStatus == "failed" then
            SN.SendComms("EQUIP:" .. equipStatus, "WHISPER", SN.scheduledNeckSender)
        end
        -- stop rescheduling if not combat, dead or casting
        if not tContains({ "combat", "dead", "casting" }, equipStatus) then
            SN.scheduledNeckID = nil
            SN.scheduledNeckSender = nil
        end
        -- handle dead or casting reschedules
        if equipStatus == "dead" then
            SN.startRetryEquipNeckTimer(10)
        elseif equipStatus == "casting" then
            local _, _, _, _, _, endTime = UnitCastingInfo("player")
            SN.startRetryEquipNeckTimer(endTime / 1000 - GetTime() + .1)
        end
    end
end
function SN.startRetryEquipNeckTimer(seconds)
    -- only have one timer active at a time (prevents spamclick force equip while dead / casting)
    if not SN.retryTimer or SN.retryTimer.ends - GetTime() < 0 then
        SN.retryTimer = WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, seconds, "SUPPORT_NECKS", "RETRY_NECK_EQUIP")
    end
end

function SN.checkSpec()
    local activeGroup = GetActiveTalentGroup()
    local _, _, spent1, tree1 = GetTalentTabInfo(1, false, nil, activeGroup)
    local _, _, spent2, tree2 = GetTalentTabInfo(2, false, nil, activeGroup)
    local _, _, spent3, tree3 = GetTalentTabInfo(3, false, nil, activeGroup)
    local tree = spent1 > spent2 and spent1 > spent3 and tree1 or spent2 > spent3 and tree2 or tree3
    SN.specEnabled = SN.enabledOnSpec[tree]
    if SN.currentSpec ~= tree then
        -- spec updated or changed
        SN.currentSpec = tree
    end
    if not SN.currentSpec then
        NotifyInspect("player")
        return
    end
    -- check inactive spec if player should even send any information (activeGroup: 1 <-> 2)
    if not SN.specEnabled and not SN.charEnabled then
        local _, _, spent1, tree1 = GetTalentTabInfo(1, false, nil, -activeGroup + 3)
        local _, _, spent2, tree2 = GetTalentTabInfo(2, false, nil, -activeGroup + 3)
        local _, _, spent3, tree3 = GetTalentTabInfo(3, false, nil, -activeGroup + 3)
        local tree = spent1 > spent2 and spent1 > spent3 and tree1 or spent2 > spent3 and tree2 or tree3
        SN.charEnabled = SN.enabledOnSpec[tree]
    else
        -- automatically set true if active spec is enabled
        SN.charEnabled = true
    end
    if SN.charEnabled and UnitInRaid("player") then
        aura_env.SendNeckInfos()
    end
end

---------- GUI ----------
function SN.updateGUI(allstates)
    local GUIchanged = false
    -- clear old states
    for unitName, state in pairs(allstates) do
        -- check if still in raid
        local unitNameInRaid = false
        for unit in WA_IterateGroupMembers() do
            if UnitName(unit) == unitName then unitNameInRaid = true end
        end
        if not unitNameInRaid then SN.roster[unitName] = nil end
        -- remove offlines
        if not UnitIsConnected(unitName) then SN.roster[unitName] = nil end
        -- check if state should be removed
        if not SN.roster[unitName] or SN.ignoreThisSession[unitName] then
            state.show = false
            state.changed = true
            GUIchanged = true
        end
    end
    -- -- suppress new states if on ignore list
    -- for unitName, unitNeckInfo in pairs(SN.roster) do
    --     if SN.ignoreThisSession[unitName] then SN.roster[unitName] = nil end
    -- end
    -- get own subgroup
    local groupInfo = {}
    local myRank, myGroup = 0, 0
    for i = 1, GetNumRaidMembers() do
        local raidName, raidRank, subgroup = GetRaidRosterInfo(i)
        if SN.roster[raidName] then
            groupInfo[raidName] = {
                rank = raidRank,
                group = subgroup,
            }
        end
        if raidName == UnitName("player") then
            myRank = raidRank
            myGroup = subgroup
        end
    end
    -- create / update states
    for unitName, unitNeckInfo in pairs(SN.roster) do
        -- suppress ignored players
        if not SN.ignoreThisSession[unitName] then
            local currentNeckInfo = unitNeckInfo.currentNeck
            local supportNeckEquipped = SN.necks[currentNeckInfo.id] or false
            local supportNeckActive = GetTime() < currentNeckInfo.startTime + currentNeckInfo.duration
            local expirationTime, duration = 0, 0
            if supportNeckActive then
                -- if currently active -> display remaining time
                expirationTime = currentNeckInfo.startTime + currentNeckInfo.duration
                duration = currentNeckInfo.duration
            elseif unitNeckInfo[currentNeckInfo.id] then
                -- if currently inactive -> display time till ready
                expirationTime = unitNeckInfo[currentNeckInfo.id].startTime + unitNeckInfo[currentNeckInfo.id].duration
                duration = unitNeckInfo[currentNeckInfo.id].duration
            end
            
            if not allstates[unitName] then
                allstates[unitName] = {
                    name = unitName,
                    unitNameColored = WA_ClassColorName(unitName),
                    isMe = unitName == UnitName("player"),
                    supportNeckEquipped = supportNeckEquipped,
                    icon = supportNeckEquipped and SN.neckIcons[currentNeckInfo.id] or "",
                    charges = currentNeckInfo.charges,
                    specEnabled = unitNeckInfo.specEnabled,
                    index = 5 - groupInfo[unitName].group, -- invert sorting (group 5 first)
                    group = groupInfo[unitName].group,
                    rank = groupInfo[unitName].rank,
                    neckInfos = unitNeckInfo, -- removed deepCopy
                    supportNeckActive = supportNeckActive,
                    progressType = "timed",
                    autoHide = false,
                    expirationTime = expirationTime,
                    duration = duration,
                    changed = true,
                    show = SN.config.showGUI and not (SN.config.myGroupOnly and myGroup ~= groupInfo[unitName].group),
                }
                GUIchanged = true
            else
                local updates = {
                    supportNeckEquipped = supportNeckEquipped,
                    icon = supportNeckEquipped and SN.neckIcons[currentNeckInfo.id] or "",
                    charges = currentNeckInfo.charges,
                    specEnabled = unitNeckInfo.specEnabled,
                    index = 5 - groupInfo[unitName].group, -- invert sorting
                    group = groupInfo[unitName].group,
                    rank = groupInfo[unitName].rank,
                    neckInfos = unitNeckInfo, -- Direct assignment; assume `unitNeckInfo` is already fresh
                    supportNeckActive = supportNeckActive,
                    expirationTime = expirationTime,
                    duration = duration,
                    show = SN.config.showGUI and not (SN.config.myGroupOnly and myGroup ~= groupInfo[unitName].group)
                }
                
                -- Check for updates and apply
                if updateState(allstates[unitName], updates) then
                    allstates[unitName].changed = true
                    GUIchanged = true
                    if SN.config.showGUI then
                        WeakAuras.ScanEvents("SUPPORT_NECKS_ICONS", unitName, unitNeckInfo)
                    end
                end
            end
        end
    end
    -- reset ignore icon
    WeakAuras.ScanEvents("SUPPORT_NECKS_RESET_IGNORE", next(SN.ignoreThisSession) ~= nil and UnitInRaid("player"))
    -- reminder icon
    if SN.roster[UnitName("player")] then
        local myCurrentNeckInfo = SN.roster[UnitName("player")].currentNeck
        local mySupportNeckEquipped = SN.necks[myCurrentNeckInfo.id] or false
        local mySupportNeckActive = GetTime() < myCurrentNeckInfo.startTime + myCurrentNeckInfo.duration
        if mySupportNeckEquipped and not mySupportNeckActive then
            local myCurrentNeckCdInfo = SN.roster[UnitName("player")][myCurrentNeckInfo.id]
            WeakAuras.ScanEvents("SUPPORT_NECKS_REMINDER", myCurrentNeckInfo.id, myCurrentNeckCdInfo.startTime + myCurrentNeckCdInfo.duration, myCurrentNeckCdInfo.duration)
        elseif not mySupportNeckEquipped or mySupportNeckActive then
            WeakAuras.ScanEvents("SUPPORT_NECKS_REMINDER", nil, nil, nil)
        end
    else
        -- clear icon if player not in roster anymore
        WeakAuras.ScanEvents("SUPPORT_NECKS_REMINDER", nil, nil, nil)
    end
    return GUIchanged
end

---- Addon Msg Comms ----
function SN.SendVersion(target)
    SN.SendComms("VERSION:" .. SN.version, target and "WHISPER" or "RAID", target)
end
function SN.RequestVersion()
    SN.SendComms("REQUEST_VERSION", "RAID")
end
function SN.ReceiveVersion(version, sender)
    --SN.debug("success", "Received Version from " .. WA_ClassColorName(sender))
    if not SN.versionControl[sender] or SN.versionControl[sender] ~= version then
        SN.versionControl[sender] = version
        if not SN.config.suppressVersionAnnounce then
            print("SN: " .. WA_ClassColorName(sender) .. " " .. version)
        end
    end
end

function SN.SendNeckInfos(target)
    --SN.debug("success", "Sending Neck Infos", "Charges", SN.neckCharges, "Cds", SN.neckCds)
    local infoString = "INFO:"
    -- relative GetTime() to syncronize clocks
    infoString = infoString .. GetTime() .. "_"
    -- bool if char is on support spec -> enable or disable for others
    infoString = infoString .. (SN.specEnabled and 1 or 0) .. "_"
    -- add information about current equipped neck with active time
    if SN.currentNeck.id and SN.currentNeck.charges then
        infoString = infoString .. SN.currentNeck.id .. "_" .. SN.currentNeck.charges .. "_" ..
        SN.currentNeck.startTime .. "_" .. SN.currentNeck.duration
    else
        infoString = infoString .. "0_0_0_0"
    end
    -- add information about all necks, charges and cds
    local supportNecksAvailable = false
    for id, _ in pairs(SN.necks) do
        if SN.neckCharges[id] and SN.neckCharges[id] > 0 and SN.neckCds[id] then
            supportNecksAvailable = true
            infoString = infoString .. "#" .. id .. "_" .. SN.neckCharges[id] .. "_" ..
            SN.neckCds[id].startTime .. "_" .. SN.neckCds[id].duration
        end
    end
    -- only send if support necks are available and char can spec into support role or neck is active
    if (supportNecksAvailable and SN.charEnabled) or SN.currentNeck.id then
        SN.SendComms(infoString, target and "WHISPER" or "RAID", target)
    else
        SN.SendCancelInfo()
    end
end
function SN.SendCancelInfo()
    SN.SendComms("CANCEL_INFO", "RAID")
end
function SN.RequestNeckInfos()
    SN.SendComms("REQUEST_INFO", "RAID")
end
function SN.ReceiveNeckInfo(info, sender)
    -- clear previous info (neck got deleted or removed from inventory)
    SN.roster[sender] = {}
    --"???#24121_10_0_0#24114_1_4213053_30#24116_5_0_0"
    local info = { strsplit("#", info) }
    local activeInfo = info[1]
    local relativeGetTime, specEnabled, id, charges, startTime, duration = strsplit("_", activeInfo)
    SN.roster[sender].specEnabled = tonumber(specEnabled) == 1 and true or false
    SN.roster[sender].currentNeck = {
        id = tonumber(id),
        charges = tonumber(charges),
        startTime = tonumber(startTime) == 0 and 0 or tonumber(startTime) - tonumber(relativeGetTime) + GetTime(),
        duration = tonumber(duration),
    }
    for i = 2, #info do
        --"24114_1_4213053_30"
        local id, charges, startTime, duration = strsplit("_", info[i])
        SN.roster[sender][tonumber(id)] = {
            charges = tonumber(charges),
            startTime = tonumber(startTime) == 0 and 0 or tonumber(startTime) - tonumber(relativeGetTime) + GetTime(),
            duration = tonumber(duration),
        }
    end
    --SN.debug("notification1", "Neck INFO", "SN.roster", SN.roster)
    WeakAuras.ScanEvents("SUPPORT_NECKS", "UPDATE_GUI", "ReceiveNeckInfo")
end
function SN.ReceiveCancelInfo(sender)
    SN.roster[sender] = nil
    WeakAuras.ScanEvents("SUPPORT_NECKS", "UPDATE_GUI", "ReceiveCancelInfo")
end

function SN.SendEquipCommand(id, target)
    -- only allow raidlead and assistant to send equip comms (except for oneself)
    if not IsRaidOfficer() and target ~= UnitName("player") and UnitName("player") ~= "Draintrain" then
        print("SN: Forcing necks for other players requires Assistant or Raidlead")
        return
    end
    if not SN.roster[target] or not SN.roster[target].specEnabled then
        print("SN: Forcing necks only allowed on Tanks and Heals")
        return
    end
    SN.SendComms("REQUEST_EQUIP:" .. id, "WHISPER", target)
end
function SN.ReceiveEquipCommand(id, sender)
    local equipStatus = SN.equipNeck(id, sender)
    if tContains({ "failed", "spec", "success", "combat", "dead", "casting" }, equipStatus) then
        SN.SendComms("EQUIP:" .. equipStatus, "WHISPER", sender)
    end
    -- reschedule if combat, dead or casting
    if tContains({ "combat", "dead", "casting" }, equipStatus) then
        if SN.scheduledNeckSender and SN.scheduledNeckSender ~= sender then
            -- inform previous sender
            SN.SendComms("EQUIP:overwritten by " .. sender, "WHISPER", SN.scheduledNeckSender)
        end
        SN.scheduledNeckID = id
        SN.scheduledNeckSender = sender
        -- handle dead or casting reschedules
        if equipStatus == "dead" then
            SN.startRetryEquipNeckTimer(10)
        elseif equipStatus == "casting" then
            local _, _, _, _, _, endTime = UnitCastingInfo("player")
            SN.startRetryEquipNeckTimer(endTime / 1000 - GetTime() + .1)
        end
    else
        -- reset schedule equipping event (new equip command received and executed before schedule check)
        SN.scheduledNeckID = nil
        SN.scheduledNeckSender = nil
    end
end
function SN.ReceiveEquipFeedback(feedback, sender)
    local colorCode = "ffffffff"
    if feedback == "success" then
        feedback = WrapTextInColorCode(feedback, "ff00ff00")
    elseif feedback == "failed" or feedback == "spec" then
        feedback = WrapTextInColorCode(feedback, "ffff0000")
    elseif tContains({ "combat", "dead", "casting" }, feedback) then
        feedback = WrapTextInColorCode(feedback, "ffffff00")
    elseif strfind(feedback, "overwritten") then
        feedback = { strsplit(" ", feedback) }
        feedback[1] = WrapTextInColorCode(feedback[1], "ffff0000")
        feedback[3] = WA_ClassColorName(feedback[3])
        feedback = strjoin(" ", unpack(feedback))
    end
    print("SN: Equipping for " .. WA_ClassColorName(sender) .. ": " .. feedback)
end

function SN.SendComms(msg, channel, target)
    SendAddonMessage("SN", msg, channel, target)
end
function SN.ReceiveComms(msg, sender, channel)
    --print(sender .. channel .. "-" .. msg)
    SN.debug("notification1", "Comms", "sender", sender, "channel", channel, "msg", msg)
    local instruction, payload = strsplit(":", msg)
    if instruction == "REQUEST_VERSION" and sender ~= UnitName("player") then
        SN.SendVersion(sender)
    elseif instruction == "VERSION" then
        SN.ReceiveVersion(payload, sender)
    elseif instruction == "REQUEST_EQUIP" then
        SN.ReceiveEquipCommand(tonumber(payload), sender)
    elseif instruction == "EQUIP" then
        SN.ReceiveEquipFeedback(payload, sender)
    elseif instruction == "REQUEST_INFO" and sender ~= UnitName("player") then
        SN.SendNeckInfos(sender)
    elseif instruction == "INFO" then
        SN.ReceiveNeckInfo(payload, sender)
    elseif instruction == "CANCEL_INFO" then
        SN.ReceiveCancelInfo(sender)
    end
end




--