-- WotLK 3.3.5a / Bunny67 WeakAuras 4.0.0. Actions -> On Init.
local KEY = "WA_BraveryConverterV1"
local S = _G[KEY] or {}
_G[KEY], aura_env.bravery = S, S
S.enabled = true
if S.autoWinter == nil then S.autoWinter = true end
S.cfg = {npc = "Consumables", item = 45706, cost = 100,
    gain = 2000, cap = 75000, reserve = 1, unique = 5, timeout = 8,
winterItem = 44115, winterCost = 2500, shardItem = 6265, shardLimit = 32}
-- reserve=1 keeps honor strictly BELOW 75000. Set 0 to allow exactly 75000.

function S:Honor()
    local value = GetHonorCurrency()
    return tonumber(value) or 0
end
function S:AP()
    local value = GetArenaCurrency()
    return tonumber(value) or 0
end
function S:Count(bank) return GetItemCount(self.cfg.item, bank) or 0 end
function S:Capacity()
    return math.max(0, math.floor((self.cfg.cap-self.cfg.reserve-self:Honor())/self.cfg.gain))
end
function S:IsNPC()
    local guid = UnitGUID("npc")
    return guid and UnitName("npc") == self.cfg.npc and (not self.guid or guid == self.guid)
end
function S:Merchant()
    return self.merchant and MerchantFrame and MerchantFrame:IsShown() and self:IsNPC()
end
function S:Message(text)
    self.message = text
end
function S:Stop(text)
    if self.pending then
        self.settleUntil = math.max(self.settleUntil or 0, GetTime()+0.5)
    end
    self.running, self.pending, self.waitMerchant = false, nil, nil
    self:Message(text or "Stopped")
end
function S:FindItem(itemID)
    itemID = itemID or self.cfg.item
    for i=1, GetMerchantNumItems() do
        local link = GetMerchantItemLink(i)
        if link and tonumber(link:match("item:(%d+)")) == itemID then return i end
    end
end
function S:ValidatePrice(i)
    local name, _, gold, quantity, stock, _, extended = GetMerchantItemInfo(i)
    if not name then return nil, "Waiting for merchant data" end
    if quantity ~= 1 or gold ~= 0 or not extended then
        return false, "Stopped: unexpected price or bundle size"
    end
    local honor, arena, items = GetMerchantItemCostInfo(i)
    if honor == nil or arena == nil or items == nil then return nil, "Waiting for price data" end
    if honor ~= 0 or arena ~= self.cfg.cost or items ~= 0 then
        return false, "Stopped: expected exactly 100 AP per token"
    end
    if stock == 0 then return false, "Stopped: merchant out of stock" end
    return true
end
function S:Cooldown()
    local start, duration, enabled = GetItemCooldown(self.cfg.item)
    if enabled == 0 then return math.huge end
    return math.max(0, (start or 0)+(duration or 0)-GetTime())
end
function S:TokenLocked()
    for bag=0,4 do
        for slot=1,GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag,slot)
            if link and tonumber(link:match("item:(%d+)")) == self.cfg.item then
                local _, _, locked = GetContainerItemInfo(bag,slot)
                if not locked then return false end
            end
        end
    end
    return true
end
function S:HaveBagSpace(itemID)
    itemID = itemID or self.cfg.item
    -- Conservative: either an unlocked partial stack or an empty normal bag slot.
    local maxStack = select(8, GetItemInfo(itemID))
    maxStack = tonumber(maxStack) or 1
    local family = GetItemFamily(itemID)
    family = tonumber(family) or 0
    for bag=0,4 do
        local free, kind = GetContainerNumFreeSlots(bag)
        if free and free > 0 and ((kind or 0) == 0
            or (family > 0 and bit.band(kind or 0, family) ~= 0)) then return true end
        for slot=1,GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag,slot)
            if link and tonumber(link:match("item:(%d+)")) == itemID then
                local _, count, locked = GetContainerItemInfo(bag,slot)
                if not locked and count and (tonumber(count) or 0) < maxStack then return true end
            end
        end
    end
    return false
end
function S:SelectMisc()
    self.waitMerchant = GetTime()+self.cfg.timeout
    self:Message("Opening Misc...")
    SelectGossipOption(6)
    return true
end
function S:BuyWinter()
    if not self.autoWinter or self:Honor() < self.cfg.winterCost then return false end
    local i = self:FindItem(self.cfg.winterItem)
    if not i then self:Stop("Stopped: Wintergrasp item 44115 not found"); return true end
    local name, _, gold, quantity, stock, _, extended = GetMerchantItemInfo(i)
    local honor, arena, items = GetMerchantItemCostInfo(i)
    if not name or gold ~= 0 or quantity ~= 1 or not extended
    or honor ~= self.cfg.winterCost or arena ~= 0 or items ~= 0 then
        self:Stop("Stopped: expected 2500 honor per Wintergrasp token"); return true
    end
    if stock == 0 then self:Stop("Stopped: Wintergrasp out of stock"); return true end
    if not self:HaveBagSpace(self.cfg.winterItem) then
        self:Stop("Stopped: no space for Wintergrasp tokens"); return true
    end
    self.pending = {kind="winter",count=GetItemCount(self.cfg.winterItem,false) or 0,
        honor=self:Honor(),ap=self:AP(),deadline=GetTime()+self.cfg.timeout}
    self:Message("Buying Wintergrasp token...")
    BuyMerchantItem(i,1)
    return true
end
function S:IsWarlock()
    local _, class = UnitClass("player")
    return class == "WARLOCK"
end
function S:StartShards()
    if not self.enabled or InCombatLockdown() or not self:IsNPC() or not self:IsWarlock() then return end
    if self.running or self.pending then
        self:Message("Stop the current operation first (right-click)"); return
    end
    self.guid = UnitGUID("npc")
    self.mode, self.running = "shards", true
    self:Message("Opening Reagents...")
    if self.gossip and GossipFrame and GossipFrame:IsShown() then
        self.waitMerchant = GetTime()+self.cfg.timeout
        SelectGossipOption(1)
    elseif self:Merchant() and self:FindItem(self.cfg.shardItem) then
        self.dataDeadline = GetTime()+self.cfg.timeout
    else
        self:Stop("Reopen Consumables, then click Soul Shards")
    end
end
function S:StepShards()
    if not self:IsWarlock() then self:Stop("Soul Shards: warlocks only"); return end
    local now, id = GetTime(), self.cfg.shardItem
    local count = GetItemCount(id,false) or 0
    if self.pending then
        if count >= self.pending.count+1 then
            self.pending = nil
        elseif now > self.pending.deadline then
            self:Stop("Stopped: no confirmed Soul Shard purchase")
        end
        return
    end
    if now < (self.settleUntil or 0) then return end
    if count >= self.cfg.shardLimit then
        self:Stop("Soul Shards: target reached ("..count.." / "..self.cfg.shardLimit..")"); return
    end
    if not self:HaveBagSpace(id) then
        self:Stop("Soul Shards: bags full ("..count..")"); return
    end
    local i = self:FindItem(id)
    if not i then
        if now > (self.dataDeadline or 0) then self:Stop("Soul Shard item 6265 not found") end
        return
    end
    local name, _, gold, quantity, stock, _, extended = GetMerchantItemInfo(i)
    if not name then return end
    -- Your screenshot shows free shards. Stop on any unexpected currency cost.
    if gold ~= 0 or quantity ~= 1 then self:Stop("Stopped: expected one free Soul Shard"); return end
    if extended then
        local honor, arena, items = GetMerchantItemCostInfo(i)
        if honor ~= 0 or arena ~= 0 or items ~= 0 then
            self:Stop("Stopped: Soul Shard has an unexpected currency cost"); return
        end
    end
    if stock == 0 then self:Stop("Soul Shards: merchant out of stock"); return end
    self.pending = {kind="shard",count=count,deadline=now+self.cfg.timeout}
    self:Message("Buying Soul Shards... ("..count..")")
    BuyMerchantItem(i,1)
end
function S:Start()
    if InCombatLockdown() or not self:IsNPC() then return end
    self.guid = UnitGUID("npc")
    self.running, self.pending, self.waitMerchant = true, nil, nil
    self.mode = "honor"
    self:Message("Starting...")
    if self:Capacity() == 0 and not (self.autoWinter and self:Honor() >= self.cfg.winterCost) then
        self:Stop("Honor limit: no full token fits")
    elseif self:Merchant() then
        self.dataDeadline = GetTime()+self.cfg.timeout
    elseif self.gossip and GossipFrame and GossipFrame:IsShown() then
        self:SelectMisc()
    else
        self:Stop("Open Consumables first")
    end
end
function S:Step()
    if not self.enabled or not self.running then return end
    if InCombatLockdown() or UnitIsDeadOrGhost("player") then
        self:Stop("Stopped: combat or death"); return
    end
    local now = GetTime()
    if self.waitMerchant then
        if now > self.waitMerchant then self:Stop("Stopped: merchant category did not open") end
        return
    end
    if not self:Merchant() then self:Stop("Stopped: merchant closed or changed"); return end
    if self.mode == "shards" then self:StepShards(); return end
    local p = self.pending
    if p then
        local count, honor, ap = self:Count(false), self:Honor(), self:AP()
        local done = p.kind == "buy" and count >= p.count+1 and ap <= p.ap-self.cfg.cost
        if p.kind == "use" then done = count <= p.count-1 and honor >= p.honor+self.cfg.gain end
        if p.kind == "winter" then
            done = (GetItemCount(self.cfg.winterItem,false) or 0) >= p.count+1
            and honor <= p.honor-self.cfg.winterCost
        end
        if done then
            self.pending = nil
        elseif now > p.deadline then
            self:Stop("Stopped: no confirmed "..p.kind.." result; check bags/currencies")
        end
        return -- Never issue a second request while a result is unconfirmed.
    end
    if now < (self.settleUntil or 0) then return end
    if self:BuyWinter() then return end
    local capacity, carried = self:Capacity(), self:Count(false)
    if capacity == 0 then self:Stop("Honor limit: no full token fits"); return end
    -- Existing carried tokens are reserved against the remaining honor capacity.
    if carried < math.min(self.cfg.unique, capacity) and self:AP() >= self.cfg.cost
    and self:Count(true) < self.cfg.unique then
        local i = self:FindItem()
        if not i then
            if now > (self.dataDeadline or 0) then self:Stop("Stopped: item 45706 not found") end
            return
        end
        local valid, reason = self:ValidatePrice(i)
        if not valid then
            if valid == false or now > (self.dataDeadline or 0) then self:Stop(reason) end
            return
        end
        if not self:HaveBagSpace() then
            if carried > 0 then self:Message("Use a token to make bag space")
            else self:Stop("Stopped: no usable bag space") end
            return
        end
        self.pending = {kind="buy", count=carried, honor=self:Honor(), ap=self:AP(),
        deadline=now+self.cfg.timeout}
        self:Message("Buying one token...")
        BuyMerchantItem(i,1)
        return
    end
    if carried > 0 then
        self:Message("Click to use one token")
    elseif self:AP() < self.cfg.cost then
        self:Stop("Done: fewer than 100 AP left")
    elseif self:Count(true) >= self.cfg.unique then
        self:Stop("Stopped: Unique (5), including bank")
    else
        self:Stop("Stopped: cannot buy more")
    end
end
function S:CanUse()
    return self.enabled and self.mode ~= "shards" and self.running and self:Merchant() and not self.pending
    and not self.waitMerchant and GetTime() >= (self.settleUntil or 0)
    and self:Capacity() > 0 and self:Count(false) > 0
    and self:Cooldown() == 0 and not self:TokenLocked()
    and not InCombatLockdown() and not UnitIsDeadOrGhost("player")
    and not CursorHasItem() and not SpellIsTargeting()
end
function S:Paint()
    if InCombatLockdown() then return end
    local visible = self.enabled and self:IsNPC() and
    ((self.gossip and GossipFrame and GossipFrame:IsShown()) or self:Merchant())
    if not visible then self.panel:Hide(); return end
    self.panel:Show()
    self.text:SetText(string.format("AP: %d  |  Honor: %d / %d\nBravery: %d  |  Can redeem: %d\n%s",
            self:AP(), self:Honor(), self.cfg.cap, self:Count(false), self:Capacity(), self.message or "Ready"))
    if self.running then
        local cd = self:Cooldown()
        if self.pending or self.waitMerchant then self.button:SetText("Please wait...")
        elseif cd > 0 and cd < math.huge then self.button:SetText(string.format("Cooldown: %.1fs",cd))
        elseif self:CanUse() then self.button:SetText("Use token (+2000 honor)")
        else self.button:SetText("Preparing / waiting...") end
    else self.button:SetText("Start AP -> Honor") end
end
function S:Shutdown()
    self.enabled = false
    self:Stop("Disabled")
    -- In combat, defer protected UI changes until PLAYER_REGEN_ENABLED.
    if not InCombatLockdown() and self.panel then
        self.button:SetAttribute("type", nil)
        self.panel:Hide()
    end
end
function S:Build()
    if self.panel then return true end
    if InCombatLockdown() then return false end
    local panel = CreateFrame("Frame",nil,UIParent)
    self.panel = panel
    panel:SetWidth(330); panel:SetHeight(self:IsWarlock() and 218 or 182)
    panel:SetPoint("CENTER",UIParent,"CENTER",240,-160)
    panel:SetFrameStrata("DIALOG")
    panel:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",tile=true,tileSize=16,edgeSize=16,
            insets={left=4,right=4,top=4,bottom=4}})
    local title = panel:CreateFontString(nil,"OVERLAY","GameFontNormal")
    title:SetPoint("TOP",0,-12); title:SetText("Commendation of Bravery")
    self.text = panel:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
    self.text:SetPoint("TOPLEFT",14,-34); self.text:SetWidth(302); self.text:SetHeight(54)
    self.text:SetJustifyH("CENTER")
    local check = CreateFrame("CheckButton",nil,panel,"UICheckButtonTemplate")
    self.winterCheck = check
    check:SetWidth(24); check:SetHeight(24)
    check:SetPoint("BOTTOMLEFT",panel,"BOTTOMLEFT",14,59)
    check:SetChecked(self.autoWinter)
    local label = check:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
    label:SetPoint("LEFT",check,"RIGHT",2,0)
    label:SetText("Convert all honor to Wintergrasp tokens")
    check:SetScript("OnClick",function(b)
            S.autoWinter = b:GetChecked() and true or false
            -- An already submitted purchase cannot be canceled.
            S:Paint()
    end)
    local button = CreateFrame("Button",nil,panel,"UIPanelButtonTemplate,SecureActionButtonTemplate")
    self.button = button
    button:SetWidth(292); button:SetHeight(28); button:SetPoint("BOTTOM",0,26)
    button:RegisterForClicks("LeftButtonUp","RightButtonUp")
    button:SetAttribute("unit","player")
    button:SetAttribute("item","item:"..self.cfg.item)
    -- item:ID resolves through UseItemByName; bag-slot actions can sell at a merchant.
    button:SetScript("PreClick",function(b,mouse)
            if InCombatLockdown() then return end
            b:SetAttribute("type",nil)
            b:SetAttribute("type1",nil); b:SetAttribute("type2",nil)
            if not S.enabled then return end
            if mouse == "RightButton" then S:Stop("Stopped by user"); return end
            if mouse ~= "LeftButton" then return end
            if not S.running then S:Start(); return end
            if S:CanUse() then
                S.pending = {kind="use",count=S:Count(false),honor=S:Honor(),ap=S:AP(),
                    deadline=GetTime()+S.cfg.timeout}
                S.settleUntil = GetTime()+0.3
                b:SetAttribute("type1","item")
            end
    end)
    button:SetScript("PostClick",function(b)
            if not InCombatLockdown() then b:SetAttribute("type1",nil) end
            S:Paint()
    end)
    -- Combat visibility is handled securely, not through an insecure Hide call.
    RegisterStateDriver(button,"visibility","[combat] hide; show")
    if self:IsWarlock() then
        local shardButton = CreateFrame("Button",nil,panel,"UIPanelButtonTemplate")
        self.shardButton = shardButton
        shardButton:SetWidth(292); shardButton:SetHeight(28)
        shardButton:SetPoint("TOP",panel,"TOP",0,-90)
        shardButton:SetText("Soul Shards: refill to 32")
        shardButton:RegisterForClicks("LeftButtonUp","RightButtonUp")
        shardButton:SetScript("OnClick",function(_,mouse)
                if InCombatLockdown() then return end
                if mouse == "RightButton" then S:Stop("Stopped by user")
                else S:StartShards() end
                S:Paint()
        end)
    end
    local tip = panel:CreateFontString(nil,"OVERLAY","GameFontDisableSmall")
    tip:SetPoint("BOTTOM",0,10); tip:SetText("One real click per token. Right-click: stop.")
    panel:Hide()
    return true
end
function S:Handle(event)
    if event == "PLAYER_REGEN_ENABLED" then
        if self:Build() then
            self.button:SetAttribute("type1",nil)
            if not self.enabled then self.panel:Hide() end
        end
    end
    if not self.enabled then return end
    if event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_REGEN_DISABLED" then
        self:Stop("Stopped"); self.gossip, self.merchant, self.guid = false,false,nil
    elseif event == "GOSSIP_SHOW" then
        self:Stop("Ready"); self.guid = nil
        self.gossip, self.merchant = self:IsNPC() and true or false, false
        if self.gossip then self.guid = UnitGUID("npc") end
    elseif event == "GOSSIP_CLOSED" then
        self.gossip = false
        if not self.waitMerchant and not self.merchant then self:Stop("Gossip closed") end
    elseif event == "MERCHANT_SHOW" then
        if self:IsNPC() then
            self.guid = UnitGUID("npc")
            self.merchant, self.gossip = true,false
            self.waitMerchant = nil
            self.dataDeadline = GetTime()+self.cfg.timeout
        else
            self.merchant = false; self:Stop("Wrong merchant")
        end
    elseif event == "MERCHANT_CLOSED" then
        self.merchant = false; self:Stop("Merchant closed")
    elseif event == "UI_ERROR_MESSAGE" and self.running and self.pending then
        -- Fail closed; do not keep buying after an unconfirmed error.
        self:Stop("Game error: check the red error message, then restart")
    end
    if self.panel then self:Paint() end
end
S:Stop("Ready")
S.gossip = GossipFrame and GossipFrame:IsShown() and UnitName("npc") == S.cfg.npc
S.merchant = MerchantFrame and MerchantFrame:IsShown() and UnitName("npc") == S.cfg.npc
S.guid = (S.gossip or S.merchant) and UnitGUID("npc") or nil
S:Build()
S.driver = S.driver or CreateFrame("Frame")
S.driver:UnregisterAllEvents()
for _,event in ipairs({"GOSSIP_SHOW","GOSSIP_CLOSED","MERCHANT_SHOW","MERCHANT_CLOSED",
"PLAYER_ENTERING_WORLD","PLAYER_REGEN_DISABLED","PLAYER_REGEN_ENABLED","UI_ERROR_MESSAGE"}) do
    S.driver:RegisterEvent(event)
end
S.driver:SetScript("OnEvent",function(_,event) S:Handle(event) end)
S.driver:SetScript("OnUpdate",function(_,elapsed)
        S.elapsed = (S.elapsed or 0)+elapsed
        if S.elapsed < 0.1 then return end
        S.elapsed = 0
        if not S.enabled then return end
        if not S.panel and not S:Build() then return end
        S:Step(); S:Paint()
end)
S:Paint()