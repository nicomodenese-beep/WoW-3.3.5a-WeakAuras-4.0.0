---@meta
-- SPDX-License-Identifier: GPL-2.0-only
-- Modified/generated LuaLS definitions, NOT an official upstream release.
-- Source: https://github.com/NoM0Re/WeakAuras-WotLK/tree/6d6b7a5c155f275672523c3d7b32a7fa766d6132
-- Snapshot: master, 2026-10-02; retrieved 2026-10-08. WeakAuras 5.22.0.
-- Original WeakAuras2 copyright: its authors and contributors.
-- WotLK modifications/documentation copyright: NoM0Re and contributors.
-- APIDocumentation framework originally by Blizzard Entertainment.
-- Full upstream GPLv2 license is embedded at the end of this file.
--
-- EDITOR DEFINITIONS ONLY. Never load this file in WoW or add it to a .toc!
-- Use VS Code's Lua extension (LuaLS), runtime.version = "Lua 5.1".
-- Includes all non-Awesome APIDocumentation entries.
-- Repository documentation is not a verified exhaustive client API specification.
-- Malformed source types use any; source file references are included for review.
-- Nilability/overloads in the source are incomplete; common aura calls are corrected.
-- Presence in this file does not make a protected API callable or bypass WA sandbox restrictions.
-- Project integration: WeakAuras helpers are maintained separately in weakauras-api.d.lua.


---@alias UnitToken string
---@alias WOWGUID string

---@class WoWAlpha: WoWAnimation
local WoWAlpha = {}

---@class WoWAnimation: WoWScriptObject, WoWParentedObject
local WoWAnimation = {}

---@class WoWAnimationGroup: WoWScriptObject, WoWParentedObject
local WoWAnimationGroup = {}

---@class WoWButton: WoWFrame
local WoWButton = {}

---@class WoWCheckButton: WoWButton
local WoWCheckButton = {}

---@class WoWColorSelect: WoWFrame
local WoWColorSelect = {}

---@class WoWControlPoint: WoWParentedObject
local WoWControlPoint = {}

---@class WoWCooldown: WoWFrame
local WoWCooldown = {}

---@class WoWDressUpModel: WoWPlayerModel
local WoWDressUpModel = {}

---@class WoWEditBox: WoWFrame, WoWFontInstance
local WoWEditBox = {}

---@class WoWFont: WoWFontInstance
local WoWFont = {}

---@class WoWFontString: WoWLayeredRegion, WoWFontInstance
local WoWFontString = {}

---@class WoWFrame: WoWVisibleRegion, WoWScriptObject
local WoWFrame = {}

---@class WoWGameTooltip: WoWFrame
local WoWGameTooltip = {}

---@class WoWMessageFrame: WoWFrame, WoWFontInstance
local WoWMessageFrame = {}

---@class WoWMinimap: WoWFrame
local WoWMinimap = {}

---@class WoWModel: WoWFrame
local WoWModel = {}

---@class WoWMovieFrame: WoWFrame
local WoWMovieFrame = {}

---@class WoWPath: WoWAnimation
local WoWPath = {}

---@class WoWPlayerModel: WoWModel
local WoWPlayerModel = {}

---@class WoWQuestPOIFrame: WoWFrame
local WoWQuestPOIFrame = {}

---@class WoWRotation: WoWAnimation
local WoWRotation = {}

---@class WoWScale: WoWAnimation
local WoWScale = {}

---@class WoWScrollFrame: WoWFrame
local WoWScrollFrame = {}

---@class WoWScrollingMessageFrame: WoWFrame, WoWFontInstance
local WoWScrollingMessageFrame = {}

---@class WoWSimpleHTML: WoWFrame, WoWFontInstance
local WoWSimpleHTML = {}

---@class WoWSlider: WoWFrame
local WoWSlider = {}

---@class WoWStatusBar: WoWFrame
local WoWStatusBar = {}

---@class WoWTabardModel: WoWPlayerModel
local WoWTabardModel = {}

---@class WoWTexture: WoWLayeredRegion
local WoWTexture = {}

---@class WoWTranslation: WoWAnimation
local WoWTranslation = {}

---@class WoWUIObject
local WoWUIObject = {}

---@class WoWScriptObject: WoWUIObject
local WoWScriptObject = {}

---@class WoWParentedObject: WoWUIObject
local WoWParentedObject = {}

---@class WoWRegion: WoWParentedObject
local WoWRegion = {}

---@class WoWVisibleRegion: WoWRegion
local WoWVisibleRegion = {}

---@class WoWFontInstance: WoWUIObject
local WoWFontInstance = {}

---@class WoWLayeredRegion: WoWVisibleRegion
local WoWLayeredRegion = {}


-- ==================== Achievement ====================
-- Source: APIDocumentation/Documentation/AchievementDocumentation.lua

---@param id number
function AddTrackedAchievement(id) end

---@return boolean canShow
function CanShowAchievementUI() end

function ClearAchievementComparisonUnit() end

---@param achievementID number
---@return number categoryID
function GetAchievementCategory(achievementID) end

---@param id number
---@return boolean completed
---@return number month
---@return number day
---@return number year
function GetAchievementComparisonInfo(id) end

---@param achievementID? number
---@param index? integer
---@param statisticID? number
---@return string description
---@return number type
---@return boolean completed
---@return number quantity
---@return number requiredQuantity
---@return string characterName
---@return number flags
---@return number assetID
---@return string quantityString
---@return number criteriaID
function GetAchievementCriteriaInfo(achievementID, index, statisticID) end

---@param category? number
---@param index? integer
---@param id? number
---@return number id
---@return string name
---@return number points
---@return boolean completed
---@return number month
---@return number day
---@return number year
---@return string description
---@return number flags
---@return string icon
---@return string rewardText
function GetAchievementInfo(category, index, id) end

---@param id number
---@return number id
---@return string name
---@return number points
---@return string description
---@return number flags
---@return string icon
---@return string rewardText
function GetAchievementInfoFromCriteria(id) end

---@param id number
---@return string link
function GetAchievementLink(id) end

---@param id number
---@return number count
function GetAchievementNumCriteria(id) end

---@param id number
---@return number count
function GetAchievementNumRewards(id) end

---@param id number
---@param index integer
---@return number points
function GetAchievementReward(id, index) end

---@param id number
---@return string name
---@return number parentID
---@return number flags
function GetCategoryInfo(id) end

---@return table categories
function GetCategoryList() end

---@param id number
---@return number numItems
---@return number numCompleted
function GetCategoryNumAchievements(id) end

---@return number points
function GetComparisonAchievementPoints() end

---@param id number
---@return number numCompleted
function GetComparisonCategoryNumAchievements(id) end

---@param id number
---@return string info
function GetComparisonStatistic(id) end

---@return any[] ...
function GetLatestCompletedAchievements() end

---@return any[] ...
function GetLatestCompletedComparisonAchievements() end

---@return any[] ...
function GetLatestUpdatedComparisonStats() end

---@return any[] ...
function GetLatestUpdatedStats() end

---@param id number
---@return number nextID
---@return boolean completed
function GetNextAchievement(id) end

---@return number total
---@return number completed
function GetNumComparisonCompletedAchievements() end

---@return number total
---@return number completed
function GetNumCompletedAchievements() end

---@return number count
function GetNumTrackedAchievements() end

---@param id number
---@return number previousID
function GetPreviousAchievement(id) end

---@param id number
---@return string info
function GetStatistic(id) end

---@return table categories
function GetStatisticsCategoryList() end

---@return number points
function GetTotalAchievementPoints() end

---@return any[] ...
function GetTrackedAchievements() end

---@param id number
---@return boolean isTracked
function IsTrackedAchievement(id) end

---@param id number
function RemoveTrackedAchievement(id) end

---@param unit UnitToken
---@return boolean success
function SetAchievementComparisonUnit(unit) end


-- ==================== Action ====================
-- Source: APIDocumentation/Documentation/ActionDocumentation.lua

---@param slot number
---@return boolean hasRange
function ActionHasRange(slot) end

---@param index integer
---@param unit? UnitToken
function CastPetAction(index, unit) end

---@param slot number
---@return boolean autocastAllowed
---@return boolean autocastEnabled
function GetActionAutocast(slot) end

---@param slot number
---@return number start
---@return number duration
---@return number enable
function GetActionCooldown(slot) end

---@param slot number
---@return number count
function GetActionCount(slot) end

---@param slot number
---@return string type
---@return number id
---@return string subType
---@return number spellID
function GetActionInfo(slot) end

---@param slot number
---@return string text
function GetActionText(slot) end

---@param slot number
---@return string texture
function GetActionTexture(slot) end

---@param index integer
---@return number start
---@return number duration
---@return number enable
function GetPetActionCooldown(index) end

---@param index integer
---@return string name
---@return string subtext
---@return string texture
---@return boolean isToken
---@return boolean isActive
---@return boolean autoCastAllowed
---@return boolean autoCastEnabled
function GetPetActionInfo(index) end

---@param index integer
---@return boolean usable
function GetPetActionSlotUsable(index) end

---@return boolean petActionsUsable
function GetPetActionsUsable() end

---@param slot number
---@return boolean hasAction
function HasAction(slot) end

---@param slot number
---@return number inRange
function IsActionInRange(slot) end

---@param slot number
---@return boolean isAttack
function IsAttackAction(slot) end

---@param slot number
---@return boolean isRepeating
function IsAutoRepeatAction(slot) end

---@param slot number
---@return boolean isConsumable
function IsConsumableAction(slot) end

---@param slot number
---@return boolean isCurrent
function IsCurrentAction(slot) end

---@param slot number
---@return boolean isEquipped
function IsEquippedAction(slot) end

---@param slot number
---@return boolean isStackable
function IsStackableAction(slot) end

---@param slot number
---@return boolean isUsable
---@return boolean notEnoughMana
function IsUsableAction(slot) end

---@param slot number
function PickupAction(slot) end

---@param index integer
function PickupPetAction(index) end

---@param slot number
function PlaceAction(slot) end

---@param index integer
function TogglePetAutocast(index) end

---@param slot number
---@param target string
---@param button? string
function UseAction(slot, target, button) end


-- ==================== ActionBar ====================
-- Source: APIDocumentation/Documentation/ActionbarDocumentation.lua

---@param page number
function ChangeActionBarPage(page) end

---@return number page
function GetActionBarPage() end

---@return boolean showBar1
---@return boolean showBar2
---@return boolean showBar3
---@return boolean showBar4
function GetActionBarToggles() end

---@return number offset
function GetBonusBarOffset() end

---@param index integer
---@return string texture
---@return string name
function GetPossessInfo(index) end

---@return boolean isVisible
function IsPossessBarVisible() end

---@param bar1 1|nil
---@param bar2 1|nil
---@param bar3 1|nil
---@param bar4 1|nil
---@param alwaysShow 1|nil
function SetActionBarToggles(bar1, bar2, bar3, bar4, alwaysShow) end


-- ==================== Addon-related ====================
-- Source: APIDocumentation/Documentation/AddonRelatedDocumentation.lua

---@param name? string
---@param index? integer
function DisableAddOn(name, index) end

function DisableAllAddOns() end

---@param index? integer
---@param name? string
function EnableAddOn(index, name) end

function EnableAllAddOns() end

---@param name? string
---@param index? integer
---@return any[] ...
function GetAddOnDependencies(name, index) end

---@param index? integer
---@param name? string
---@return string name
---@return string title
---@return string notes
---@return boolean enabled
---@return boolean loadable
---@return string reason
---@return string security
function GetAddOnInfo(index, name) end

---@param index? integer
---@param name? string
---@param variable? string
---@return string data
function GetAddOnMetadata(index, name, variable) end

---@return number numAddons
function GetNumAddOns() end

---@param panelName? string
---@param panel? table
function InterfaceOptionsFrame_OpenToCategory(panelName, panel) end

---@param panel table
function InterfaceOptions_AddCategory(panel) end

---@param name? string
---@param index? integer
---@return boolean isLod
function IsAddOnLoadOnDemand(name, index) end

---@param name? string
---@param index? integer
---@return boolean loaded
function IsAddOnLoaded(name, index) end

---@param name? string
---@param index? integer
---@return number loaded
---@return string reason
function LoadAddOn(name, index) end

function ResetDisabledAddOns() end

---@param prefix string
---@param message string
---@param type? string
---@param target? string
function SendAddonMessage(prefix, message, type, target) end


-- ==================== Alpha ====================
-- Source: APIDocumentation/Documentation/AlphaAPIDocumentation.lua

---@return number change
function WoWAlpha:GetChange() end

---@param change number
function WoWAlpha:SetChange(change) end


-- ==================== Animation ====================
-- Source: APIDocumentation/Documentation/AnimationAPIDocumentation.lua

---@return number duration
function WoWAnimation:GetDuration() end

---@return number elapsed
function WoWAnimation:GetElapsed() end

---@return number delay
function WoWAnimation:GetEndDelay() end

function WoWAnimation:GetMaxFramerate() end

---@return number order
function WoWAnimation:GetOrder() end

---@return number progress
function WoWAnimation:GetProgress() end

---@return number progress
function WoWAnimation:GetProgressWithDelay() end

---@return WoWRegion region
function WoWAnimation:GetRegionParent() end

---@return number progress
function WoWAnimation:GetSmoothProgress() end

---@return any smoothType
function WoWAnimation:GetSmoothing() end

---@return number delay
function WoWAnimation:GetStartDelay() end

---@return boolean delaying
function WoWAnimation:IsDelaying() end

---@return boolean done
function WoWAnimation:IsDone() end

---@return boolean paused
function WoWAnimation:IsPaused() end

---@return boolean playing
function WoWAnimation:IsPlaying() end

---@return boolean stopped
function WoWAnimation:IsStopped() end

function WoWAnimation:Pause() end

function WoWAnimation:Play() end

---@param duration number
function WoWAnimation:SetDuration(duration) end

---@param delay number
function WoWAnimation:SetEndDelay(delay) end

function WoWAnimation:SetMaxFramerate() end

---@param order number
function WoWAnimation:SetOrder(order) end

---@param animGroup WoWAnimationGroup
---@param animGroupName string
function WoWAnimation:SetParent(animGroup, animGroupName) end

function WoWAnimation:SetSmoothProgress() end

--- Source signature: SetSmoothing(smoothType: value)
---@param smoothType any
function WoWAnimation:SetSmoothing(smoothType) end

---@param delay number
function WoWAnimation:SetStartDelay(delay) end

function WoWAnimation:Stop() end


-- ==================== AnimationGroup ====================
-- Source: APIDocumentation/Documentation/AnimationGroupAPIDocumentation.lua

---@param animationType string
---@param name string
---@param inheritsFrom string
---@return WoWAnimation object
function WoWAnimationGroup:CreateAnimation(animationType, name, inheritsFrom) end

function WoWAnimationGroup:Finish() end

---@return any[] ...
function WoWAnimationGroup:GetAnimations() end

---@return number duration
function WoWAnimationGroup:GetDuration() end

---@return number x
---@return number y
function WoWAnimationGroup:GetInitialOffset() end

---@return any loopState
function WoWAnimationGroup:GetLoopState() end

---@return any loopType
function WoWAnimationGroup:GetLooping() end

---@return number maxOrder
function WoWAnimationGroup:GetMaxOrder() end

---@return number progress
function WoWAnimationGroup:GetProgress() end

---@return boolean done
function WoWAnimationGroup:IsDone() end

---@return boolean paused
function WoWAnimationGroup:IsPaused() end

---@return boolean isPending
function WoWAnimationGroup:IsPendingFinish() end

---@return boolean playing
function WoWAnimationGroup:IsPlaying() end

function WoWAnimationGroup:Pause() end

function WoWAnimationGroup:Play() end

---@param x number
---@param y number
function WoWAnimationGroup:SetInitialOffset(x, y) end

--- Source signature: SetLooping(loopType: instantly resetting from the final state to the initial state between repetitions)
---@param loopType any
function WoWAnimationGroup:SetLooping(loopType) end

function WoWAnimationGroup:Stop() end


-- ==================== Arena ====================
-- Source: APIDocumentation/Documentation/ArenaDocumentation.lua

function AcceptArenaTeam() end

---@param team number
function ArenaTeamDisband(team) end

---@param team number
---@param name string
function ArenaTeamInviteByName(team, name) end

---@param team number
function ArenaTeamLeave(team) end

---@param team number
function ArenaTeamRoster(team) end

---@param team number
---@param name string
function ArenaTeamSetLeaderByName(team, name) end

---@param team number
---@param name string
function ArenaTeamUninviteByName(team, name) end

---@param teamSize number
---@return number teamID
function ArenaTeam_GetTeamSizeID(teamSize) end

function CloseArenaTeamRoster() end

function DeclineArenaTeam() end

---@param team number
---@return string teamName
---@return number teamSize
---@return number teamRating
---@return number teamPlayed
---@return number teamWins
---@return number seasonTeamPlayed
---@return number seasonTeamWins
---@return number playerPlayed
---@return number seasonPlayerPlayed
---@return number teamRank
---@return number playerRating
---@return number bg_red
---@return number bg_green
---@return number bg_blue
---@return number emblem
---@return number emblem_red
---@return number emblem_green
---@return number emblem_blue
---@return number border
---@return number border_red
---@return number border_green
---@return number border_blue
function GetArenaTeam(team) end

function GetArenaTeamGdfInfo() end

---@param team number
---@param index integer
---@return string name
---@return number rank
---@return number level
---@return string class
---@return boolean online
---@return number played
---@return number win
---@return number seasonPlayed
---@return number seasonWin
---@return number rating
function GetArenaTeamRosterInfo(team, index) end

---@param team number
---@return integer index
function GetArenaTeamRosterSelection(team) end

---@return boolean showOffline
function GetArenaTeamRosterShowOffline() end

---@return number season
function GetCurrentArenaSeason() end

---@return number amount
function GetMaxArenaCurrency() end

---@return number numOpponents
function GetNumArenaOpponents() end

---@param teamindex integer
---@param showOffline boolean
---@return number numMembers
function GetNumArenaTeamMembers(teamindex, showOffline) end

---@return number season
function GetPreviousArenaSeason() end

---@return boolean isArena
---@return boolean isRegistered
function IsActiveBattlefieldArena() end

---@param team number
---@return boolean isCaptain
function IsArenaTeamCaptain(team) end

---@return boolean isInTeam
function IsInArenaTeam() end

---@param team number
---@param index integer
function SetArenaTeamRosterSelection(team, index) end

---@param enable boolean
function SetArenaTeamRosterShowOffline(enable) end

---@param sortType string
function SortArenaTeamRoster(sortType) end


-- ==================== Auction ====================
-- Source: APIDocumentation/Documentation/AuctionDocumentation.lua

---@param runTime number
---@return number deposit
function CalculateAuctionDeposit(runTime) end

---@param index integer
---@return boolean canCancel
function CanCancelAuction(index) end

---@param list string
---@return boolean canQuery
---@return boolean canMassQuery
function CanSendAuctionQuery(list) end

---@param index integer
function CancelAuction(index) end

function ClickAuctionSellItemButton() end

function CloseAuctionHouse() end

---@return number rate
function GetAuctionHouseDepositRate() end

---@param classIndex integer
---@param subClassIndex integer
---@return string token
---@return boolean display
---@return any[] ...
function GetAuctionInvTypes(classIndex, subClassIndex) end

---@return any[] ...
function GetAuctionItemClasses() end

---@param list string
---@param index integer
---@return string name
---@return string texture
---@return number count
---@return integer quality
---@return 1|nil canUse
---@return number level
---@return number minBid
---@return number minIncrement
---@return number buyoutPrice
---@return number bidAmount
---@return 1|nil highestBidder
---@return string owner
---@return 1|nil sold
function GetAuctionItemInfo(list, index) end

---@param list string
---@param index integer
---@return string link
function GetAuctionItemLink(list, index) end

---@param classIndex integer
---@return any[] ...
function GetAuctionItemSubClasses(classIndex) end

---@param list string
---@param index integer
---@return number duration
function GetAuctionItemTimeLeft(list, index) end

---@return string name
---@return string texture
---@return number count
---@return integer quality
---@return 1|nil canUse
---@return number price
function GetAuctionSellItemInfo() end

---@param list string
---@param index integer
---@return string criterion
---@return boolean reverse
function GetAuctionSort(list, index) end

function GetBidderAuctionItems() end

---@param index integer
---@return string invoiceType
---@return string itemName
---@return string playerName
---@return number bid
---@return number buyout
---@return number deposit
---@return number consignment
---@return number moneyDelay
---@return number etaHour
---@return number etaMin
function GetInboxInvoiceInfo(index) end

---@param list string
---@return number numBatchAuctions
---@return number totalAuctions
function GetNumAuctionItems(list) end

function GetOwnerAuctionItems() end

---@param list string
---@return integer index
function GetSelectedAuctionItem(list) end

---@param list string
---@param sort string
---@return boolean isReversed
---@return boolean isSorted
function IsAuctionSortReversed(list, sort) end

---@param list string
---@param index integer
---@param bid number
function PlaceAuctionBid(list, index, bid) end

---@param name string
---@param minLevel number
---@param maxLevel number
---@param invTypeIndex integer
---@param classIndex integer
---@param subClassIndex integer
---@param page number
---@param isUsable boolean
---@param minQuality integer
---@param getAll? boolean
function QueryAuctionItems(name, minLevel, maxLevel, invTypeIndex, classIndex, subClassIndex, page, isUsable, minQuality, getAll) end

---@param list string
---@param index integer
function SetSelectedAuctionItem(list, index) end

---@param list string
function SortAuctionApplySort(list) end

---@param list string
function SortAuctionClearSort(list) end

---@param type string
---@param sort number
function SortAuctionItems(type, sort) end

---@param list string
---@param sort number
---@param reversed boolean
function SortAuctionSetSort(list, sort, reversed) end

---@param minBid number
---@param buyoutPrice number
---@param runTime number
---@param stackSize number
---@param numStacks number
function StartAuction(minBid, buyoutPrice, runTime, stackSize, numStacks) end


-- ==================== Bank ====================
-- Source: APIDocumentation/Documentation/BankDocumentation.lua

---@param buttonID number
---@param isBag? boolean
---@return number inventoryID
function BankButtonIDToInvSlotID(buttonID, isBag) end

function CloseBankFrame() end

---@param location? number
---@return boolean player
---@return boolean bank
---@return boolean bags
---@return number location_or_slot
---@return number bag
function EquipmentManager_UnpackLocation(location) end

---@return number cost
function GetBankSlotCost() end

---@return number numSlots
---@return boolean isFull
function GetNumBankSlots() end

function PurchaseSlot() end


-- ==================== Barbershop ====================
-- Source: APIDocumentation/Documentation/BarbershopDocumentation.lua

function ApplyBarberShopStyle() end

function BarberShopReset() end

---@return boolean canAlter
function CanAlterSkin() end

function CancelBarberShop() end

---@param styleIndex integer
---@return string name
---@return string unused
---@return number cost
---@return boolean isCurrent
function GetBarberShopStyleInfo(styleIndex) end

---@return number cost
function GetBarberShopTotalCost() end

---@return string token
function GetFacialHairCustomization() end

---@return string token
function GetHairCustomization() end

---@param styleIndex integer
---@param reverse? boolean
function SetNextBarberShopStyle(styleIndex, reverse) end


-- ==================== Battle.net ====================
-- Source: APIDocumentation/Documentation/BattleNetDocumentation.lua

---@param friendIndex integer
---@return number presenceID
---@return string givenName
---@return string surname
---@return string toonName
---@return number toonID
---@return string client
---@return boolean isOnline
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText
---@return string noteText
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfo(friendIndex) end

---@param presenceID number
---@return number presenceID
---@return string givenName
---@return string surname
---@return string toonName
---@return number toonID
---@return string client
---@return boolean isOnline
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText
---@return string noteText
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfoByID(presenceID) end

---@param friendIndex integer
---@param toonIndex integer
---@return boolean unknown
---@return string toonName
---@return string client
---@return string realmName
---@return number faction
---@return string race
---@return string class
---@return string unknown
---@return string zoneName
---@return string level
---@return string gameText
---@return string broadcastText
---@return string broadcastTime
function BNGetFriendToonInfo(friendIndex, toonIndex) end

---@return number unknown
---@return number unknown
---@return string broadcastText
---@return boolean bnetAFK
---@return boolean bnetDND
function BNGetInfo() end

---@return boolean isEnabled
function BNGetMatureLanguageFilter() end

---@param friendIndex integer
---@return number numToons
function BNGetNumFriendToons(friendIndex) end

---@return number totalBNet
---@return number numBNetOnline
function BNGetNumFriends() end

---@return integer friendIndex
function BNGetSelectedFriend() end

---@param presenceID number
---@return boolean unknown
---@return string toonName
---@return string client
---@return string realmName
---@return number realmID
---@return number faction
---@return string race
---@return string class
---@return string unknown
---@return string zoneName
---@return string level
---@return string gameText
---@return string broadcastText
---@return string broadcastTime
function BNGetToonInfo(presenceID) end

---@param broadcastText string
function BNSetCustomMessage(broadcastText) end

---@param presenceID number
---@param note string
function BNSetFriendNote(presenceID, note) end

---@param enabled boolean
function BNSetMatureLanguageFilter(enabled) end


-- ==================== Battlefield ====================
-- Source: APIDocumentation/Documentation/BattlefieldDocumentation.lua

function AcceptAreaSpiritHeal() end

---@param index integer
---@param accept boolean
function AcceptBattlefieldPort(index, accept) end

---@return boolean canGroupJoin
function CanJoinBattlefieldAsGroup() end

function CancelAreaSpiritHeal() end

function CloseBattlefield() end

---@return number timeleft
function GetAreaSpiritHealerTime() end

function GetBattlefieldArenaFaction() end

---@param index integer
---@return number waitTime
function GetBattlefieldEstimatedWaitTime(index) end

---@param index integer
---@return number flagX
---@return number flagY
---@return string flagToken
function GetBattlefieldFlagPosition(index) end

---@return number timeLeft
function GetBattlefieldInstanceExpiration() end

---@param index integer
---@return number instanceID
function GetBattlefieldInstanceInfo(index) end

---@return number time
function GetBattlefieldInstanceRunTime() end

---@return number scale
function GetBattlefieldMapIconScale() end

---@param index integer
---@return number expiration
function GetBattlefieldPortExpiration(index) end

---@param index integer
---@return UnitToken unitX
---@return UnitToken unitY
---@return string name
function GetBattlefieldPosition(index) end

---@param index integer
---@return string name
---@return number killingBlows
---@return number honorableKills
---@return number deaths
---@return number honorGained
---@return number faction
---@return string race
---@return string class
---@return string classToken
---@return number damageDone
---@return number healingDone
---@return number bgRating
---@return number ratingChange
---@return number preMatchMMR
---@return number mmrChange
---@return string talentSpec
function GetBattlefieldScore(index) end

---@param index integer
---@param statIndex integer
---@return number columnData
function GetBattlefieldStatData(index, statIndex) end

---@param statIndex integer
---@return string text
---@return string icon
---@return string tooltip
function GetBattlefieldStatInfo(statIndex) end

---@param index integer
---@return string status
---@return string mapName
---@return number instanceID
---@return number bracketMin
---@return number bracketMax
---@return number teamSize
---@return boolean registeredMatch
function GetBattlefieldStatus(index) end

---@param index integer
---@return string teamName
---@return number teamRating
---@return number newTeamRating
function GetBattlefieldTeamInfo(index) end

---@param index integer
---@return number timeInQueue
function GetBattlefieldTimeWaited(index) end

---@param index integer
---@return number vehicleX
---@return number vehicleY
---@return string unitName
---@return boolean isPossessed
---@return string vehicleType
---@return number orientation
---@return boolean isPlayer
---@return boolean isAlive
function GetBattlefieldVehicleInfo(index) end

---@return number winner
function GetBattlefieldWinner() end

---@param index integer
---@return string name
---@return boolean canEnter
---@return boolean isHoliday
---@return number minlevel
function GetBattlegroundInfo(index) end

---@return number numFlags
function GetNumBattlefieldFlagPositions() end

---@return number numTeamMembers
function GetNumBattlefieldPositions() end

---@return number numScores
function GetNumBattlefieldScores() end

---@return number numStats
function GetNumBattlefieldStats() end

---@return number numVehicles
function GetNumBattlefieldVehicles() end

---@param index? integer
---@return number numBattlefields
function GetNumBattlefields(index) end

---@return number numBattlegrounds
function GetNumBattlegroundTypes() end

---@return number numMembers
function GetRealNumPartyMembers() end

---@return number numMembers
function GetRealNumRaidMembers() end

---@return integer index
function GetSelectedBattlefield() end

-- Additional source entry: APIDocumentation/Documentation/BattlefieldDocumentation.lua :: IsActiveBattlefieldArena()

---@return boolean isLeader
function IsRealPartyLeader() end

---@return boolean isLeader
function IsRealRaidLeader() end

---@param index number
---@param asGroup boolean
function JoinBattlefield(index, asGroup) end

function LeaveBattlefield() end

---@param name? string
---@param unit? UnitToken
---@return boolean isInactive
function PlayerIsPVPInactive(name, unit) end

---@param name? string
---@param unit? UnitToken
function ReportPlayerIsPVPAFK(name, unit) end

function RequestBattlefieldPositions() end

function RequestBattlefieldScoreData() end

---@param index integer
function RequestBattlegroundInstanceInfo(index) end

---@param faction number
function SetBattlefieldScoreFaction(faction) end

---@param index integer
function SetSelectedBattlefield(index) end

---@param show boolean
function ShowMiniWorldMapArrowFrame(show) end

---@param sortType string
function SortBattlefieldScoreData(sortType) end

---@param unit UnitToken
---@return number raidNum
function UnitInBattleground(unit) end

function GetBattlefieldInfo() end

function IsBattlefieldArena() end


-- ==================== Blizzard Internal ====================
-- Source: APIDocumentation/Documentation/BlizzardInternalDocumentation.lua

function AppendToFile() end

function CreateMiniWorldMapArrowFrame() end

function CreateWorldMapArrowFrame() end

function DeleteFile() end

function DetectWowMouse() end

function GMRequestPlayerInfo() end

function GetDebugStats() end

function GetDebugZoneMap() end

function GetGMStatus() end

function GetMapDebugObjectInfo() end

function GetNumMapDebugObjects() end

function HasDebugZoneMap() end

function IsDebugBuild() end

function PlayDance() end

function PositionMiniWorldMapArrowFrame() end

function PositionWorldMapArrowFrame() end

function ReadFile() end

function ResetPerformanceValues() end

function SetChannelWatch() end

function SetConsoleKey() end

function SetLayoutMode() end

function ShowWorldMapArrowFrame() end

function TargetDirectionEnemy() end

function TargetDirectionFinished() end

function TargetDirectionFriend() end

function TeleportToDebugObject() end

function ToggleCollision() end

function ToggleCollisionDisplay() end

function TogglePerformanceDisplay() end

function TogglePerformancePause() end

function TogglePerformanceValues() end

function TogglePlayerBounds() end

function TogglePortals() end

function ToggleTris() end

function UpdateWorldMapArrowFrames() end

function debugbreak() end

function debugdump() end

function debuginfo() end

function debugload() end

function debugprint() end

function debugtimestamp() end

---@param boolean? boolean
---@param userdata? userdata
---@return userdata userdata
function newproxy(boolean, userdata) end

function GetTexLodBias() end


-- ==================== Buff ====================
-- Source: APIDocumentation/Documentation/BuffDocumentation.lua

---@param slot number
function CancelItemTempEnchantment(slot) end

function CancelShapeshiftForm() end

---@overload fun(unit: UnitToken, name: string, rank?: string, filter?: string)
---@param unit UnitToken
---@param index number
---@param filter? string
function CancelUnitBuff(unit, index, filter) end

---@return boolean hasMainHandEnchant
---@return number mainHandExpiration
---@return number mainHandCharges
---@return boolean hasOffHandEnchant
---@return number offHandExpiration
---@return number offHandCharges
function GetWeaponEnchantInfo() end

--- 
--- Index and name/rank are alternative call forms. UnitBuff/UnitDebuff use the full 3.3.5 aura return tuple.
---@overload fun(unit: UnitToken, name: string, rank?: string, filter?: string): string?, string?, string?, number?, string?, number?, number?, UnitToken?, boolean?, boolean?, integer?
---@param unit UnitToken
---@param index number
---@param filter? string
---@return string|nil name
---@return string|nil rank
---@return string|nil icon
---@return number|nil count
---@return string|nil dispelType
---@return number|nil duration
---@return number|nil expires
---@return string|nil caster
---@return 1|nil isStealable
---@return boolean|nil shouldConsolidate
---@return number|nil spellID
function UnitAura(unit, index, filter) end

--- 
--- Index and name/rank are alternative call forms. UnitBuff/UnitDebuff use the full 3.3.5 aura return tuple.
---@overload fun(unit: UnitToken, name: string, rank?: string, filter?: string): string?, string?, string?, number?, string?, number?, number?, UnitToken?, boolean?, boolean?, integer?
---@param unit UnitToken
---@param index number
---@param filter? string
---@return string|nil name
---@return string|nil rank
---@return string|nil icon
---@return number|nil count
---@return string|nil dispelType
---@return number|nil duration
---@return number|nil expires
---@return string|nil caster
---@return 1|nil isStealable
---@return boolean|nil shouldConsolidate
---@return number|nil spellID
function UnitDebuff(unit, index, filter) end

--- 
--- Index and name/rank are alternative call forms. UnitBuff/UnitDebuff use the full 3.3.5 aura return tuple.
---@overload fun(unit: UnitToken, name: string, rank?: string, filter?: string): string?, string?, string?, number?, string?, number?, number?, UnitToken?, boolean?, boolean?, integer?
---@param unit UnitToken
---@param index number
---@param filter? string
---@return string|nil name
---@return string|nil rank
---@return string|nil icon
---@return number|nil count
---@return string|nil dispelType
---@return number|nil duration
---@return number|nil expires
---@return string|nil caster
---@return 1|nil isStealable
---@return boolean|nil shouldConsolidate
---@return number|nil spellID
function UnitBuff(unit, index, filter) end


-- ==================== Button ====================
-- Source: APIDocumentation/Documentation/ButtonAPIDocumentation.lua

--- Source signature: Click(button: value, down: bool)
---@param button any
---@param down boolean
function WoWButton:Click(button, down) end

function WoWButton:Disable() end

function WoWButton:Enable() end

---@return any state
function WoWButton:GetButtonState() end

---@return WoWFont font
function WoWButton:GetDisabledFontObject() end

---@return string|WoWTexture texture
function WoWButton:GetDisabledTexture() end

---@return WoWFontString fontstring
function WoWButton:GetFontString() end

---@return WoWFont font
function WoWButton:GetHighlightFontObject() end

---@return string|WoWTexture texture
function WoWButton:GetHighlightTexture() end

---@return WoWFont font
function WoWButton:GetNormalFontObject() end

---@return string|WoWTexture texture
function WoWButton:GetNormalTexture() end

---@return number x
---@return number y
function WoWButton:GetPushedTextOffset() end

---@return string|WoWTexture texture
function WoWButton:GetPushedTexture() end

---@return string text
function WoWButton:GetText() end

---@return number height
function WoWButton:GetTextHeight() end

---@return number width
function WoWButton:GetTextWidth() end

---@return 1|nil enabled
function WoWButton:IsEnabled() end

function WoWButton:LockHighlight() end

--- Source signature: RegisterForClicks(...: value)
---@param ... any
function WoWButton:RegisterForClicks(...) end

--- Source signature: SetButtonState(state: as during a click on the button, lock: bool)
---@param state any
---@param lock boolean
function WoWButton:SetButtonState(state, lock) end

---@param font WoWFont
function WoWButton:SetDisabledFontObject(font) end

---@param texture string|WoWTexture
---@param filename string
function WoWButton:SetDisabledTexture(texture, filename) end

---@param fontstring WoWFontString
function WoWButton:SetFontString(fontstring) end

--- Source signature: SetFormattedText(fmt: string, ...: values)
---@param fmt string
---@param ... any
function WoWButton:SetFormattedText(fmt, ...) end

---@param font WoWFont
function WoWButton:SetHighlightFontObject(font) end

--- Source signature: SetHighlightTexture(texture: texture, filename: string, mode: value)
---@param texture string|WoWTexture
---@param filename string
---@param mode any
function WoWButton:SetHighlightTexture(texture, filename, mode) end

---@param font WoWFont
function WoWButton:SetNormalFontObject(font) end

---@param texture string|WoWTexture
---@param filename string
function WoWButton:SetNormalTexture(texture, filename) end

---@param x number
---@param y number
function WoWButton:SetPushedTextOffset(x, y) end

---@param texture string|WoWTexture
---@param filename string
function WoWButton:SetPushedTexture(texture, filename) end

---@param text string
function WoWButton:SetText(text) end

function WoWButton:UnlockHighlight() end


-- ==================== Calendar ====================
-- Source: APIDocumentation/Documentation/CalendarDocumentation.lua

function CalendarAddEvent() end

---@return boolean canAdd
function CalendarCanAddEvent() end

---@return boolean canInvite
function CalendarCanSendInvite() end

function CalendarCloseEvent() end

function CalendarContextDeselectEvent() end

---@param monthOffset? number
---@param day number
---@param index integer
---@return boolean canReport
function CalendarContextEventCanComplain(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return boolean canEdit
function CalendarContextEventCanEdit(monthOffset, day, index) end

---@return boolean canPaste
function CalendarContextEventClipboard() end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextEventComplain(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextEventCopy(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return string calendarType
function CalendarContextEventGetCalendarType(monthOffset, day, index) end

---@param monthOffset number
---@param day number
function CalendarContextEventPaste(monthOffset, day) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextEventRemove(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextEventSignUp(monthOffset, day, index) end

---@return number monthOffset
---@return number day
---@return integer index
function CalendarContextGetEventIndex() end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextInviteAvailable(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextInviteDecline(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return boolean pendingInvite
function CalendarContextInviteIsPending(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return number modStatus
function CalendarContextInviteModeratorStatus(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextInviteRemove(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return string inviteStatus
function CalendarContextInviteStatus(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
---@return string inviteType
function CalendarContextInviteType(monthOffset, day, index) end

---@param monthOffset? number
---@param day number
---@param index integer
function CalendarContextSelectEvent(monthOffset, day, index) end

---@return number minLevel
---@return number maxLevel
---@return number rank
function CalendarDefaultGuildFilter() end

function CalendarEventAvailable() end

---@return boolean canEdit
function CalendarEventCanEdit() end

---@param index integer
---@return boolean canModerate
function CalendarEventCanModerate(index) end

function CalendarEventClearAutoApprove() end

function CalendarEventClearLocked() end

---@param index integer
function CalendarEventClearModerator(index) end

function CalendarEventDecline() end

---@return string calendarType
function CalendarEventGetCalendarType() end

---@param index integer
---@return string name
---@return number level
---@return string className
---@return string classFileName
---@return number inviteStatus
---@return number modStatus
---@return boolean inviteIsMine
---@return number inviteType
function CalendarEventGetInvite(index) end

---@param index integer
---@return number weekday
---@return number month
---@return number day
---@return number year
---@return number hour
---@return number minute
function CalendarEventGetInviteResponseTime(index) end

---@return string criterion
---@return boolean reverse
function CalendarEventGetInviteSortCriterion() end

---@return number numInvites
function CalendarEventGetNumInvites() end

---@return any[] ...
function CalendarEventGetRepeatOptions() end

---@return integer index
function CalendarEventGetSelectedInvite() end

---@return any[] ...
function CalendarEventGetStatusOptions() end

---@param eventType number
---@return string name
---@return string icon
---@return number expansion
function CalendarEventGetTextures(eventType) end

---@return any[] ...
function CalendarEventGetTypes() end

---@return boolean pendingInvite
function CalendarEventHasPendingInvite() end

---@return boolean settingsChanged
function CalendarEventHaveSettingsChanged() end

---@param name string
function CalendarEventInvite(name) end

---@return boolean isModerator
function CalendarEventIsModerator() end

---@param index integer
function CalendarEventRemoveInvite(index) end

---@param index integer
function CalendarEventSelectInvite(index) end

function CalendarEventSetAutoApprove() end

---@param month number
---@param day number
---@param year number
function CalendarEventSetDate(month, day, year) end

function CalendarEventSetDescription() end

function CalendarEventSetLocked() end

---@param month number
---@param day number
---@param year number
function CalendarEventSetLockoutDate(month, day, year) end

---@param hour number
---@param minute number
function CalendarEventSetLockoutTime(hour, minute) end

---@param index integer
function CalendarEventSetModerator(index) end

---@param title number
function CalendarEventSetRepeatOption(title) end

---@param size number
function CalendarEventSetSize(size) end

---@param index integer
---@param inviteStatus number
function CalendarEventSetStatus(index, inviteStatus) end

---@param index integer
function CalendarEventSetTextureID(index) end

---@param hour number
---@param minute number
function CalendarEventSetTime(hour, minute) end

---@param title string
function CalendarEventSetTitle(title) end

---@param eventType number
function CalendarEventSetType(eventType) end

function CalendarEventSignUp() end

---@param criterion string
---@param reverse boolean
function CalendarEventSortInvites(criterion, reverse) end

---@param month number
---@param year number
---@return number month
---@return number year
---@return number numDays
---@return number firstWeekday
function CalendarGetAbsMonth(month, year) end

---@return number weekday
---@return number month
---@return number day
---@return number year
function CalendarGetDate() end

---@param monthOffset number
---@param day number
---@param index integer
---@return string title
---@return number hour
---@return number minute
---@return string calendarType
---@return string sequenceType
---@return number eventType
---@return string texture
---@return number modStatus
---@return string inviteStatus
---@return string invitedBy
---@return number difficulty
---@return string inviteType
function CalendarGetDayEvent(monthOffset, day, index) end

---@return number monthOffset
---@return number day
---@return integer index
function CalendarGetEventIndex() end

---@return string title
---@return string description
---@return string creator
---@return number eventType
---@return number repeatOption
---@return number maxSize
---@return integer textureIndex
---@return number weekday
---@return number month
---@return number day
---@return number year
---@return number hour
---@return number minute
---@return number lockoutWeekday
---@return number lockoutMonth
---@return number lockoutDay
---@return number lockoutYear
---@return number lockoutHour
---@return number lockoutMinute
---@return boolean locked
---@return boolean autoApprove
---@return boolean pendingInvite
---@return number inviteStatus
---@return number inviteType
---@return string calendarType
function CalendarGetEventInfo() end

---@param monthOffset number
---@param day number
---@return integer index
function CalendarGetFirstPendingInvite(monthOffset, day) end

---@param monthOffset number
---@param day number
---@param index integer
---@return string name
---@return string description
---@return string texture
function CalendarGetHolidayInfo(monthOffset, day, index) end

---@return number weekday
---@return number month
---@return number day
---@return number year
function CalendarGetMaxCreateDate() end

---@return number weekday
---@return number month
---@return number day
---@return number year
function CalendarGetMaxDate() end

---@return number weekday
---@return number month
---@return number day
---@return number year
function CalendarGetMinDate() end

---@return number weekday
---@return number month
---@return number day
---@return number year
function CalendarGetMinHistoryDate() end

---@param monthOffset? number
---@return number month
---@return number year
---@return number numDays
---@return number firstWeekday
function CalendarGetMonth(monthOffset) end

---@return any[] ...
function CalendarGetMonthNames() end

---@param monthOffset number
---@param day number
---@return number numEvents
function CalendarGetNumDayEvents(monthOffset, day) end

---@return number numInvites
function CalendarGetNumPendingInvites() end

---@param monthOffset number
---@param day number
---@param index integer
---@return number title
---@return string calendarType
---@return number raidID
---@return number hour
---@return number minute
---@return number difficulty
function CalendarGetRaidInfo(monthOffset, day, index) end

---@return any[] ...
function CalendarGetWeekdayNames() end

---@return boolean isPending
function CalendarIsActionPending() end

---@param index integer
function CalendarMassInviteArenaTeam(index) end

---@param minLevel number
---@param maxLevel number
---@param rank number
function CalendarMassInviteGuild(minLevel, maxLevel, rank) end

function CalendarNewEvent() end

function CalendarNewGuildAnnouncement() end

function CalendarNewGuildEvent() end

---@param monthOffset number
---@param day number
---@param index integer
function CalendarOpenEvent(monthOffset, day, index) end

function CalendarRemoveEvent() end

---@param month number
---@param year? number
function CalendarSetAbsMonth(month, year) end

---@param monthOffset number
function CalendarSetMonth(monthOffset) end

function CalendarUpdateEvent() end

---@return boolean canEdit
function CanEditGuildEvent() end

function OpenCalendar() end


-- ==================== Camera ====================
-- Source: APIDocumentation/Documentation/CameraDocumentation.lua

function CameraOrSelectOrMoveStart() end

---@param isSticky boolean
function CameraOrSelectOrMoveStop(isSticky) end

---@param distance number
function CameraZoomIn(distance) end

---@param distance number
function CameraZoomOut(distance) end

---@param degrees number
function FlipCameraYaw(degrees) end

---@return boolean isLooking
function IsMouselooking() end

function MouselookStart() end

function MouselookStop() end

function MoveViewDownStart() end

function MoveViewDownStop() end

function MoveViewInStart() end

function MoveViewInStop() end

function MoveViewLeftStart() end

function MoveViewLeftStop() end

function MoveViewOutStart() end

function MoveViewOutStop() end

function MoveViewRightStart() end

function MoveViewRightStop() end

function MoveViewUpStart() end

function MoveViewUpStop() end

function NextView() end

function PrevView() end

---@param index integer
function ResetView(index) end

---@param index integer
function SaveView(index) end

---@param index integer
function SetView(index) end


-- ==================== Channel ====================
-- Source: APIDocumentation/Documentation/ChannelDocumentation.lua

---@param index integer
---@param channel number
---@return number zoneChannel
function AddChatWindowChannel(index, channel) end

---@param channel string
---@param fullname string
function ChannelBan(channel, fullname) end

---@param channel string
---@param name string
function ChannelInvite(channel, name) end

---@param channel string
---@param fullname string
function ChannelKick(channel, fullname) end

---@param channel string
---@param fullname string
function ChannelModerator(channel, fullname) end

---@param channelName? string
---@param channelId? number
---@param name? string
function ChannelMute(channelName, channelId, name) end

---@param channelName? string
---@param channelId? number
---@param unit? UnitToken
---@param name? string
function ChannelSilenceAll(channelName, channelId, unit, name) end

---@param channelName? string
---@param channelId? number
---@param unit? UnitToken
---@param name? string
function ChannelSilenceVoice(channelName, channelId, unit, name) end

---@param channel string
function ChannelToggleAnnouncements(channel) end

---@param channelName? string
---@param channelId? number
---@param unit? UnitToken
---@param name? string
function ChannelUnSilenceAll(channelName, channelId, unit, name) end

---@param channelName? string
---@param channelId? number
---@param unit? UnitToken
---@param name? string
function ChannelUnSilenceVoice(channelName, channelId, unit, name) end

---@param channel string
---@param fullname string
function ChannelUnban(channel, fullname) end

---@param channel string
---@param fullname string
function ChannelUnmoderator(channel, fullname) end

---@param channelName? string
---@param channelId? number
---@param name? string
function ChannelUnmute(channelName, channelId, name) end

---@param channel? string
---@param channelIndex? integer
function ChannelVoiceOff(channel, channelIndex) end

---@param channel? string
---@param channelIndex? integer
function ChannelVoiceOn(channel, channelIndex) end

function ClearChannelWatch() end

---@param index integer
function CollapseChannelHeader(index) end

---@param channel string
function DeclineInvite(channel) end

---@param channel? string
---@param channelIndex? integer
function DisplayChannelOwner(channel, channelIndex) end

---@param index integer
function DisplayChannelVoiceOff(index) end

---@param index integer
function DisplayChannelVoiceOn(index) end

---@return any[] ...
function EnumerateServerChannels() end

---@param index integer
function ExpandChannelHeader(index) end

---@return integer index
function GetActiveVoiceChannel() end

---@param index integer
---@return string name
---@return 1|nil header
---@return 1|nil collapsed
---@return number channelNumber
---@return number count
---@return 1|nil active
---@return string category
---@return 1|nil voiceEnabled
---@return 1|nil voiceActive
function GetChannelDisplayInfo(index) end

---@return integer index
---@return string channel
---@return any[] ...
function GetChannelList() end

---@param channelIndex? integer
---@param channelName? string
---@return number channel
---@return string channelName
---@return number instanceID
function GetChannelName(channelIndex, channelName) end

---@param index integer
---@param rosterIndex integer
---@return string name
---@return boolean owner
---@return boolean moderator
---@return boolean muted
---@return boolean active
---@return boolean enabled
function GetChannelRosterInfo(index, rosterIndex) end

---@param index integer
---@return string channelName
---@return number channelId
---@return any[] ...
function GetChatWindowChannels(index) end

---@param id number
---@return number numMembers
function GetNumChannelMembers(id) end

---@return number channelCount
function GetNumDisplayChannels() end

---@return integer index
function GetSelectedDisplayChannel() end

---@return boolean isModerator
function IsDisplayChannelModerator() end

---@return boolean isOwner
function IsDisplayChannelOwner() end

---@param name string
---@param channel string
---@return boolean isSilenced
function IsSilenced(name, channel) end

function JoinChannelByName() end

---@param name string
---@param password string
---@param chatFrameIndex integer
---@param enableVoice? boolean
---@return number zoneChannel
---@return string channelName
function JoinPermanentChannel(name, password, chatFrameIndex, enableVoice) end

---@param channel string
function JoinTemporaryChannel(channel) end

---@param name string
function LeaveChannelByName(name) end

---@param channel? string
---@param channelIndex? integer
function ListChannelByName(channel, channelIndex) end

function ListChannels() end

---@param index integer
---@param channel string
function RemoveChatWindowChannel(index, channel) end

---@param index integer
function SetActiveVoiceChannel(index) end

---@param session number
function SetActiveVoiceChannelBySessionID(session) end

---@param channel string
---@param fullname string
function SetChannelOwner(channel, fullname) end

---@param channel string
---@param password string
function SetChannelPassword(channel, password) end

---@param index integer
function SetSelectedDisplayChannel(index) end

function SilenceMember() end

function UnSilenceMember() end


-- ==================== Chat ====================
-- Source: APIDocumentation/Documentation/ChatDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/ChatDocumentation.lua :: AddChatWindowChannel(index: luaIndex, channel: number)

---@param index integer
---@param messageGroup string
function AddChatWindowMessages(index, messageGroup) end

---@param lineID number
---@return boolean canComplain
function CanComplainChat(lineID) end

---@param messageType string
---@param red number
---@param green number
---@param blue number
function ChangeChatColor(messageType, red, green, blue) end

---@param event string
---@param filter function
function ChatFrame_AddMessageEventFilter(event, filter) end

---@param event string
---@return table filterTable
function ChatFrame_GetMessageEventFilters(event) end

---@param event string
---@param filter function
function ChatFrame_RemoveMessageEventFilter(event, filter) end

---@param lineID? number
---@param name? string
---@param text? string
function ComplainChat(lineID, name, text) end

---@param emote string
---@param target? string
---@param hold? boolean
function DoEmote(emote, target, hold) end

---@param messageGroup string
---@return integer index
function GetChatTypeIndex(messageGroup) end

-- Additional source entry: APIDocumentation/Documentation/ChatDocumentation.lua :: GetChatWindowChannels(index: luaIndex)

---@param index integer
---@return string name
---@return number fontSize
---@return number r
---@return number g
---@return number b
---@return number alpha
---@return number shown
---@return number locked
---@return number docked
---@return number uninteractable
function GetChatWindowInfo(index) end

---@param index integer
---@return any[] ...
function GetChatWindowMessages(index) end

---@return string language
function GetDefaultLanguage() end

---@param index integer
---@return string language
function GetLanguageByIndex(index) end

---@return number languages
function GetNumLanguages() end

---@param toggle boolean
---@return boolean isLogging
function LoggingChat(toggle) end

---@param toggle boolean
---@return boolean isLogging
function LoggingCombat(toggle) end

---@param min string
---@param max string
function RandomRoll(min, max) end

-- Additional source entry: APIDocumentation/Documentation/ChatDocumentation.lua :: RemoveChatWindowChannel(index: luaIndex, channel: string)

---@param index integer
---@param messageGroup string
function RemoveChatWindowMessages(index, messageGroup) end

function ResetChatColors() end

function ResetChatWindows() end

---@param text string
---@param chatType string
---@param language string
---@param channel? string
function SendChatMessage(text, chatType, language, channel) end

---@param index integer
---@param alpha number
function SetChatWindowAlpha(index, alpha) end

---@param index integer
---@param r number
---@param g number
---@param b number
function SetChatWindowColor(index, r, g, b) end

---@param index integer
---@param docked boolean
function SetChatWindowDocked(index, docked) end

---@param index integer
---@param locked boolean
function SetChatWindowLocked(index, locked) end

---@param index integer
---@param name string
function SetChatWindowName(index, name) end

---@param index integer
---@param shown boolean
function SetChatWindowShown(index, shown) end

---@param index integer
---@param size number
function SetChatWindowSize(index, size) end

---@param index integer
---@param setUninteractable boolean
function SetChatWindowUninteractable(index, setUninteractable) end


-- ==================== CheckButton ====================
-- Source: APIDocumentation/Documentation/CheckButtonAPIDocumentation.lua

---@return 1|nil enabled
function WoWCheckButton:GetChecked() end

---@return string|WoWTexture texture
function WoWCheckButton:GetCheckedTexture() end

---@return string|WoWTexture texture
function WoWCheckButton:GetDisabledCheckedTexture() end

---@param enable boolean
function WoWCheckButton:SetChecked(enable) end

---@param texture string|WoWTexture
---@param filename string
function WoWCheckButton:SetCheckedTexture(texture, filename) end

---@param texture string|WoWTexture
---@param filename string
function WoWCheckButton:SetDisabledCheckedTexture(texture, filename) end

---@return 1|nil enabled
function WoWCheckButton:CanChangeAttribute() end

function WoWCheckButton:GetDontSavePosition() end

---@return 1|nil isEnabled
function WoWCheckButton:GetMotionScriptsWhileDisabled() end

function WoWCheckButton:GetPropagateKeyboardInput() end

function WoWCheckButton:SetDontSavePosition() end

---@param enabled boolean
function WoWCheckButton:SetMotionScriptsWhileDisabled(enabled) end

function WoWCheckButton:SetPropagateKeyboardInput() end


-- ==================== Class Resource ====================
-- Source: APIDocumentation/Documentation/ClassResourceDocumentation.lua

---@param slot number
function DestroyTotem(slot) end

---@param slot number
---@return number start
---@return number duration
---@return boolean runeReady
function GetRuneCooldown(slot) end

---@param slot number
---@return number count
function GetRuneCount(slot) end

---@param slot number
---@return number runeType
function GetRuneType(slot) end

---@param slot number
---@return boolean haveTotem
---@return string name
---@return number startTime
---@return number duration
---@return string icon
function GetTotemInfo(slot) end

---@param slot number
---@return number seconds
function GetTotemTimeLeft(slot) end

---@param slot number
function TargetTotem(slot) end


-- ==================== Client Control and Information ====================
-- Source: APIDocumentation/Documentation/ClientControlAndInformationDocumentation.lua

function CancelLogout() end

function DownloadSettings() end

function ForceLogout() end

function ForceQuit() end

---@return string expansionLevel
function GetAccountExpansionLevel() end

---@return string version
---@return string internalVersion
---@return string date
---@return number uiVersion
function GetBuildInfo() end

---@return any[] ...
function GetExistingLocales() end

function GetExpansionLevel() end

---@return number hour
---@return number minute
function GetGameTime() end

---@return string locale
function GetLocale() end

---@return number bandwidthIn
---@return number bandwidthOut
---@return number latencyHome
---@return number latencyWorld
function GetNetStats() end

---@return boolean isLinux
function IsLinuxClient() end

---@return boolean isMac
function IsMacClient() end

---@return boolean isWindows
function IsWindowsClient() end

function Logout() end

function NotWhileDeadError() end

function Quit() end

function ReloadUI() end

function Screenshot() end

---@param enable boolean
function SetEuropeanNumbers(enable) end

---@param visible boolean
function SetUIVisibility(visible) end

function UploadSettings() end


-- ==================== ColorSelect ====================
-- Source: APIDocumentation/Documentation/ColorSelectAPIDocumentation.lua

---@return number hue
---@return number saturation
---@return number value
function WoWColorSelect:GetColorHSV() end

---@return number red
---@return number blue
---@return number green
function WoWColorSelect:GetColorRGB() end

---@return string|WoWTexture texture
function WoWColorSelect:GetColorValueTexture() end

---@return string|WoWTexture texture
function WoWColorSelect:GetColorValueThumbTexture() end

---@return string|WoWTexture texture
function WoWColorSelect:GetColorWheelTexture() end

---@return string|WoWTexture texture
function WoWColorSelect:GetColorWheelThumbTexture() end

---@param hue number
---@param saturation number
---@param value number
function WoWColorSelect:SetColorHSV(hue, saturation, value) end

---@param red number
---@param blue number
---@param green number
function WoWColorSelect:SetColorRGB(red, blue, green) end

---@param texture string|WoWTexture
function WoWColorSelect:SetColorValueTexture(texture) end

---@param texture string|WoWTexture
---@param filename string
function WoWColorSelect:SetColorValueThumbTexture(texture, filename) end

---@param texture string|WoWTexture
function WoWColorSelect:SetColorWheelTexture(texture) end

---@param texture string|WoWTexture
---@param filename string
function WoWColorSelect:SetColorWheelThumbTexture(texture, filename) end

---@return 1|nil enabled
function WoWColorSelect:CanChangeAttribute() end

function WoWColorSelect:GetDontSavePosition() end

function WoWColorSelect:GetPropagateKeyboardInput() end

function WoWColorSelect:SetDontSavePosition() end

function WoWColorSelect:SetPropagateKeyboardInput() end


-- ==================== Combat ====================
-- Source: APIDocumentation/Documentation/CombatDocumentation.lua

---@param unit? UnitToken
---@param name? string
function StartAttack(unit, name) end

function StopAttack() end

---@param unit UnitToken
---@return boolean inCombat
function UnitAffectingCombat(unit) end

function AttackTarget() end


-- ==================== CombatLog ====================
-- Source: APIDocumentation/Documentation/CombatlogDocumentation.lua

---@param events? string
---@param srcGUID? WOWGUID
---@param srcMask? number
---@param destGUID? WOWGUID
---@param destMask? number
function CombatLogAddFilter(events, srcGUID, srcMask, destGUID, destMask) end

---@param count number
---@param ignoreFilter boolean
---@return boolean hasEntry
function CombatLogAdvanceEntry(count, ignoreFilter) end

function CombatLogClearEntries() end

---@param ignoreFilter? boolean
---@return number timestamp
---@return string event
---@return WOWGUID srcGUID
---@return string srcName
---@return number srcFlags
---@return WOWGUID destGUID
---@return string destName
---@return number destFlags
---@return any[] ...
function CombatLogGetCurrentEntry(ignoreFilter) end

---@param ignoreFilter boolean
function CombatLogGetNumEntries(ignoreFilter) end

---@return number seconds
function CombatLogGetRetentionTime() end

function CombatLogResetFilter() end

---@param index integer
---@param ignoreFilter? boolean
function CombatLogSetCurrentEntry(index, ignoreFilter) end

---@param seconds number
function CombatLogSetRetentionTime(seconds) end

---@param unitFlags UnitToken
---@param mask number
---@return boolean isMatch
function CombatLog_Object_IsA(unitFlags, mask) end

-- Additional source entry: APIDocumentation/Documentation/CombatlogDocumentation.lua :: LoggingCombat(toggle: bool)

---@param unit UnitToken
---@return WOWGUID guid
function UnitGUID(unit) end


-- ==================== Commentator ====================
-- Source: APIDocumentation/Documentation/CommentatorDocumentation.lua

function CommentatorAddPlayer() end

function CommentatorEnterInstance() end

function CommentatorExitInstance() end

function CommentatorFollowPlayer() end

function CommentatorGetCamera() end

function CommentatorGetCurrentMapID() end

function CommentatorGetInstanceInfo() end

function CommentatorGetMapInfo() end

function CommentatorGetMode() end

function CommentatorGetNumMaps() end

function CommentatorGetNumPlayers() end

function CommentatorGetPlayerInfo() end

function CommentatorGetSkirmishMode() end

function CommentatorGetSkirmishQueueCount() end

function CommentatorGetSkirmishQueuePlayerInfo() end

function CommentatorLookatPlayer() end

function CommentatorRemovePlayer() end

function CommentatorRequestSkirmishMode() end

function CommentatorRequestSkirmishQueueData() end

function CommentatorSetBattlemaster() end

function CommentatorSetCamera() end

function CommentatorSetCameraCollision() end

function CommentatorSetMapAndInstanceIndex() end

function CommentatorSetMode() end

function CommentatorSetMoveSpeed() end

function CommentatorSetPlayerIndex() end

function CommentatorSetSkirmishMatchmakingMode() end

function CommentatorSetTargetHeightOffset() end

function CommentatorStartInstance() end

function CommentatorStartSkirmishMatch() end

function CommentatorToggleMode() end

function CommentatorUpdateMapInfo() end

function CommentatorUpdatePlayerInfo() end

function CommentatorZoomIn() end

function CommentatorZoomOut() end


-- ==================== Companion ====================
-- Source: APIDocumentation/Documentation/CompanionDocumentation.lua

function SummonRandomCritter() end

---@param type string
---@param index integer
function CallCompanion(type, index) end

---@param type string
function DismissCompanion(type) end

---@param type string
---@param index integer
---@return number start
---@return number duration
---@return number enable
function GetCompanionCooldown(type, index) end

---@param type string
---@param index integer
---@return number creatureID
---@return string creatureName
---@return number spellID
---@return string icon
---@return boolean active
function GetCompanionInfo(type, index) end

---@param type string
---@return number count
function GetNumCompanions(type) end

---@param type string
---@param index integer
function PickupCompanion(type, index) end


-- ==================== Complaint ====================
-- Source: APIDocumentation/Documentation/ComplaintDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: CalendarContextEventCanComplain(monthOffset: number?, day: number, index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: CalendarContextEventComplain(monthOffset: number?, day: number, index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: CanComplainChat(lineID: number)

---@param mailID number
---@return boolean complain
function CanComplainInboxItem(mailID) end

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: ComplainChat(lineID: number)

---@param mailID number
function ComplainInboxItem(mailID) end

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: PlayerIsPVPInactive(name: string?, unit: UnitToken?)

-- Additional source entry: APIDocumentation/Documentation/ComplaintDocumentation.lua :: ReportPlayerIsPVPAFK(name: string?, unit: UnitToken?)


-- ==================== Container ====================
-- Source: APIDocumentation/Documentation/ContainerDocumentation.lua

---@param container number
---@return number inventoryID
function ContainerIDToInventoryID(container) end

---@param container number
---@param slot number
function ContainerRefundItemPurchase(container, slot) end

-- Additional source entry: APIDocumentation/Documentation/ContainerDocumentation.lua :: EquipmentManager_UnpackLocation(location: number?)

---@param container number
---@return string name
function GetBagName(container) end

---@param container number
---@param returnTable? table
---@return table slotTable
function GetContainerFreeSlots(container, returnTable) end

---@param container number
---@param slot number
---@return number start
---@return number duration
---@return number enable
function GetContainerItemCooldown(container, slot) end

---@param container number
---@param slot number
---@return number durability
---@return number max
function GetContainerItemDurability(container, slot) end

---@param container number
---@param slot number
---@return number gem1
---@return number gem2
---@return number gem3
function GetContainerItemGems(container, slot) end

---@param container number
---@param slot number
---@return number id
function GetContainerItemID(container, slot) end

---@param container number
---@param slot number
---@return string texture
---@return number count
---@return 1|nil locked
---@return integer quality
---@return 1|nil readable
---@return 1|nil lootable
---@return string link
function GetContainerItemInfo(container, slot) end

---@param container number
---@param slot number
---@return string link
function GetContainerItemLink(container, slot) end

---@param container number
---@param slot number
---@param IsEquipped boolean
---@return number money
---@return number itemCount
---@return number refundSec
---@return number currecycount
---@return number hasEnchants
function GetContainerItemPurchaseInfo(container, slot, IsEquipped) end

---@param container number
---@param slot number
---@param index integer
---@return string texture
---@return number quantity
---@return string link
function GetContainerItemPurchaseItem(container, slot, index) end

---@param container number
---@return number freeSlots
---@return number bagType
function GetContainerNumFreeSlots(container) end

---@param container number
---@return number numSlots
function GetContainerNumSlots(container) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return number bagType
function GetItemFamily(itemID, itemName, itemLink) end

---@param slot number
function PickupBagFromSlot(slot) end

---@param container number
---@param slot number
function PickupContainerItem(container, slot) end

---@return boolean hadItem
function PutItemInBackpack() end

---@param container number
---@return boolean hadItem
function PutItemInBag(container) end

---@param texture table
---@param container number
function SetBagPortraitTexture(texture, container) end

---@param container number
---@param slot number
function SocketContainerItem(container, slot) end

---@param container number
---@param slot number
---@param amount number
function SplitContainerItem(container, slot, amount) end

---@param container number
---@param slot number
---@param target? string
function UseContainerItem(container, slot, target) end


-- ==================== ControlPoint ====================
-- Source: APIDocumentation/Documentation/ControlPointAPIDocumentation.lua

---@return number x
---@return number y
function WoWControlPoint:GetOffset() end

---@return number order
function WoWControlPoint:GetOrder() end

---@param x number
---@param y number
function WoWControlPoint:SetOffset(x, y) end

---@param order number
function WoWControlPoint:SetOrder(order) end

---@param path table
---@param path2 string
---@param order number
function WoWControlPoint:SetParent(path, path2, order) end


-- ==================== Cooldown ====================
-- Source: APIDocumentation/Documentation/CooldownAPIDocumentation.lua

function WoWCooldown:SetCooldown() end

---@param reverse boolean
function WoWCooldown:SetReverse(reverse) end


-- ==================== Currency ====================
-- Source: APIDocumentation/Documentation/CurrencyDocumentation.lua

---@param index integer
---@param shouldExpand number
function ExpandCurrencyList(index, shouldExpand) end

---@param index integer
---@return string name
---@return number count
---@return number extraCurrencyType
---@return string icon
---@return number itemID
function GetBackpackCurrencyInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/CurrencyDocumentation.lua :: GetContainerItemPurchaseInfo(container: number, slot: number, IsEquipped: bool)

-- Additional source entry: APIDocumentation/Documentation/CurrencyDocumentation.lua :: GetContainerItemPurchaseItem(container: number, slot: number, index: luaIndex)

---@param index integer
---@return string name
---@return boolean isHeader
---@return boolean isExpanded
---@return boolean isUnused
---@return boolean isWatched
---@return number count
---@return number extraCurrencyType
---@return string icon
---@return number itemID
function GetCurrencyListInfo(index) end

---@return number numEntries
function GetCurrencyListSize() end

---@return boolean unk
---@return number honorWinReward
---@return number arenaWinReward
---@return number honorLossReward
---@return number arenaLossReward
function GetHolidayBGHonorCurrencyBonuses() end

---@return number honorPoints
---@return number maxHonor
function GetHonorCurrency() end

-- Additional source entry: APIDocumentation/Documentation/CurrencyDocumentation.lua :: GetMaxArenaCurrency()

---@param index integer
---@param watch number
function SetCurrencyBackpack(index, watch) end

---@param index integer
---@param makeUnused number
function SetCurrencyUnused(index, makeUnused) end

function GetArenaCurrency() end


-- ==================== Cursor ====================
-- Source: APIDocumentation/Documentation/CursorDocumentation.lua

function AddTradeMoney() end

function AutoEquipCursorItem() end

function ClearCursor() end

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: ClickAuctionSellItemButton()

---@param index integer
---@param autoReturn boolean
function ClickSendMailItemButton(index, autoReturn) end

---@param index integer
function ClickSocketButton(index) end

---@param index integer
function ClickTargetTradeButton(index) end

---@param index integer
function ClickTradeButton(index) end

---@param slot number
---@return boolean canBePlaced
function CursorCanGoInSlot(slot) end

---@return boolean hasItem
function CursorHasItem() end

---@return boolean hasMacro
function CursorHasMacro() end

---@return boolean hasMoney
function CursorHasMoney() end

---@return boolean hasSpell
function CursorHasSpell() end

function DeleteCursorItem() end

function DropCursorMoney() end

---@param unit? UnitToken
---@param name? string
function DropItemOnUnit(unit, name) end

---@param slot number
function EquipCursorItem(slot) end

---@return string type
---@return number data
---@return string subType
function GetCursorInfo() end

---@return number cursorMoney
function GetCursorMoney() end

---@return number cursorX
---@return number cursorY
function GetCursorPosition() end

---@return WoWFrame frame
function GetMouseFocus() end

function HideRepairCursor() end

---@return boolean inRepair
function InRepairMode() end

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PickupAction(slot: number)

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PickupBagFromSlot(slot: number)

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PickupCompanion(type: string, index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PickupContainerItem(container: number, slot: number)

---@param tab number
---@param slot number
function PickupGuildBankItem(tab, slot) end

---@param amount number
function PickupGuildBankMoney(amount) end

---@param slot number
function PickupInventoryItem(slot) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
function PickupItem(itemID, itemName, itemLink) end

---@param index? integer
---@param name? string
function PickupMacro(index, name) end

---@param index integer
function PickupMerchantItem(index) end

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PickupPetAction(index: luaIndex)

---@param amount number
function PickupPlayerMoney(amount) end

---@param id number
---@param bookType string
function PickupSpell(id, bookType) end

---@param index integer
function PickupStablePet(index) end

---@param amount number
function PickupTradeMoney(amount) end

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PlaceAction(slot: number)

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PutItemInBackpack()

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: PutItemInBag(container: number)

function ResetCursor() end

---@param cursor string
function SetCursor(cursor) end

---@param index integer
function ShowBuybackSellCursor(index) end

---@param container number
---@param slot number
function ShowContainerSellCursor(container, slot) end

---@param slot number
function ShowInventorySellCursor(slot) end

---@param index integer
function ShowMerchantSellCursor(index) end

function ShowRepairCursor() end

-- Additional source entry: APIDocumentation/Documentation/CursorDocumentation.lua :: SplitContainerItem(container: number, slot: number, amount: number)

---@param tab number
---@param slot number
---@param amount number
function SplitGuildBankItem(tab, slot, amount) end


-- ==================== CVar ====================
-- Source: APIDocumentation/Documentation/CvarDocumentation.lua

---@param cvar string
---@return string string
function GetCVar(cvar) end

---@param cvar string
---@return number min
function GetCVarAbsoluteMin(cvar) end

---@param cvar string
---@return boolean value
function GetCVarBool(cvar) end

---@param CVar string
---@return string value
function GetCVarDefault(CVar) end

---@param cvar string
---@return string value
---@return string defaultValue
---@return boolean serverStoredAccountWide
---@return boolean serverStoredPerCharacter
function GetCVarInfo(cvar) end

---@param cvar string
---@return number min
function GetCVarMin(cvar) end

---@param cvar string
---@param default string
function RegisterCVar(cvar, default) end

---@param cvar string
---@param value any
---@param raiseEvent? string
function SetCVar(cvar, value, raiseEvent) end

function GetCVarAbsoluteMax() end

function GetCVarMax() end


-- ==================== Debugging and Profiling ====================
-- Source: APIDocumentation/Documentation/DebuggingAndProfilingDocumentation.lua

---@param enable boolean
function FrameXML_Debug(enable) end

---@param name? string
---@param index? integer
---@return number usage
function GetAddOnCPUUsage(name, index) end

---@param name? string
---@param index? integer
---@return number mem
function GetAddOnMemoryUsage(name, index) end

---@param event? string
---@return number usage
---@return number numEvents
function GetEventCPUUsage(event) end

---@param frame WoWFrame
---@param includeChildren boolean
---@return number usage
---@return number calls
function GetFrameCPUUsage(frame, includeChildren) end

---@return number framerate
function GetFramerate() end

---@param function_ function
---@param includeSubroutines boolean
---@return number usage
---@return number calls
function GetFunctionCPUUsage(function_, includeSubroutines) end

-- Additional source entry: APIDocumentation/Documentation/DebuggingAndProfilingDocumentation.lua :: GetNetStats()

---@return number usage
function GetScriptCPUUsage() end

---@return boolean isBenchmark
function GetTaxiBenchmarkMode() end

function ResetCPUUsage() end

---@param arg string
function SetTaxiBenchmarkMode(arg) end

function UpdateAddOnCPUUsage() end

function UpdateAddOnMemoryUsage() end

function debugprofilestart() end

---@return number time
function debugprofilestop() end

---@param start number
---@param countTop number
---@param countBot number
---@return string debugstring
function debugstack(start, countTop, countBot) end

---@return function handler
function geterrorhandler() end

---@param table? table
---@param variable string
---@return boolean issecure
---@return string taint
function issecurevariable(table, variable) end

---@param errHandler function
function seterrorhandler(errHandler) end


-- ==================== Deprecated ====================
-- Source: APIDocumentation/Documentation/DeprecatedDocumentation.lua

function AcceptSkillUps() end

function AddSkillUp() end

function GetExtendedItemInfo() end

function ReportBug() end

function ReportSuggestion() end

function BuySkillTier() end

function CancelSkillUps() end

function GetAdjustedSkillPoints() end

function RemoveSkillUp() end


-- ==================== DressUpModel ====================
-- Source: APIDocumentation/Documentation/DressUpModelAPIDocumentation.lua

function WoWDressUpModel:Dress() end

---@param itemID number
---@param itemName string
---@param itemLink string
function WoWDressUpModel:TryOn(itemID, itemName, itemLink) end

function WoWDressUpModel:Undress() end

function WoWDressUpModel:UndressSlot() end


-- ==================== Duel ====================
-- Source: APIDocumentation/Documentation/DuelDocumentation.lua

function AcceptDuel() end

function CancelDuel() end

---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function StartDuel(unit, name, exactMatch) end


-- ==================== EditBox ====================
-- Source: APIDocumentation/Documentation/EditBoxAPIDocumentation.lua

---@param text string
function WoWEditBox:AddHistoryLine(text) end

function WoWEditBox:ClearFocus() end

---@return 1|nil enabled
function WoWEditBox:GetAltArrowKeyMode() end

---@return number duration
function WoWEditBox:GetBlinkSpeed() end

---@return number position
function WoWEditBox:GetCursorPosition() end

---@return number count
function WoWEditBox:GetHistoryLines() end

---@return 1|nil indent
function WoWEditBox:GetIndentedWordWrap() end

---@return string language
function WoWEditBox:GetInputLanguage() end

---@return number maxBytes
function WoWEditBox:GetMaxBytes() end

---@return number maxLetters
function WoWEditBox:GetMaxLetters() end

---@return number numLetters
function WoWEditBox:GetNumLetters() end

---@return number num
function WoWEditBox:GetNumber() end

---@return string text
function WoWEditBox:GetText() end

---@return number left
---@return number right
---@return number top
---@return number bottom
function WoWEditBox:GetTextInsets() end

---@return 1|nil enabled
function WoWEditBox:HasFocus() end

---@param start number
---@param end_ number
function WoWEditBox:HighlightText(start, end_) end

---@param text string
function WoWEditBox:Insert(text) end

---@return 1|nil enabled
function WoWEditBox:IsAutoFocus() end

---@return 1|nil enabled
function WoWEditBox:IsInIMECompositionMode() end

---@return 1|nil multiLine
function WoWEditBox:IsMultiLine() end

---@return 1|nil enabled
function WoWEditBox:IsNumeric() end

---@return 1|nil enabled
function WoWEditBox:IsPassword() end

---@param enable boolean
function WoWEditBox:SetAltArrowKeyMode(enable) end

---@param enable boolean
function WoWEditBox:SetAutoFocus(enable) end

---@param duration number
function WoWEditBox:SetBlinkSpeed(duration) end

---@param position number
function WoWEditBox:SetCursorPosition(position) end

function WoWEditBox:SetFocus() end

---@param count number
function WoWEditBox:SetHistoryLines(count) end

---@param indent boolean
function WoWEditBox:SetIndentedWordWrap(indent) end

---@param maxBytes number
function WoWEditBox:SetMaxBytes(maxBytes) end

---@param maxLetters number
function WoWEditBox:SetMaxLetters(maxLetters) end

---@param multiLine boolean
function WoWEditBox:SetMultiLine(multiLine) end

function WoWEditBox:SetNumber() end

function WoWEditBox:SetNumeric() end

---@param enable boolean
function WoWEditBox:SetPassword(enable) end

function WoWEditBox:SetText() end

function WoWEditBox:SetTextInsets() end

function WoWEditBox:ToggleInputLanguage() end


-- ==================== Equipment Manager ====================
-- Source: APIDocumentation/Documentation/EquipmentManagerDocumentation.lua

---@return boolean enabled
function CanUseEquipmentSets() end

---@param name string
function DeleteEquipmentSet(name) end

function EquipmentManagerClearIgnoredSlotsForSave() end

---@param slot number
function EquipmentManagerIgnoreSlotForSave(slot) end

---@param slot number
---@return boolean isIgnored
function EquipmentManagerIsSlotIgnoredForSave(slot) end

---@param slot number
function EquipmentManagerUnignoreSlotForSave(slot) end

-- Additional source entry: APIDocumentation/Documentation/EquipmentManagerDocumentation.lua :: EquipmentManager_UnpackLocation(location: number?)

---@param name string
---@return boolean isLocked
function EquipmentSetContainsLockedItems(name) end

---@param index integer
---@return string name
---@return string icon
---@return number setID
function GetEquipmentSetInfo(index) end

---@param name string
---@return string icon
---@return number setID
function GetEquipmentSetInfoByName(name) end

---@param name string
---@return table itemIDs
function GetEquipmentSetItemIDs(name) end

---@param name string
---@return table itemIDs
function GetEquipmentSetLocations(name) end

---@return number numSets
function GetNumEquipmentSets() end

---@param index integer
function PickupEquipmentSet(index) end

---@param name string
function PickupEquipmentSetByName(name) end

---@param name string
---@param icon number
function SaveEquipmentSet(name, icon) end

---@param name string
---@return boolean|nil equipped
function UseEquipmentSet(name) end

function RenameEquipmentSet() end


-- ==================== Experience ====================
-- Source: APIDocumentation/Documentation/ExperienceXpDocumentation.lua

function GetRewardXP() end

---@return number exhaustionXP
function GetXPExhaustion() end

---@return boolean isDisabled
function IsXPUserDisabled() end

---@param unit UnitToken
---@return number currXP
function UnitXP(unit) end

---@param unit UnitToken
---@return number playerMaxXP
function UnitXPMax(unit) end


-- ==================== Faction ====================
-- Source: APIDocumentation/Documentation/FactionDocumentation.lua

function CollapseAllFactionHeaders() end

---@param index integer
function CollapseFactionHeader(index) end

function ExpandAllFactionHeaders() end

---@param index integer
function ExpandFactionHeader(index) end

---@param index integer
function FactionToggleAtWar(index) end

---@param index integer
---@return string name
---@return string description
---@return number standingID
---@return number barMin
---@return number barMax
---@return number barValue
---@return boolean atWarWith
---@return boolean canToggleAtWar
---@return boolean isHeader
---@return boolean isCollapsed
---@return boolean hasRep
---@return boolean isWatched
---@return boolean isChild
function GetFactionInfo(index) end

---@return number numFactions
function GetNumFactions() end

---@return integer index
function GetSelectedFaction() end

---@return string name
---@return number standingID
---@return number barMin
---@return number barMax
---@return number barValue
function GetWatchedFactionInfo() end

---@param index integer
---@return boolean isInactive
function IsFactionInactive(index) end

---@param index integer
function SetFactionActive(index) end

---@param index integer
function SetFactionInactive(index) end

---@param index integer
function SetSelectedFaction(index) end

---@param index integer
function SetWatchedFactionIndex(index) end


-- ==================== Font ====================
-- Source: APIDocumentation/Documentation/FontAPIDocumentation.lua

---@param object WoWFont
---@param name string
function WoWFont:CopyFontObject(object, name) end

---@return number alpha
function WoWFont:GetAlpha() end

function WoWFont:GetIndentedWordWrap() end

---@param alpha number
function WoWFont:SetAlpha(alpha) end

function WoWFont:SetIndentedWordWrap() end


-- ==================== FontString ====================
-- Source: APIDocumentation/Documentation/FontStringAPIDocumentation.lua

---@return 1|nil enabled
function WoWFontString:CanNonSpaceWrap() end

---@return 1|nil enabled
function WoWFontString:CanWordWrap() end

function WoWFontString:GetFieldSize() end

function WoWFontString:GetIndentedWordWrap() end

---@return number height
function WoWFontString:GetStringHeight() end

---@return number width
function WoWFontString:GetStringWidth() end

---@return string text
function WoWFontString:GetText() end

---@param start number
---@param length number
function WoWFontString:SetAlphaGradient(start, length) end

---@param formatString string
---@param ... any[]
function WoWFontString:SetFormattedText(formatString, ...) end

function WoWFontString:SetIndentedWordWrap() end

---@param enable boolean
function WoWFontString:SetNonSpaceWrap(enable) end

function WoWFontString:SetText() end

---@param height number
function WoWFontString:SetTextHeight(height) end

---@param enable boolean
function WoWFontString:SetWordWrap(enable) end


-- ==================== Frame ====================
-- Source: APIDocumentation/Documentation/FrameAPIDocumentation.lua

function WoWFrame:AllowAttributeChanges() end

---@param name? string
---@param layer? string
---@param inherits? string
---@return WoWFontString object
function WoWFrame:CreateFontString(name, layer, inherits) end

---@param name? string
---@param layer? string
---@param inherits? string
---@param sublevel? number
---@return WoWTexture object
function WoWFrame:CreateTexture(name, layer, inherits, sublevel) end

---@return WoWRegion region
function WoWFrame:CreateTitleRegion() end

---@param layer string
function WoWFrame:DisableDrawLayer(layer) end

---@param layer string
function WoWFrame:EnableDrawLayer(layer) end

---@param enable boolean
function WoWFrame:EnableJoystick(enable) end

---@param enable boolean
function WoWFrame:EnableKeyboard(enable) end

---@param enable boolean
function WoWFrame:EnableMouse(enable) end

---@param enable boolean
function WoWFrame:EnableMouseWheel(enable) end

---@param name string
---@return any value
function WoWFrame:GetAttribute(name) end

---@return table backdrop
function WoWFrame:GetBackdrop() end

---@return number red
---@return number green
---@return number blue
---@return number alpha
function WoWFrame:GetBackdropBorderColor() end

---@return number red
---@return number green
---@return number blue
---@return number alpha
function WoWFrame:GetBackdropColor() end

---@return number left
---@return number bottom
---@return number width
---@return number height
function WoWFrame:GetBoundsRect() end

---@return WoWFrame ...
function WoWFrame:GetChildren() end

---@return number left
---@return number right
---@return number top
---@return number bottom
function WoWFrame:GetClampRectInsets() end

---@return number depth
function WoWFrame:GetDepth() end

---@return number alpha
function WoWFrame:GetEffectiveAlpha() end

---@return number depth
function WoWFrame:GetEffectiveDepth() end

---@return number scale
function WoWFrame:GetEffectiveScale() end

---@return number level
function WoWFrame:GetFrameLevel() end

---@return any strata
function WoWFrame:GetFrameStrata() end

function WoWFrame:GetFrameType() end

---@return number left
---@return number right
---@return number top
---@return number bottom
function WoWFrame:GetHitRectInsets() end

---@return number id
function WoWFrame:GetID() end

---@return number maxWidth
---@return number maxHeight
function WoWFrame:GetMaxResize() end

---@return number minWidth
---@return number minHeight
function WoWFrame:GetMinResize() end

---@return number numChildren
function WoWFrame:GetNumChildren() end

---@return number numRegions
function WoWFrame:GetNumRegions() end

---@return WoWRegion ...
function WoWFrame:GetRegions() end

---@return number scale
function WoWFrame:GetScale() end

---@return WoWRegion region
function WoWFrame:GetTitleRegion() end

---@param enable boolean
function WoWFrame:IgnoreDepth(enable) end

---@return 1|nil enabled
function WoWFrame:IsClampedToScreen() end

---@param event string
---@return 1|nil registered
function WoWFrame:IsEventRegistered(event) end

function WoWFrame:IsFrameType() end

---@return 1|nil enabled
function WoWFrame:IsIgnoringDepth() end

---@return 1|nil enabled
function WoWFrame:IsJoystickEnabled() end

function WoWFrame:IsJumpNavigateEnabled() end

function WoWFrame:IsJumpNavigateStart() end

---@return 1|nil enabled
function WoWFrame:IsKeyboardEnabled() end

---@return 1|nil enabled
function WoWFrame:IsMouseEnabled() end

---@return 1|nil enabled
function WoWFrame:IsMouseWheelEnabled() end

---@return 1|nil movable
function WoWFrame:IsMovable() end

---@return 1|nil enabled
function WoWFrame:IsResizable() end

---@return 1|nil enabled
function WoWFrame:IsToplevel() end

---@return 1|nil enabled
function WoWFrame:IsUserPlaced() end

function WoWFrame:Lower() end

function WoWFrame:Raise() end

function WoWFrame:RegisterAllEvents() end

---@param event string
function WoWFrame:RegisterEvent(event) end

--- Source signature: RegisterForDrag(...: value)
---@param ... any
function WoWFrame:RegisterForDrag(...) end

--- Source signature: SetAttribute(name: string, value: value)
---@param name string
---@param value any
function WoWFrame:SetAttribute(name, value) end

---@param backdrop table
function WoWFrame:SetBackdrop(backdrop) end

---@param red number
---@param green number
---@param blue number
---@param alpha number
function WoWFrame:SetBackdropBorderColor(red, green, blue, alpha) end

---@param red number
---@param green number
---@param blue number
---@param alpha number
function WoWFrame:SetBackdropColor(red, green, blue, alpha) end

function WoWFrame:SetClampRectInsets() end

---@param enable boolean
function WoWFrame:SetClampedToScreen(enable) end

---@param depth number
function WoWFrame:SetDepth(depth) end

---@param level number
function WoWFrame:SetFrameLevel(level) end

---@param strata string
function WoWFrame:SetFrameStrata(strata) end

---@param left number
---@param right number
---@param top number
---@param bottom number
function WoWFrame:SetHitRectInsets(left, right, top, bottom) end

---@param id number
function WoWFrame:SetID(id) end

function WoWFrame:SetJumpNavigateEnabled() end

function WoWFrame:SetJumpNavigateStart() end

---@param maxWidth number
---@param maxHeight number
function WoWFrame:SetMaxResize(maxWidth, maxHeight) end

---@param minWidth number
---@param minHeight number
function WoWFrame:SetMinResize(minWidth, minHeight) end

---@param enable boolean
function WoWFrame:SetMovable(enable) end

---@param enable boolean
function WoWFrame:SetResizable(enable) end

---@param scale number
function WoWFrame:SetScale(scale) end

---@param enable boolean
function WoWFrame:SetToplevel(enable) end

---@param enable boolean
function WoWFrame:SetUserPlaced(enable) end

function WoWFrame:StartMoving() end

function WoWFrame:StartSizing() end

function WoWFrame:StopMovingOrSizing() end

function WoWFrame:UnregisterAllEvents() end

---@param event string
function WoWFrame:UnregisterEvent(event) end


-- ==================== FrameXML ====================
-- Source: APIDocumentation/Documentation/FrameXMLDocumentation.lua

---@param frame WoWFrame
---@param force? boolean
function ShowUIPanel(frame, force) end

---@param frame WoWFrame
---@param skipSetPoint? boolean
function HideUIPanel(frame, skipSetPoint) end

---@param frame WoWFrame
function ToggleFrame(frame) end

---@param frame WoWFrame
---@param fadeInfo table
function UIFrameFade(frame, fadeInfo) end

---@param frame WoWFrame
---@param timeToFade number
---@param startAlpha? number
---@param endAlpha? number
function UIFrameFadeIn(frame, timeToFade, startAlpha, endAlpha) end

---@param frame WoWFrame
---@param timeToFade number
---@param startAlpha? number
---@param endAlpha? number
function UIFrameFadeOut(frame, timeToFade, startAlpha, endAlpha) end

---@param frame WoWFrame
function UIFrameFadeRemoveFrame(frame) end

---@param frame WoWFrame
---@return number|nil isFading
function UIFrameIsFading(frame) end

---@param frame WoWFrame
---@param fadeInTime number
---@param fadeOutTime number
---@param flashDuration number
---@param showWhenDone boolean
---@param flashInHoldTime? number
---@param flashOutHoldTime? number
---@param syncId? any
function UIFrameFlash(frame, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime, syncId) end

---@param frame WoWFrame
---@return number|nil isFlashing
function UIFrameIsFlashing(frame) end

---@param frame WoWFrame
function UIFrameFlashStop(frame) end

---@param which string
---@param textArg1? string
---@param textArg2? string
---@param data? any
---@return WoWFrame|nil dialog
function StaticPopup_Show(which, textArg1, textArg2, data) end

---@param which string
---@param data? any
function StaticPopup_Hide(which, data) end

---@param which string
---@return WoWFrame|nil dialog
function StaticPopup_Visible(which) end

---@param cooldown WoWFrame
---@param start number
---@param duration number
---@param enable number
function CooldownFrame_SetTimer(cooldown, start, duration, enable) end

---@param tooltip WoWFrame
---@param parent WoWFrame
function GameTooltip_SetDefaultAnchor(tooltip, parent) end

---@param tooltip? WoWFrame
---@param shift? boolean
function GameTooltip_ShowCompareItem(tooltip, shift) end

function GameTooltip_Hide() end

---@param menuList table
---@param menuFrame WoWFrame
---@param anchor any
---@param x? number
---@param y? number
---@param displayMode? string
---@param autoHideDelay? number
function EasyMenu(menuList, menuFrame, anchor, x, y, displayMode, autoHideDelay) end

---@param frame WoWFrame
---@param initFunction function
---@param displayMode? string
---@param level? number
---@param menuList? table
function UIDropDownMenu_Initialize(frame, initFunction, displayMode, level, menuList) end

---@return table info
function UIDropDownMenu_CreateInfo() end

---@param info table
---@param level? number
function UIDropDownMenu_AddButton(info, level) end

---@param level? number
---@param value? any
---@param dropDownFrame? WoWFrame
---@param anchorName? any
---@param xOffset? number
---@param yOffset? number
---@param menuList? table
---@param button? string
function ToggleDropDownMenu(level, value, dropDownFrame, anchorName, xOffset, yOffset, menuList, button) end

---@param level? number
function CloseDropDownMenus(level) end

---@param frame WoWFrame
---@param width number
---@param padding? number
function UIDropDownMenu_SetWidth(frame, width, padding) end

---@param frame WoWFrame
---@param text string
function UIDropDownMenu_SetText(frame, text) end

---@param frame WoWFrame
---@return string|nil text
function UIDropDownMenu_GetText(frame) end

---@param frame WoWFrame
---@param id? number
---@param useValue? boolean
function UIDropDownMenu_SetSelectedID(frame, id, useValue) end

---@param frame WoWFrame
---@param name? string
---@param useValue? boolean
function UIDropDownMenu_SetSelectedName(frame, name, useValue) end

---@param frame WoWFrame
---@return string|nil name
function UIDropDownMenu_GetSelectedName(frame) end

---@param frame WoWFrame
---@return number|nil id
function UIDropDownMenu_GetSelectedID(frame) end

---@param frame WoWFrame
---@param value? any
---@param useValue? boolean
function UIDropDownMenu_SetSelectedValue(frame, value, useValue) end

---@param frame WoWFrame
---@return any value
function UIDropDownMenu_GetSelectedValue(frame) end

---@param tab WoWFrame
---@param frame? WoWFrame
function PanelTemplates_Tab_OnClick(tab, frame) end

---@param frame WoWFrame
---@param id number
function PanelTemplates_SetTab(frame, id) end

---@param frame WoWFrame
---@return number|nil id
function PanelTemplates_GetSelectedTab(frame) end

---@param frame WoWFrame
function PanelTemplates_UpdateTabs(frame) end

---@param frame WoWFrame
---@param numTabs number
function PanelTemplates_SetNumTabs(frame, numTabs) end

---@param frame WoWFrame
---@param index number
function PanelTemplates_DisableTab(frame, index) end

---@param frame WoWFrame
---@param index number
function PanelTemplates_EnableTab(frame, index) end

---@param tab WoWFrame
---@param padding? number
---@param absoluteSize? number
---@param maxWidth? number
---@param absoluteTextSize? number
function PanelTemplates_TabResize(tab, padding, absoluteSize, maxWidth, absoluteTextSize) end

---@param frame WoWFrame
---@param numItems number
---@param numToDisplay number
---@param valueStep number
---@param button? WoWFrame
---@param smallWidth? number
---@param bigWidth? number
---@param highlightFrame? WoWFrame
---@param smallHighlightWidth? number
---@param bigHighlightWidth? number
---@param alwaysShowScrollBar? boolean
function FauxScrollFrame_Update(frame, numItems, numToDisplay, valueStep, button, smallWidth, bigWidth, highlightFrame, smallHighlightWidth, bigHighlightWidth, alwaysShowScrollBar) end

---@param frame WoWFrame
---@param value number
---@param itemHeight number
---@param updateFunction function
function FauxScrollFrame_OnVerticalScroll(frame, value, itemHeight, updateFunction) end

---@param frame WoWFrame
---@return number offset
function FauxScrollFrame_GetOffset(frame) end

---@param frame WoWFrame
---@param offset number
function FauxScrollFrame_SetOffset(frame, offset) end

---@param frame WoWFrame
---@param useValue? boolean
---@param dropdownLevel? number
function UIDropDownMenu_Refresh(frame, useValue, dropdownLevel) end

---@param level? number
function HideDropDownMenu(level) end

---@param frame WoWFrame
---@param width any
function UIDropDownMenu_SetButtonWidth(frame, width) end

---@param frame WoWFrame
function UIDropDownMenu_ClearAll(frame) end

---@param frame WoWFrame
---@param justification string
function UIDropDownMenu_JustifyText(frame, justification) end

---@param dropdown WoWFrame
---@param xOffset? number
---@param yOffset? number
---@param point? string
---@param relativeTo? any
---@param relativePoint? string
function UIDropDownMenu_SetAnchor(dropdown, xOffset, yOffset, point, relativeTo, relativePoint) end

---@param level number
---@param id number
function UIDropDownMenu_DisableButton(level, id) end

---@param level number
---@param id number
function UIDropDownMenu_EnableButton(level, id) end

---@param level number
---@param id number
---@param text string
---@param colorCode? string
function UIDropDownMenu_SetButtonText(level, id, text, colorCode) end

---@param dropDown WoWFrame
function UIDropDownMenu_DisableDropDown(dropDown) end

---@param dropDown WoWFrame
function UIDropDownMenu_EnableDropDown(dropDown) end

---@param dropDown WoWFrame
---@return boolean enabled
function UIDropDownMenu_IsEnabled(dropDown) end

---@return number|nil r
---@return number|nil g
---@return number|nil b
function ColorPicker_GetPreviousValues() end

---@param frame WoWFrame
---@param totalHeight number
---@param displayedHeight number
function HybridScrollFrame_Update(frame, totalHeight, displayedHeight) end

---@param frame WoWFrame
---@return number offset
---@return number exactOffset
function HybridScrollFrame_GetOffset(frame) end

---@param frame WoWFrame
---@param offset number
---@param height number
function HybridScrollFrame_ExpandButton(frame, offset, height) end

---@param frame WoWFrame
function HybridScrollFrame_CollapseButton(frame) end

---@param frame WoWFrame
---@param offset number
function HybridScrollFrame_SetOffset(frame, offset) end

---@param frame WoWFrame
---@param buttonTemplate string
---@param initialOffsetX? number
---@param initialOffsetY? number
---@param initialPoint? string
---@param initialRelative? string
---@param offsetX? number
---@param offsetY? number
---@param point? string
---@param relativePoint? string
function HybridScrollFrame_CreateButtons(frame, buttonTemplate, initialOffsetX, initialOffsetY, initialPoint, initialRelative, offsetX, offsetY, point, relativePoint) end

---@param frame WoWFrame
---@param script string
---@param header WoWFrame
---@param preBody string
---@param postBody? string
function SecureHandlerWrapScript(frame, script, header, preBody, postBody) end

---@param frame WoWFrame
---@param script string
---@return WoWFrame|nil header
---@return string|nil preBody
---@return string|nil postBody
function SecureHandlerUnwrapScript(frame, script) end

---@param frame WoWFrame
---@param body string
function SecureHandlerExecute(frame, body) end

---@param frame WoWFrame
---@param label string
---@param refFrame WoWFrame
function SecureHandlerSetFrameRef(frame, label, refFrame) end

---@param seconds number
---@return string text
function SecondsToTimeAbbrev(seconds) end

---@param name? string
---@param prefix? string
---@param returnAbbr? boolean
---@return string text
function GetBindingText(name, prefix, returnAbbr) end

---@param input string
---@return string binding
function GetBindingFromClick(input) end

---@param ... any
---@return string|nil text
function BuildListString(...) end

---@param ... any
---@return string|nil text
function BuildColoredListString(...) end

---@param ... any
---@return string|nil text
function BuildNewLineListString(...) end

---@param table table
---@param item any
function tDeleteItem(table, item) end

---@param table table
---@param item any
---@return number|nil index
function tContains(table, item) end

---@param settings table
---@return table copy
function CopyTable(settings) end

---@param globalStringName string
---@param tooltip? WoWFrame
---@param r? number
---@param g? number
---@param b? number
function BuildMultilineTooltip(globalStringName, tooltip, r, g, b) end

---@param region WoWRegion
---@param topOffset? number
---@param bottomOffset? number
---@param leftOffset? number
---@param rightOffset? number
---@return boolean isMouseOver
function MouseIsOver(region, topOffset, bottomOffset, leftOffset, rightOffset) end

---@param texture string|WoWTexture
---@param desaturation boolean
function SetDesaturation(texture, desaturation) end

---@param button WoWFrame
---@param count number
function SetItemButtonCount(button, count) end

---@param button WoWFrame
---@param numInStock number
function SetItemButtonStock(button, numInStock) end

---@param button WoWFrame
---@param texture? string
function SetItemButtonTexture(button, texture) end

---@param button WoWFrame
---@param r number
---@param g number
---@param b number
function SetItemButtonTextureVertexColor(button, r, g, b) end

---@param button WoWFrame
---@param desaturated boolean
---@param r? number
---@param g? number
---@param b? number
function SetItemButtonDesaturated(button, desaturated, r, g, b) end

---@param button WoWFrame
---@param r number
---@param g number
---@param b number
function SetItemButtonNormalTextureVertexColor(button, r, g, b) end

---@param button WoWFrame
---@param r number
---@param g number
---@param b number
function SetItemButtonNameFrameVertexColor(button, r, g, b) end

---@param button WoWFrame
---@param r number
---@param g number
---@param b number
function SetItemButtonSlotVertexColor(button, r, g, b) end

---@param link string
---@return boolean handled
function HandleModifiedItemClick(link) end

---@param text? string
---@return boolean inserted
function ChatEdit_InsertLink(text) end

---@param link string
function DressUpItemLink(link) end

---@param text string
---@return string link
function GetFixedLink(text) end

---@param unit UnitToken
---@return number r
---@return number g
---@return number b
function GameTooltip_UnitColor(unit) end

---@param frame WoWFrame
---@param money number
---@param type? string
---@param prefixText? string
---@param suffixText? string
function SetTooltipMoney(frame, money, type, prefixText, suffixText) end

---@param info table
function OpenColorPicker(info) end

---@param editBox WoWFrame
function EditBox_ClearFocus(editBox) end

---@param editBox WoWFrame
function EditBox_HighlightText(editBox) end

---@param editBox WoWFrame
function EditBox_ClearHighlight(editBox) end

---@param slider WoWFrame
function BlizzardOptionsPanel_Slider_Disable(slider) end

---@param slider WoWFrame
function BlizzardOptionsPanel_Slider_Enable(slider) end

---@param checkBox WoWFrame
function BlizzardOptionsPanel_CheckButton_Disable(checkBox) end

---@param checkBox WoWFrame
---@param isWhite? boolean
function BlizzardOptionsPanel_CheckButton_Enable(checkBox, isWhite) end

---@param cvar string
---@param value any
---@param event? string
function BlizzardOptionsPanel_SetCVarSafe(cvar, value, event) end

---@param cvar string
---@return any value
function BlizzardOptionsPanel_GetCVarSafe(cvar) end

---@param cvar string
---@return any value
function BlizzardOptionsPanel_GetCVarDefaultSafe(cvar) end

---@param cvar string
---@return any value
function BlizzardOptionsPanel_GetCVarMinSafe(cvar) end

---@param cvar string
---@return any value
function BlizzardOptionsPanel_GetCVarMaxSafe(cvar) end

---@param control WoWFrame
---@param parentFrame? WoWFrame
function BlizzardOptionsPanel_RegisterControl(control, parentFrame) end

---@param control WoWFrame
function BlizzardOptionsPanel_SetupControl(control) end

---@param dependency WoWFrame
---@param control WoWFrame
function BlizzardOptionsPanel_SetupDependentControl(dependency, control) end


-- ==================== GameTooltip ====================
-- Source: APIDocumentation/Documentation/GameTooltipAPIDocumentation.lua

---@param textLeft string
---@param textRight string
---@param rL number
---@param gL number
---@param bL number
---@param rR number
---@param gR number
---@param bR number
function WoWGameTooltip:AddDoubleLine(textLeft, textRight, rL, gL, bL, rR, gR, bR) end

function WoWGameTooltip:AddFontStrings() end

---@param text string
---@param r number
---@param g number
---@param b number
---@param a number
---@param wrap boolean
function WoWGameTooltip:AddLine(text, r, g, b, a, wrap) end

---@param texture string
function WoWGameTooltip:AddTexture(texture) end

---@param text string
function WoWGameTooltip:AppendText(text) end

function WoWGameTooltip:ClearLines() end

function WoWGameTooltip:FadeOut() end

---@return any anchor
function WoWGameTooltip:GetAnchorType() end

---@return string name
---@return string link
function WoWGameTooltip:GetItem() end

---@return number width
function WoWGameTooltip:GetMinimumWidth() end

---@return WoWFrame owner
function WoWGameTooltip:GetOwner() end

---@return number padding
function WoWGameTooltip:GetPadding() end

---@return string spellName
---@return string spellRank
---@return number spellID
function WoWGameTooltip:GetSpell() end

---@return string name
---@return string unit
function WoWGameTooltip:GetUnit() end

---@return 1|nil enabled
function WoWGameTooltip:IsEquippedItem() end

---@return 1|nil hasOwner
function WoWGameTooltip:IsOwned() end

---@param unit string
---@return 1|nil isUnit
function WoWGameTooltip:IsUnit(unit) end

---@return number numLines
function WoWGameTooltip:NumLines() end

---@param slot number
function WoWGameTooltip:SetAction(slot) end

--- Source signature: SetAnchorType(anchor: value, xOffset: number, yOffset: number)
---@param anchor any
---@param xOffset number
---@param yOffset number
function WoWGameTooltip:SetAnchorType(anchor, xOffset, yOffset) end

--- Source signature: SetAuctionItem(list: value, index: number)
---@param list any
---@param index number
function WoWGameTooltip:SetAuctionItem(list, index) end

function WoWGameTooltip:SetAuctionSellItem() end

---@param index number
function WoWGameTooltip:SetBackpackToken(index) end

function WoWGameTooltip:SetBagItem() end

---@param index number
function WoWGameTooltip:SetBuybackItem(index) end

---@param index number
function WoWGameTooltip:SetCurrencyToken(index) end

---@param name string
function WoWGameTooltip:SetEquipmentSet(name) end

---@param index number
---@param toDestroy boolean
function WoWGameTooltip:SetExistingSocketGem(index, toDestroy) end

---@param includeHidden boolean
function WoWGameTooltip:SetFrameStack(includeHidden) end

--- Source signature: SetGlyph(socket: number, glyphindex, talentGroup: value)
---@param socket number
---@param talentGroup any
function WoWGameTooltip:SetGlyph(socket, talentGroup) end

---@param tab number
---@param slot number
function WoWGameTooltip:SetGuildBankItem(tab, slot) end

---@param hyperlink string
function WoWGameTooltip:SetHyperlink(hyperlink) end

---@param hyperlink string
---@param index number
---@return number|nil success
function WoWGameTooltip:SetHyperlinkCompareItem(hyperlink, index) end

---@param mailID number
---@param attachmentIndex number
function WoWGameTooltip:SetInboxItem(mailID, attachmentIndex) end

---@param unit string
---@param slot number
---@param nameOnly boolean
---@return number|nil hasItem
---@return number|nil hasCooldown
---@return number repairCost
function WoWGameTooltip:SetInventoryItem(unit, slot, nameOnly) end

function WoWGameTooltip:SetLFGCompletionReward() end

function WoWGameTooltip:SetLFGDungeonReward() end

---@param slot number
function WoWGameTooltip:SetLootItem(slot) end

---@param id number
function WoWGameTooltip:SetLootRollItem(id) end

---@param index number
---@param currency number
function WoWGameTooltip:SetMerchantCostItem(index, currency) end

---@param merchantIndex number
function WoWGameTooltip:SetMerchantItem(merchantIndex) end

---@param width number
function WoWGameTooltip:SetMinimumWidth(width) end

--- Source signature: SetOwner(frame: frame, anchorType: value, xOffset: number, yOffset: number)
---@param frame WoWFrame
---@param anchorType any
---@param xOffset number
---@param yOffset number
function WoWGameTooltip:SetOwner(frame, anchorType, xOffset, yOffset) end

---@param padding number
function WoWGameTooltip:SetPadding(padding) end

---@param index number
function WoWGameTooltip:SetPetAction(index) end

---@param index number
function WoWGameTooltip:SetPossession(index) end

--- Source signature: SetQuestItem(itemType: value, index: number)
---@param itemType any
---@param index number
function WoWGameTooltip:SetQuestItem(itemType, index) end

--- Source signature: SetQuestLogItem(itemType: value, index: number)
---@param itemType any
---@param index number
function WoWGameTooltip:SetQuestLogItem(itemType, index) end

function WoWGameTooltip:SetQuestLogRewardSpell() end

---@param questIndex number
function WoWGameTooltip:SetQuestLogSpecialItem(questIndex) end

function WoWGameTooltip:SetQuestRewardSpell() end

---@param slot number
function WoWGameTooltip:SetSendMailItem(slot) end

---@param index number
function WoWGameTooltip:SetShapeshift(index) end

---@param index number
function WoWGameTooltip:SetSocketGem(index) end

function WoWGameTooltip:SetSocketedItem() end

function WoWGameTooltip:SetSpell() end

---@param id number
function WoWGameTooltip:SetSpellByID(id) end

--- Source signature: SetTalent(tabIndex: number, talentIndex: number, inspect: bool, pet: bool, talentGroup: value)
---@param tabIndex number
---@param talentIndex number
---@param inspect boolean
---@param pet boolean
---@param talentGroup any
function WoWGameTooltip:SetTalent(tabIndex, talentIndex, inspect, pet, talentGroup) end

---@param text string
---@param r number
---@param g number
---@param b number
---@param a number
function WoWGameTooltip:SetText(text, r, g, b, a) end

--- Source signature: SetTotem(slot: value)
---@param slot any
function WoWGameTooltip:SetTotem(slot) end

function WoWGameTooltip:SetTracking() end

---@param index number
function WoWGameTooltip:SetTradePlayerItem(index) end

---@param skillIndex number
---@param reagentIndex number
function WoWGameTooltip:SetTradeSkillItem(skillIndex, reagentIndex) end

---@param index number
function WoWGameTooltip:SetTradeTargetItem(index) end

---@param index number
function WoWGameTooltip:SetTrainerService(index) end

---@param unit string
function WoWGameTooltip:SetUnit(unit) end

--- Source signature: SetUnitAura(unit: string, unitid, index: number, filter: as opposed to self buffs)
---@param unit string
---@param index number
---@param filter any
function WoWGameTooltip:SetUnitAura(unit, index, filter) end

--- Source signature: SetUnitBuff(unit: string, unitid, index: number, filter: as opposed to self buffs)
---@param unit string
---@param index number
---@param filter any
function WoWGameTooltip:SetUnitBuff(unit, index, filter) end

--- Source signature: SetUnitDebuff(unit: string, unitid, index: number, filter: as opposed to self buffs)
---@param unit string
---@param index number
---@param filter any
function WoWGameTooltip:SetUnitDebuff(unit, index, filter) end

---@return 1|nil enabled
function WoWGameTooltip:CanChangeAttribute() end


-- ==================== Glyph ====================
-- Source: APIDocumentation/Documentation/GlyphDocumentation.lua

---@param socket number
---@param talentGroup number
---@return string link
function GetGlyphLink(socket, talentGroup) end

---@param socket number
---@param talentGroup number
---@return boolean enabled
---@return number glyphType
---@return integer glyphTooltipIndex
---@return number glyphSpell
---@return string icon
function GetGlyphSocketInfo(socket, talentGroup) end

function GetNumGlyphSockets() end

---@param socket number
---@return boolean match
function GlyphMatchesSocket(socket) end

---@param socket number
function PlaceGlyphInSocket(socket) end

---@param socket number
function RemoveGlyphFromSocket(socket) end

---@return boolean canTarget
function SpellCanTargetGlyph() end


-- ==================== GM Survey ====================
-- Source: APIDocumentation/Documentation/GmSurveyDocumentation.lua

---@param questionIndex integer
---@param answerIndex integer
---@return string answerText
function GMSurveyAnswer(questionIndex, answerIndex) end

---@param question number
---@param rank number
---@param comment string
function GMSurveyAnswerSubmit(question, rank, comment) end

---@param comment string
function GMSurveyCommentSubmit(comment) end

---@param questionIndex integer
---@return number numAnswers
function GMSurveyNumAnswers(questionIndex) end

---@param index integer
---@return string surveyQuestion
function GMSurveyQuestion(index) end

function GMSurveySubmit() end


-- ==================== GM Ticket ====================
-- Source: APIDocumentation/Documentation/GmTicketDocumentation.lua

function DeleteGMTicket() end

function GMResponseNeedMoreHelp() end

function GMResponseResolve() end

-- Additional source entry: APIDocumentation/Documentation/GmTicketDocumentation.lua :: GetGMStatus()

function GetGMTicket() end

---@return any[] ...
function GetGMTicketCategories() end

---@param text string
---@param needResponse boolean
function NewGMTicket(text, needResponse) end

function Stuck() end

---@param text string
function UpdateGMTicket(text) end


-- ==================== Guild Bank ====================
-- Source: APIDocumentation/Documentation/GuildBankDocumentation.lua

---@param tab number
---@param slot number
function AutoStoreGuildBankItem(tab, slot) end

function BuyGuildBankTab() end

---@param tab number
---@return boolean canEdit
function CanEditGuildTabInfo(tab) end

---@return boolean canRepair
function CanGuildBankRepair() end

---@return boolean canWithdraw
function CanWithdrawGuildBankMoney() end

function CloseGuildBankFrame() end

---@param money number
function DepositGuildBankMoney(money) end

---@param currentTab number
function GetCurrentGuildBankTab(currentTab) end

---@param tab number
---@param slot number
---@return string texture
---@return number count
---@return boolean locked
function GetGuildBankItemInfo(tab, slot) end

---@param tab number
---@param slot number
---@return string item
function GetGuildBankItemLink(tab, slot) end

---@return number guildBankMoney
function GetGuildBankMoney() end

---@param index integer
---@return string type
---@return string name
---@return number year
---@return number month
---@return number day
---@return number hour
function GetGuildBankMoneyTransaction(index) end

---@return number tabCost
function GetGuildBankTabCost() end

---@param tab number
---@return string name
---@return string icon
---@return boolean isViewable
---@return boolean canDeposit
---@return number numWithdrawals
---@return number remainingWithdrawals
function GetGuildBankTabInfo(tab) end

---@param tab number
---@return boolean canView
---@return boolean canDeposit
---@return boolean canUpdateText
---@return number numWithdrawls
function GetGuildBankTabPermissions(tab) end

---@param tab number
---@return string text
function GetGuildBankText(tab) end

---@param tab number
---@param index integer
---@return string type
---@return string name
---@return string itemLink
---@return number count
---@return number tab1
---@return number tab2
---@return number year
---@return number month
---@return number day
---@return number hour
function GetGuildBankTransaction(tab, index) end

---@return number goldWithdrawLimit
function GetGuildBankWithdrawLimit() end

---@return number withdrawLimit
function GetGuildBankWithdrawMoney() end

---@return number numTransactions
function GetNumGuildBankMoneyTransactions() end

---@return number numTabs
function GetNumGuildBankTabs() end

---@param tab number
---@return number numTransactions
function GetNumGuildBankTransactions(tab) end

-- Additional source entry: APIDocumentation/Documentation/GuildBankDocumentation.lua :: PickupGuildBankItem(tab: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/GuildBankDocumentation.lua :: PickupGuildBankMoney(amount: number)

---@param tab number
function QueryGuildBankLog(tab) end

---@param tab number
function QueryGuildBankTab(tab) end

---@param tab number
function QueryGuildBankText(tab) end

---@param tab number
function SetCurrentGuildBankTab(tab) end

---@param tab number
---@param permission number
---@param enabled boolean
function SetGuildBankTabPermissions(tab, permission, enabled) end

---@param tab number
---@param text string
function SetGuildBankText(tab, text) end

-- Additional source entry: APIDocumentation/Documentation/GuildBankDocumentation.lua :: SplitGuildBankItem(tab: number, slot: number, amount: number)

---@param amount number
function WithdrawGuildBankMoney(amount) end

---@param tab number
---@param name string
---@param iconIndex number
function SetGuildBankTabInfo(tab, name, iconIndex) end

function SetGuildBankTabWithdraw() end

function SetGuildBankWithdrawLimit() end


-- ==================== Guild ====================
-- Source: APIDocumentation/Documentation/GuildDocumentation.lua

function AcceptGuild() end

---@param guildName string
function BuyGuildCharter(guildName) end

-- Additional source entry: APIDocumentation/Documentation/GuildDocumentation.lua :: CanEditGuildEvent()

---@return boolean canEdit
function CanEditGuildInfo() end

---@return boolean canEdit
function CanEditMOTD() end

---@return boolean canEdit
function CanEditOfficerNote() end

---@return boolean canEdit
function CanEditPublicNote() end

---@return boolean canDemote
function CanGuildDemote() end

---@return boolean canInvite
function CanGuildInvite() end

---@return boolean canPromote
function CanGuildPromote() end

---@return boolean canRemove
function CanGuildRemove() end

---@return boolean canView
function CanViewOfficerNote() end

function CloseGuildRegistrar() end

function CloseGuildRoster() end

function CloseTabardCreation() end

function DeclineGuild() end

---@return number cost
function GetGuildCharterCost() end

---@param index integer
---@return string type
---@return string player1
---@return string player2
---@return string rank
---@return number year
---@return number month
---@return number day
---@return number hour
function GetGuildEventInfo(index) end

---@param unit? UnitToken
---@param name? string
---@return string guildName
---@return string guildRankName
---@return integer guildRankIndex
function GetGuildInfo(unit, name) end

---@return string guildInfoText
function GetGuildInfoText() end

---@param index integer
---@return string name
---@return string rank
---@return integer rankIndex
---@return number level
---@return string class
---@return string zone
---@return string note
---@return string officernote
---@return boolean online
---@return string status
---@return string classFileName
function GetGuildRosterInfo(index) end

---@param index integer
---@return number years
---@return number months
---@return number days
---@return number hours
function GetGuildRosterLastOnline(index) end

---@return string guildMOTD
function GetGuildRosterMOTD() end

---@return integer index
function GetGuildRosterSelection() end

---@return boolean showOffline
function GetGuildRosterShowOffline() end

---@return string tabardBackgroundUpper
---@return string tabardBackgroundLower
---@return string tabardEmblemUpper
---@return string tabardEmblemLower
---@return string tabardBorderUpper
---@return string tabardBorderLower
function GetGuildTabardFileNames() end

---@return number numEvents
function GetNumGuildEvents() end

---@param includeOffline? boolean
---@return number numGuildMembers
function GetNumGuildMembers(includeOffline) end

---@return number cost
function GetTabardCreationCost() end

function GetTabardInfo() end

---@param name string
function GuildControlAddRank(name) end

---@param name string
function GuildControlDelRank(name) end

---@return number numRanks
function GuildControlGetNumRanks() end

---@return any[] ...
function GuildControlGetRankFlags() end

---@param rank number
---@return string rankName
function GuildControlGetRankName(rank) end

---@param name string
function GuildControlSaveRank(name) end

---@param rank number
function GuildControlSetRank(rank) end

---@param index integer
---@param enabled boolean
function GuildControlSetRankFlag(index, enabled) end

---@param name string
function GuildDemote(name) end

function GuildDisband() end

function GuildInfo() end

---@param name string
function GuildInvite(name) end

function GuildLeave() end

---@param name string
function GuildPromote(name) end

function GuildRoster() end

---@param index integer
---@param note string
function GuildRosterSetOfficerNote(index, note) end

---@param index integer
---@param note string
function GuildRosterSetPublicNote(index, note) end

---@param name string
function GuildSetLeader(name) end

---@param message string
function GuildSetMOTD(message) end

---@param name string
function GuildUninvite(name) end

---@return boolean isLeader
function IsGuildLeader() end

---@return boolean inGuild
function IsInGuild() end

function QueryGuildEventLog() end

---@param text string
function SetGuildInfoText(text) end

---@param index integer
function SetGuildRosterSelection(index) end

---@param showOffline boolean
function SetGuildRosterShowOffline(showOffline) end

---@param type string
function SortGuildRoster(type) end

function TurnInGuildCharter() end

---@param unit? UnitToken
---@param name? string
---@return boolean inGuild
function UnitIsInMyGuild(unit, name) end


-- ==================== Hyperlink ====================
-- Source: APIDocumentation/Documentation/HyperlinkDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetAchievementLink(id: number)

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetAuctionItemLink(list: string, index: luaIndex)

---@param index integer
---@return string link
function GetBuybackItemLink(index) end

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetContainerItemLink(container: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetCursorInfo()

---@param index integer
---@return string link
function GetExistingSocketLink(index) end

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetGlyphLink(socket: number, talentGroup: number)

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetGuildBankItemLink(tab: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/HyperlinkDocumentation.lua :: GetGuildBankTransaction(tab: number, index: luaIndex)

---@param mailID number
---@param attachmentIndex integer
---@return string itemlink
function GetInboxItemLink(mailID, attachmentIndex) end

---@param unit UnitToken
---@param slot number
---@return string link
function GetInventoryItemLink(unit, slot) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@param index? integer
---@return string name
---@return string link
function GetItemGem(itemID, itemName, itemLink, index) end

---@param id number
---@return string link
function GetLootRollItemLink(id) end

---@param slot number
---@return string link
function GetLootSlotLink(slot) end

---@param index? integer
---@param name? string
---@return string name
---@return string link
function GetMacroItem(index, name) end

---@param index integer
---@return string link
function GetMerchantItemLink(index) end

---@param index integer
---@return string link
function GetNewSocketLink(index) end

---@param itemType string
---@param index integer
---@return string link
function GetQuestItemLink(itemType, index) end

---@param questIndex integer
---@return string link
function GetQuestLink(questIndex) end

---@param itemType string
---@param index integer
function GetQuestLogItemLink(itemType, index) end

---@param slot number
---@return string itemlink
function GetSendMailItemLink(slot) end

---@param index? integer
---@param bookType? string
---@param name? string
---@param id? number
---@return string link
---@return string tradeLink
function GetSpellLink(index, bookType, name, id) end

---@param tabIndex integer
---@param talentIndex integer
---@param inspect boolean
---@param pet boolean
---@param talentGroup number
---@return string link
function GetTalentLink(tabIndex, talentIndex, inspect, pet, talentGroup) end

---@param index integer
---@return string link
function GetTradePlayerItemLink(index) end

---@param index integer
---@return string link
function GetTradeSkillItemLink(index) end

---@return string link
function GetTradeSkillListLink() end

---@param skillIndex integer
---@param reagentIndex integer
---@return string link
function GetTradeSkillReagentItemLink(skillIndex, reagentIndex) end

---@param index integer
---@return string link
function GetTradeSkillRecipeLink(index) end

---@param index integer
---@return string link
function GetTradeTargetItemLink(index) end

---@param index integer
---@return string link
function GetTrainerServiceItemLink(index) end


-- ==================== Ingame Movie Playback ====================
-- Source: APIDocumentation/Documentation/InGameMoviePlaybackDocumentation.lua

function GameMovieFinished() end

---@return number resolution
function GetMovieResolution() end

---@return boolean inCinematic
function InCinematic() end

function OpeningCinematic() end

function StopCinematic() end


-- ==================== Inspect ====================
-- Source: APIDocumentation/Documentation/InspectDocumentation.lua

---@param unit UnitToken
---@param showError boolean
---@return boolean canInspect
function CanInspect(unit, showError) end

function ClearInspectPlayer() end

---@param team number
---@return string teamName
---@return number teamSize
---@return number teamRating
---@return number teamPlayed
---@return number teamWins
---@return number playerPlayed
---@return number playerRating
---@return number bg_red
---@return number bg_green
---@return number bg_blue
---@return number emblem
---@return number emblem_red
---@return number emblem_green
---@return number emblem_blue
---@return number border
---@return number border_red
---@return number border_green
---@return number border_blue
function GetInspectArenaTeamData(team) end

---@return number todayHK
---@return number todayHonor
---@return number yesterdayHK
---@return number yesterdayHonor
---@return number lifetimeHK
---@return number lifetimeRank
function GetInspectHonorData() end

---@return boolean hasData
function HasInspectHonorData() end

---@param unit UnitToken
function NotifyInspect(unit) end

function RequestInspectHonorData() end


-- ==================== Instance ====================
-- Source: APIDocumentation/Documentation/InstanceDocumentation.lua

---@return boolean canResetInstances
function CanShowResetInstances() end

---@return number difficulty
function GetDungeonDifficulty() end

---@return number timeleft
function GetInstanceBootTimeRemaining() end

---@return number difficulty
function GetInstanceDifficulty() end

---@return string name
---@return string type
---@return number difficulty
---@return string difficultyName
---@return number maxPlayers
---@return number playerDifficulty
---@return boolean isDynamicInstance
function GetInstanceInfo() end

---@return number seconds
function GetInstanceLockTimeRemaining() end

---@return number savedInstances
function GetNumSavedInstances() end

---@return number numUI
function GetNumWorldStateUI() end

---@param index integer
---@return string instanceName
---@return number instanceID
---@return number instanceReset
---@return number instanceDifficulty
---@return boolean locked
---@return boolean extended
---@return number instanceIDMostSig
---@return boolean isRaid
---@return number maxPlayers
---@return string difficultyName
function GetSavedInstanceInfo(index) end

---@param index integer
---@return number uiType
---@return number state
---@return string text
---@return string icon
---@return string dynamicIcon
---@return string tooltip
---@return string dynamicTooltip
---@return string extendedUI
---@return number extendedUIState1
---@return number extendedUIState2
---@return number extendedUIState3
function GetWorldStateUIInfo(index) end

---@return boolean isInstance
---@return string instanceType
function IsInInstance() end

---@param portOut boolean
function LFGTeleport(portOut) end

function RequestRaidInfo() end

function ResetInstances() end

---@param response boolean
function RespondInstanceLock(response) end

---@param difficulty number
function SetDungeonDifficulty(difficulty) end

---@param difficulty number
function SetRaidDifficulty(difficulty) end


-- ==================== Inventory ====================
-- Source: APIDocumentation/Documentation/InventoryDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: AutoEquipCursorItem()

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: BankButtonIDToInvSlotID(buttonID: number, isBag: bool?)

---@param index integer
function CancelPendingEquip(index) end

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: ContainerIDToInventoryID(container: number)

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: CursorCanGoInSlot(slot: number)

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: EquipCursorItem()

---@param itemID? number
---@param itemName? string
---@param itemLink? string
function EquipItemByName(itemID, itemName, itemLink) end

---@param index integer
function EquipPendingItem(index) end

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: EquipmentManager_UnpackLocation(location: number?)

---@param slot number
---@return number status
function GetInventoryAlertStatus(slot) end

---@param unit UnitToken
---@param slot number
---@return boolean isBroken
function GetInventoryItemBroken(unit, slot) end

---@param unit UnitToken
---@param slot number
---@return number start
---@return number duration
---@return number enable
function GetInventoryItemCooldown(unit, slot) end

---@param unit UnitToken
---@param slot number
---@return number count
function GetInventoryItemCount(unit, slot) end

---@param slot number
---@return number durability
---@return number max
function GetInventoryItemDurability(slot) end

---@param slot number
---@return number gem1
---@return number gem2
---@return number gem3
function GetInventoryItemGems(slot) end

---@param unit UnitToken
---@param slot number
---@return number id
function GetInventoryItemID(unit, slot) end

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: GetInventoryItemLink(unit: UnitToken, slot: number)

---@param unit UnitToken
---@param slot number
---@return integer quality
function GetInventoryItemQuality(unit, slot) end

---@param unit UnitToken
---@param slot number
---@return string texture
function GetInventoryItemTexture(unit, slot) end

---@param slot number
---@return table availableItems
function GetInventoryItemsForSlot(slot) end

---@param slotName string
---@return number id
---@return string texture
---@return boolean checkRelic
function GetInventorySlotInfo(slotName) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isEquipped
function IsEquippedItem(itemID, itemName, itemLink) end

---@param type string
---@return boolean isEquipped
function IsEquippedItemType(type) end

---@param slot number
---@return boolean isLocked
function IsInventoryItemLocked(slot) end

---@param slot number
---@return number slot
function KeyRingButtonIDToInvSlotID(slot) end

-- Additional source entry: APIDocumentation/Documentation/InventoryDocumentation.lua :: PickupInventoryItem(slot: number)

---@param texture table
---@param unit UnitToken
---@param slot number
function SetInventoryPortraitTexture(texture, unit, slot) end

---@param slot number
function SocketInventoryItem(slot) end

function UpdateInventoryAlertStatus() end

---@param slot number
function UseInventoryItem(slot) end


-- ==================== Item ====================
-- Source: APIDocumentation/Documentation/ItemDocumentation.lua

function BindEnchant() end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: CancelPendingEquip(index: luaIndex)

function ConfirmBindOnUse() end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: CursorHasItem()

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: DeleteCursorItem()

---@param id number
function EndBoundTradeable(id) end

---@param id number
function EndRefund(id) end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: EquipItemByName(itemID: number?, itemName: string?, itemLink: string?)

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: EquipPendingItem(index: luaIndex)

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return number start
---@return number duration
---@return number enable
function GetItemCooldown(itemID, itemName, itemLink) end

---@param itemId? number
---@param itemName? string
---@param itemLink? string
---@param includeBank? boolean
---@param includeCharges? boolean
---@return number itemCount
function GetItemCount(itemId, itemName, itemLink, includeBank, includeCharges) end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: GetItemFamily(itemID: number?, itemName: string?, itemLink: string?)

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: GetItemGem(itemID: number?, itemName: string?, itemLink: string?, index: luaIndex?)

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return string texture
function GetItemIcon(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return string name
---@return string link
---@return integer quality
---@return number iLevel
---@return number reqLevel
---@return string class
---@return string subclass
---@return number maxStack
---@return string equipSlot
---@return string texture
---@return number vendorPrice
function GetItemInfo(itemID, itemName, itemLink) end

---@param quality integer
---@return number redComponent
---@return number greenComponent
---@return number blueComponent
---@return string hexColor
function GetItemQualityColor(quality) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return string name
---@return string rank
function GetItemSpell(itemID, itemName, itemLink) end

---@param item1Link string
---@param item2Link string
---@param returnTable? table
---@return table statTable
function GetItemStatDelta(item1Link, item2Link, returnTable) end

---@param itemLink string
---@param returnTable? table
---@return table statTable
function GetItemStats(itemLink, returnTable) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return number uniqueFamily
---@return number maxEquipped
function GetItemUniqueness(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean consumable
function IsConsumableItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isItem
function IsCurrentItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isDressable
function IsDressableItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isEquippable
function IsEquippableItem(itemID, itemName, itemLink) end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: IsEquippedItem(itemID: number?, itemName: string?, itemLink: string?)

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: IsEquippedItemType(type: string)

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isHarmful
function IsHarmfulItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isHarmful
function IsHelpfulItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@param unit? UnitToken
---@return boolean inRange
function IsItemInRange(itemID, itemName, itemLink, unit) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean isUsable
---@return boolean notEnoughMana
function IsUsableItem(itemID, itemName, itemLink) end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean hasRange
function ItemHasRange(itemID, itemName, itemLink) end

-- Additional source entry: APIDocumentation/Documentation/ItemDocumentation.lua :: PickupItem(itemID: number?, itemName: string?, itemLink: string?)

function ReplaceEnchant() end

---@return boolean canTarget
function SpellCanTargetItem() end

---@param itemID? number
---@param itemName? string
---@param itemLink? string
function SpellTargetItem(itemID, itemName, itemLink) end

---@param name string
---@param target string
function UseItemByName(name, target) end


-- ==================== Item Text ====================
-- Source: APIDocumentation/Documentation/ItemTextDocumentation.lua

function CloseItemText() end

---@return string creator
function ItemTextGetCreator() end

---@return string text
function ItemTextGetItem() end

---@return string material
function ItemTextGetMaterial() end

---@return number page
function ItemTextGetPage() end

---@return string text
function ItemTextGetText() end

---@return boolean next
function ItemTextHasNextPage() end

function ItemTextNextPage() end

function ItemTextPrevPage() end


-- ==================== Keybind ====================
-- Source: APIDocumentation/Documentation/KeybindDocumentation.lua

---@param owner table
function ClearOverrideBindings(owner) end

---@param index integer
---@return string commandName
---@return string binding1
---@return string binding2
function GetBinding(index) end

---@param key string
---@param checkOverride? boolean
---@return string action
function GetBindingAction(key, checkOverride) end

---@param key string
---@return string action
function GetBindingByKey(key) end

---@param COMMAND string
---@return string key1
---@return any[] ...
function GetBindingKey(COMMAND) end

---@return number bindingSet
function GetCurrentBindingSet() end

---@return number numBindings
function GetNumBindings() end

---@param set number
function LoadBindings(set) end

---@param COMMAND string
function RunBinding(COMMAND) end

---@param set number
function SaveBindings(set) end

---@param key string
---@param command? string
---@return boolean success
function SetBinding(key, command) end

---@param key string
---@param buttonName string
---@param mouseButton? string
---@return boolean success
function SetBindingClick(key, buttonName, mouseButton) end

---@param key? string
---@param itemID? number
---@param itemName? string
---@param itemLink? string
---@return boolean success
function SetBindingItem(key, itemID, itemName, itemLink) end

---@param key? string
---@param index? integer
---@param name? string
---@return boolean success
function SetBindingMacro(key, index, name) end

---@param key string
---@param spellname string
---@return boolean success
function SetBindingSpell(key, spellname) end

---@param key string
---@param binding string
function SetMouselookOverrideBinding(key, binding) end

---@param owner table
---@param isPriority boolean
---@param key string
---@param command string
function SetOverrideBinding(owner, isPriority, key, command) end

---@param owner table
---@param isPriority boolean
---@param key string
---@param buttonName string
---@param mouseButton? string
function SetOverrideBindingClick(owner, isPriority, key, buttonName, mouseButton) end

---@param owner? table
---@param isPriority? boolean
---@param key? string
---@param itemID? number
---@param itemName? string
---@param itemLink? string
function SetOverrideBindingItem(owner, isPriority, key, itemID, itemName, itemLink) end

---@param owner? table
---@param isPriority? boolean
---@param key? string
---@param index? integer
---@param name? string
function SetOverrideBindingMacro(owner, isPriority, key, index, name) end

---@param owner table
---@param isPriority boolean
---@param key string
---@param spellname string
function SetOverrideBindingSpell(owner, isPriority, key, spellname) end


-- ==================== Keyboard ====================
-- Source: APIDocumentation/Documentation/KeyboardDocumentation.lua

---@return WoWFrame frame
function GetCurrentKeyBoardFocus() end

---@return boolean isDown
function IsAltKeyDown() end

---@return boolean isDown
function IsControlKeyDown() end

---@return boolean isDown
function IsLeftAltKeyDown() end

---@return boolean isDown
function IsLeftControlKeyDown() end

---@return boolean isDown
function IsLeftShiftKeyDown() end

---@return boolean isDown
function IsModifierKeyDown() end

---@return boolean isDown
function IsRightAltKeyDown() end

---@return boolean isDown
function IsRightControlKeyDown() end

---@return boolean isDown
function IsRightShiftKeyDown() end

---@return boolean isDown
function IsShiftKeyDown() end


-- ==================== KnowledgeBase ====================
-- Source: APIDocumentation/Documentation/KnowledgeBaseDocumentation.lua

---@param articleId number
---@param searchType number
function KBArticle_BeginLoading(articleId, searchType) end

---@return number id
---@return string subject
---@return string subjectAlt
---@return string text
---@return string keywords
---@return number languageId
---@return boolean isHot
function KBArticle_GetData() end

---@return boolean isLoaded
function KBArticle_IsLoaded() end

---@param searchText string
---@param categoryIndex integer
---@param subcategoryIndex integer
---@param numArticles number
---@param page number
function KBQuery_BeginLoading(searchText, categoryIndex, subcategoryIndex, numArticles, page) end

---@return number articleHeaderCount
function KBQuery_GetArticleHeaderCount() end

---@param index integer
---@return number articleId
---@return string title
---@return boolean isHotIssue
---@return boolean isRecentlyUpdated
function KBQuery_GetArticleHeaderData(index) end

---@return number totalArticleHeaderCount
function KBQuery_GetTotalArticleCount() end

---@return boolean isLoaded
function KBQuery_IsLoaded() end

---@param numArticles number
---@param currentPage number
function KBSetup_BeginLoading(numArticles, currentPage) end

---@return number articleHeaderCount
function KBSetup_GetArticleHeaderCount() end

---@param index integer
---@return number articleId
---@return string title
---@return boolean isHotIssue
---@return boolean isRecentlyUpdated
function KBSetup_GetArticleHeaderData(index) end

---@return number numCategories
function KBSetup_GetCategoryCount() end

---@param index integer
---@return number categoryId
---@return string name
function KBSetup_GetCategoryData(index) end

---@return number numLanguages
function KBSetup_GetLanguageCount() end

---@param index integer
---@return number languageId
---@return string name
function KBSetup_GetLanguageData(index) end

---@param index integer
---@return number numSubCategories
function KBSetup_GetSubCategoryCount(index) end

---@param index integer
---@param subindex integer
---@return number categoryId
---@return string name
function KBSetup_GetSubCategoryData(index, subindex) end

---@return number numArticles
function KBSetup_GetTotalArticleCount() end

---@return boolean isLoaded
function KBSetup_IsLoaded() end

---@return string text
function KBSystem_GetMOTD() end

---@return string text
function KBSystem_GetServerNotice() end

---@return string statusMessage
function KBSystem_GetServerStatus() end


-- ==================== Limited Play Time ====================
-- Source: APIDocumentation/Documentation/LimitedPlayTimeDocumentation.lua

---@return number time
function GetBillingTimeRested() end

---@return boolean hasNoTime
function NoPlayTime() end

---@return boolean partialPlayTime
function PartialPlayTime() end


-- ==================== Locale Specific ====================
-- Source: APIDocumentation/Documentation/LocaleSpecificDocumentation.lua

---@param name string
---@param gender number
---@param declensionSet number
---@return string genitive
---@return string dative
---@return string accusative
---@return string instrumental
---@return string prepositional
function DeclineName(name, gender, declensionSet) end

---@param table number
---@param female? boolean
function FillLocalizedClassList(table, female) end

---@param name string
---@param gender number
---@return number numSets
function GetNumDeclensionSets(name, gender) end


-- ==================== Looking for Group ====================
-- Source: APIDocumentation/Documentation/LookingForGroupDocumentation.lua

---@return string mode
---@return string submode
function GetLFGMode() end

---@return boolean leader
---@return boolean tank
---@return boolean healer
---@return boolean damage
function GetLFGRoles() end

---@return any[] ...
function GetLFGTypes() end

---@param comment string
function SetLFGComment(comment) end

---@param leader boolean
---@param tank boolean
---@param healer boolean
---@param damage boolean
function SetLFGRoles(leader, tank, healer, damage) end


-- ==================== Loot ====================
-- Source: APIDocumentation/Documentation/LootDocumentation.lua

function CloseLoot() end

---@param id number
---@param rollType number
function ConfirmLootRoll(id, rollType) end

---@param slot number
function ConfirmLootSlot(slot) end

---@return string method
---@return number partyMaster
---@return number raidMaster
function GetLootMethod() end

---@param id number
---@return string texture
---@return string name
---@return number count
---@return integer quality
---@return boolean bindOnPickUp
function GetLootRollItemInfo(id) end

-- Additional source entry: APIDocumentation/Documentation/LootDocumentation.lua :: GetLootRollItemLink(id: number)

---@param id number
---@return number timeLeft
function GetLootRollTimeLeft(id) end

---@param slot number
---@return string texture
---@return string item
---@return number quantity
---@return integer quality
---@return boolean locked
function GetLootSlotInfo(slot) end

-- Additional source entry: APIDocumentation/Documentation/LootDocumentation.lua :: GetLootSlotLink(slot: number)

---@return number threshold
function GetLootThreshold() end

---@param index integer
---@return string candidate
function GetMasterLootCandidate(index) end

---@return number numItems
function GetNumLootItems() end

---@return boolean isOptOut
function GetOptOutOfLoot() end

---@param slot number
---@param index integer
function GiveMasterLoot(slot, index) end

---@return boolean isFishing
function IsFishingLoot() end

---@param slot number
function LootSlot(slot) end

---@param slot number
---@return boolean isCoin
function LootSlotIsCoin(slot) end

---@param slot number
---@return boolean isItem
function LootSlotIsItem(slot) end

---@param id number
---@param rollType number
function RollOnLoot(id, rollType) end

---@param method string
---@param master? string
function SetLootMethod(method, master) end

---@param texture table
function SetLootPortrait(texture) end

---@param threshold number
function SetLootThreshold(threshold) end

---@param enable boolean
function SetOptOutOfLoot(enable) end


-- ==================== Lua Library ====================
-- Source: APIDocumentation/Documentation/LuaLibraryDocumentation.lua

---@param x number
---@return number absoluteValue
function abs(x) end

---@param x number
---@return number ceiling
function ceil(x) end

---@param option string
---@param arg? number
function collectgarbage(option, arg) end

---@param format? string
---@param time? number
---@return string dateValue
function date(format, time) end

---@param radians number
---@return number degrees
function deg(radians) end

---@param time2 number
---@param time1 number
---@return number seconds
function difftime(time2, time1) end

---@param message string
---@param level? number
function error(message, level) end

---@param x number
---@return number exp
function exp(x) end

---@param x number
---@return number floor
function floor(x) end

function foreach() end

function foreachi() end

---@param formatString string
---@param ... table
---@return number formatted
function format(formatString, ...) end

---@param x number
---@return number m
---@return number e
function frexp(x) end

---@return number count
function gcinfo() end

---@param f? function
---@param stackLevel? number
---@return table env
function getfenv(f, stackLevel) end

---@param object string
---@return string metatable
function getmetatable(object) end

function getn() end

---@param s string
---@param pattern string
---@return function iterator
function gmatch(s, pattern) end

---@param s? string
---@param pattern? string
---@param rep? string
---@param repTable? table
---@param repFunc? function
---@param maxReplaced? number
---@return string newString
---@return number numMatched
function gsub(s, pattern, rep, repTable, repFunc, maxReplaced) end

---@param t table
---@return function iterator
---@return table t
---@return integer index
function ipairs(t) end

---@param m number
---@param e number
---@return number x
function ldexp(m, e) end

---@param s string
---@param chunkname? string
---@return function chunk
---@return string error
function loadstring(s, chunkname) end

---@param x number
---@return number naturalLog
function log(x) end

---@param x number
---@return number base10log
function log10(x) end

---@param ... any
---@return number maximum
function max(...) end

---@param ... any
---@return number maximum
function min(...) end

---@param t table
---@param key? any
---@return any nextKey
---@return any nextValue
function next(t, key) end

---@param t table
---@return function iterator
---@return table t
---@return integer index
function pairs(t) end

---@param f function
---@param ... table
---@return boolean status
---@return any[] ...
function pcall(f, ...) end

---@param degrees number
---@return number radians
function rad(degrees) end

---@param m? number
---@param n? number
---@return number randomNum
function random(m, n) end

---@param v1 string
---@param v2 function
---@return boolean isEqual
function rawequal(v1, v2) end

---@param t table
---@param key string
---@return string value
function rawget(t, key) end

---@param t table
---@param key string
---@param value string
function rawset(t, key, value) end

---@param index any
---@param ... any
---@return any ...
function select(index, ...) end

---@param f? function
---@param stackLevel? number
---@param t? table
---@return function f
function setfenv(f, stackLevel, t) end

---@param t table
---@param metatable table
---@return table t
function setmetatable(t, metatable) end

---@param table table
---@param comparator? function
function sort(table, comparator) end

---@param x number
---@return number root
function sqrt(x) end

---@param s string
---@param firstChar number
---@param lastChar? number
---@return number value
---@return any[] ...
function strbyte(s, firstChar, lastChar) end

---@param n number
---@param ... number
---@return number s
function strchar(n, ...) end

---@param s string
---@param pattern string
---@param init number
---@param plain? boolean
---@return number start
---@return number end_
---@return any[] ...
function strfind(s, pattern, init, plain) end

---@param s string
---@return number length
function strlen(s) end

---@param s string
---@return string lowerCase
function strlower(s) end

---@param s string
---@param pattern string
---@return string match
---@return any[] ...
function strmatch(s, pattern) end

---@param s string
---@param n number
---@return string repeated
function strrep(s, n) end

---@param s string
---@return string s
function strrev(s) end

---@param s string
---@param firstChar number
---@param lastChar? number
---@return string s
function strsub(s, firstChar, lastChar) end

---@param str string
---@return string lowerCase
function strupper(str) end

---@param timeDesc? table
---@return number t
function time(timeDesc) end

---@param table table
---@param position? number
---@param value string
function tinsert(table, position, value) end

---@param x string
---@param base? number
---@return number numValue
function tonumber(x, base) end

---@param value string
---@return string stringValue
function tostring(value) end

---@param t table
---@param i? number
---@param j? number
---@return any ...
function unpack(t, i, j) end

---@param f function
---@param err function
---@return boolean status
---@return any[] ...
function xpcall(f, err) end

---@param condition any
---@param message string
---@return any value
function assert(condition, message) end

---@param x number
---@param y number
---@return number remainder
function mod(x, y) end

---@param table table
---@param position number
function tremove(table, position) end

---@param v any
---@return string typeString
function type(v) end


-- ==================== Mac Client ====================
-- Source: APIDocumentation/Documentation/MacClientDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/MacClientDocumentation.lua :: IsMacClient()

function MovieRecording_Cancel() end

---@param width number
---@param framerate number
---@param sound number
---@return string dataRate
function MovieRecording_DataRate(width, framerate, sound) end

---@param filename string
function MovieRecording_DeleteMovie(filename) end

---@return number ratio
function MovieRecording_GetAspectRatio() end

---@return string path
function MovieRecording_GetMovieFullPath() end

---@return boolean recovering
---@return number progress
function MovieRecording_GetProgress() end

---@return string time
function MovieRecording_GetTime() end

---@return number width
function MovieRecording_GetViewportWidth() end

---@param codecID number
---@return boolean isSupported
function MovieRecording_IsCodecSupported(codecID) end

---@return boolean isCompressing
function MovieRecording_IsCompressing() end

---@return boolean isSupported
function MovieRecording_IsCursorRecordingSupported() end

---@return boolean isRecording
function MovieRecording_IsRecording() end

---@return boolean isSupported
function MovieRecording_IsSupported() end

---@param width number
---@param framerate number
---@param sound number
---@return string time
function MovieRecording_MaxLength(width, framerate, sound) end

---@param filename string
function MovieRecording_QueueMovieToCompress(filename) end

---@param enable boolean
function MovieRecording_SearchUncompressedMovie(enable) end

function MovieRecording_Toggle() end

function MovieRecording_ToggleGUI() end

function MusicPlayer_BackTrack() end

function MusicPlayer_NextTrack() end

function MusicPlayer_PlayPause() end

function MusicPlayer_VolumeDown() end

function MusicPlayer_VolumeUp() end


-- ==================== Macro ====================
-- Source: APIDocumentation/Documentation/MacroDocumentation.lua

---@param name string
---@param icon number
---@param body string
---@param perCharacter boolean
---@return integer index
function CreateMacro(name, icon, body, perCharacter) end

-- Additional source entry: APIDocumentation/Documentation/MacroDocumentation.lua :: CursorHasMacro()

---@param index? integer
---@param name? string
function DeleteMacro(index, name) end

---@param index integer
---@param name string
---@param iconTexture string
---@param body string
---@return integer newIndex
function EditMacro(index, name, iconTexture, body) end

---@param index? integer
---@param name? string
---@return string body
function GetMacroBody(index, name) end

---@param index integer
---@return string texture
function GetMacroIconInfo(index) end

---@param name string
---@return integer index
function GetMacroIndexByName(name) end

---@param index? integer
---@param name? string
---@return string name
---@return string texture
---@return string body
function GetMacroInfo(index, name) end

-- Additional source entry: APIDocumentation/Documentation/MacroDocumentation.lua :: GetMacroItem(index: luaIndex?, name: string?)

---@param index integer
---@return string texture
function GetMacroItemIconInfo(index) end

---@param index? integer
---@param name? string
---@return string name
---@return string rank
function GetMacroSpell(index, name) end

---@return number numMacroIcons
function GetNumMacroIcons() end

---@return number numIcons
function GetNumMacroItemIcons() end

---@return number numAccountMacros
---@return number numCharacterMacros
function GetNumMacros() end

---@return integer index
function GetRunningMacro() end

---@return string button
function GetRunningMacroButton() end

-- Additional source entry: APIDocumentation/Documentation/MacroDocumentation.lua :: PickupMacro(index: luaIndex?, name: string?)

---@param index? integer
---@param name? string
---@param button? string
function RunMacro(index, name, button) end

---@param text string
---@param button string
function RunMacroText(text, button) end

---@param cmd string
---@return string action
---@return string target
function SecureCmdOptionParse(cmd) end

---@param index? integer
---@param name? string
---@param item? string
---@param target? string
function SetMacroItem(index, name, item, target) end

---@param index? integer
---@param name? string
---@param spell? string
---@param target? string
function SetMacroSpell(index, name, spell, target) end

function StopMacro() end


-- ==================== Mail ====================
-- Source: APIDocumentation/Documentation/MailDocumentation.lua

---@param mailID number
function AutoLootMailItem(mailID) end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: CanComplainInboxItem(mailID: number)

function CheckInbox() end

function ClearSendMail() end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: ClickSendMailItemButton(index: luaIndex, autoReturn: bool)

function CloseMail() end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: ComplainInboxItem(mailID: number)

---@param mailID number
function DeleteInboxItem(mailID) end

---@param mailID number
---@return string packageIcon
---@return string stationeryIcon
---@return string sender
---@return string subject
---@return number money
---@return number CODAmount
---@return number daysLeft
---@return number itemCount
---@return boolean wasRead
---@return boolean wasReturned
---@return boolean textCreated
---@return boolean canReply
---@return boolean isGM
---@return number itemQuantity
function GetInboxHeaderInfo(mailID) end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: GetInboxInvoiceInfo(index: luaIndex)

---@param mailID number
---@param attachmentIndex integer
---@return string name
---@return string itemTexture
---@return number count
---@return integer quality
---@return boolean canUse
function GetInboxItem(mailID, attachmentIndex) end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: GetInboxItemLink(mailID: number, attachmentIndex: luaIndex)

---@return number numItems
---@return number totalItems
function GetInboxNumItems() end

---@param mailID number
---@return string bodyText
---@return string texture
---@return boolean isTakeable
---@return boolean isInvoice
function GetInboxText(mailID) end

---@return string sender1
---@return string sender2
---@return string sender3
function GetLatestThreeSenders() end

function GetNumPackages() end

---@return number numStationeries
function GetNumStationeries() end

function GetPackageInfo() end

---@return integer index
function GetSelectedStationeryTexture() end

---@return number amount
function GetSendMailCOD() end

---@param slot number
---@return string itemName
---@return string itemTexture
---@return string stackCount
---@return integer quality
function GetSendMailItem(slot) end

-- Additional source entry: APIDocumentation/Documentation/MailDocumentation.lua :: GetSendMailItemLink(slot: number)

---@return number amount
function GetSendMailMoney() end

---@return number price
function GetSendMailPrice() end

---@param index integer
---@return string name
---@return string texture
---@return number cost
function GetStationeryInfo(index) end

---@return boolean hasMail
function HasNewMail() end

---@param mailID number
---@return boolean canDelete
function InboxItemCanDelete(mailID) end

---@param mailID number
function ReturnInboxItem(mailID) end

function SelectPackage() end

---@param index integer
function SelectStationery(index) end

---@param recipient string
---@param subject string
---@param body string
function SendMail(recipient, subject, body) end

---@param amount number
function SetSendMailCOD(amount) end

---@param amount number
---@return boolean success
function SetSendMailMoney(amount) end

---@param enable boolean
function SetSendMailShowing(enable) end

---@param mailID number
---@param attachmentIndex integer
function TakeInboxItem(mailID, attachmentIndex) end

---@param mailID number
function TakeInboxMoney(mailID) end

---@param mailID number
function TakeInboxTextItem(mailID) end


-- ==================== Map ====================
-- Source: APIDocumentation/Documentation/MapDocumentation.lua

---@param mapLinkID number
function ClickLandmark(mapLinkID) end

---@return number corpseX
---@return number corpseY
function GetCorpseMapPosition() end

---@return number areaID
function GetCurrentMapAreaID() end

---@return number continent
function GetCurrentMapContinent() end

---@return number level
function GetCurrentMapDungeonLevel() end

---@return number zone
function GetCurrentMapZone() end

---@return number graveyardX
---@return number graveyardY
function GetDeathReleasePosition() end

---@return any[] ...
function GetMapContinents() end

---@return string mapFileName
---@return number textureHeight
---@return string textureWidth
function GetMapInfo() end

---@param index integer
---@return string name
---@return string description
---@return integer textureIndex
---@return number x
---@return number y
---@return number mapLinkID
---@return boolean showInBattleMap
function GetMapLandmarkInfo(index) end

---@param index integer
---@return string textureName
---@return number textureWidth
---@return number textureHeight
---@return number offsetX
---@return number offsetY
---@return number mapPointX
---@return number mapPointY
function GetMapOverlayInfo(index) end

---@param continentIndex integer
---@return any[] ...
function GetMapZones(continentIndex) end

-- Additional source entry: APIDocumentation/Documentation/MapDocumentation.lua :: GetNumBattlefieldVehicles()

---@return number numLevels
function GetNumDungeonMapLevels() end

---@return number numLandmarks
function GetNumMapLandmarks() end

---@return number numOverlays
function GetNumMapOverlays() end

---@return number facing
function GetPlayerFacing() end

---@param unit UnitToken
---@return UnitToken unitX
---@return UnitToken unitY
function GetPlayerMapPosition(unit) end

function InitWorldMapPing() end

---@param clickX number
---@param clickY number
function ProcessMapClick(clickX, clickY) end

---@param level number
function SetDungeonMapLevel(level) end

function SetMapToCurrentZone() end

---@param continentIndex integer
---@param zoneIndex? integer
function SetMapZoom(continentIndex, zoneIndex) end

---@param cursorX number
---@param cursorY number
---@return string name
---@return string fileName
---@return number texCoordX
---@return number texCoordY
---@return number textureX
---@return number textureY
---@return number scrollChildX
---@return number scrollChildY
function UpdateMapHighlight(cursorX, cursorY) end

---@param distance number
function ZoomOut(distance) end


-- ==================== Merchant ====================
-- Source: APIDocumentation/Documentation/MerchantDocumentation.lua

---@param index integer
---@param quantity number
function BuyMerchantItem(index, quantity) end

---@param index integer
function BuybackItem(index) end

---@return boolean canRepair
function CanMerchantRepair() end

function CloseMerchant() end

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: ContainerRefundItemPurchase(container: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: EndBoundTradeable(id: number)

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: EndRefund(id: number)

---@param index integer
---@return string name
---@return string texture
---@return number price
---@return number quantity
---@return number numAvailable
---@return boolean isUsable
function GetBuybackItemInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: GetBuybackItemLink(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: GetContainerItemPurchaseInfo(container: number, slot: number, IsEquipped: bool)

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: GetContainerItemPurchaseItem(container: number, slot: number, index: luaIndex)

---@param index integer
---@return number currencyCount
function GetMerchantItemCostInfo(index) end

---@param index integer
---@param currency number
---@return string texture
---@return number value
---@return string link
---@return string name
function GetMerchantItemCostItem(index, currency) end

---@param index integer
---@return string name
---@return string texture
---@return number price
---@return number quantity
---@return number numAvailable
---@return boolean isUsable
---@return boolean extendedCost
function GetMerchantItemInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: GetMerchantItemLink(index: luaIndex)

---@param index integer
---@return number maxStack
function GetMerchantItemMaxStack(index) end

---@return number numMerchantItems
function GetMerchantNumItems() end

---@return number numBuybackItems
function GetNumBuybackItems() end

---@return number repairAllCost
---@return boolean canRepair
function GetRepairAllCost() end

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: InRepairMode()

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: PickupMerchantItem(index: luaIndex)

---@param useGuildMoney? boolean
function RepairAllItems(useGuildMoney) end

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: ShowContainerSellCursor(container: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/MerchantDocumentation.lua :: ShowRepairCursor()


-- ==================== MessageFrame ====================
-- Source: APIDocumentation/Documentation/MessageFrameAPIDocumentation.lua

---@param text string
---@param red number
---@param green number
---@param blue number
---@param alpha number
function WoWMessageFrame:AddMessage(text, red, green, blue, alpha) end

---@return 1|nil enabled
function WoWMessageFrame:CanChangeAttribute() end

function WoWMessageFrame:Clear() end

---@return number duration
function WoWMessageFrame:GetFadeDuration() end

---@return 1|nil fading
function WoWMessageFrame:GetFading() end

---@return 1|nil indent
function WoWMessageFrame:GetIndentedWordWrap() end

---@return any position
function WoWMessageFrame:GetInsertMode() end

---@return number time
function WoWMessageFrame:GetTimeVisible() end

---@param duration number
function WoWMessageFrame:SetFadeDuration(duration) end

---@param fading boolean
function WoWMessageFrame:SetFading(fading) end

---@param indent boolean
function WoWMessageFrame:SetIndentedWordWrap(indent) end

--- Source signature: SetInsertMode(position: value)
---@param position any
function WoWMessageFrame:SetInsertMode(position) end

---@param time number
function WoWMessageFrame:SetTimeVisible(time) end


-- ==================== Minigame ====================
-- Source: APIDocumentation/Documentation/MinigameDocumentation.lua

function GetMinigameState() end

function GetMinigameType() end

function MakeMinigameMove() end


-- ==================== Minimap ====================
-- Source: APIDocumentation/Documentation/MinimapAPIDocumentation.lua

---@return number x
---@return number y
function WoWMinimap:GetPingPosition() end

---@return number zoomLevel
function WoWMinimap:GetZoom() end

---@return number zoomLevels
function WoWMinimap:GetZoomLevels() end

---@param x number
---@param y number
function WoWMinimap:PingLocation(x, y) end

---@param filename string
function WoWMinimap:SetBlipTexture(filename) end

---@param filename string
function WoWMinimap:SetClassBlipTexture(filename) end

---@param filename string
function WoWMinimap:SetCorpsePOIArrowTexture(filename) end

---@param filename string
function WoWMinimap:SetIconTexture(filename) end

---@param filename string
function WoWMinimap:SetMaskTexture(filename) end

---@param filename string
function WoWMinimap:SetPOIArrowTexture(filename) end

---@param filename string
function WoWMinimap:SetPlayerTexture(filename) end

---@param height number
function WoWMinimap:SetPlayerTextureHeight(height) end

---@param width number
function WoWMinimap:SetPlayerTextureWidth(width) end

---@param filename string
function WoWMinimap:SetStaticPOIArrowTexture(filename) end

---@param zoomLevel number
function WoWMinimap:SetZoom(zoomLevel) end

---@return 1|nil enabled
function WoWMinimap:CanChangeAttribute() end

function WoWMinimap:GetDontSavePosition() end

function WoWMinimap:GetPropagateKeyboardInput() end

function WoWMinimap:SetDontSavePosition() end

function WoWMinimap:SetPropagateKeyboardInput() end


-- ==================== Model ====================
-- Source: APIDocumentation/Documentation/ModelAPIDocumentation.lua

function WoWModel:AdvanceTime() end

function WoWModel:ClearFog() end

function WoWModel:ClearModel() end

---@return number facing
function WoWModel:GetFacing() end

---@return number red
---@return number green
---@return number blue
function WoWModel:GetFogColor() end

---@return number distance
function WoWModel:GetFogFar() end

---@return number distance
function WoWModel:GetFogNear() end

---@return 1|nil enabled
---@return number omni
---@return number dirX
---@return number dirY
---@return any dirZ
---@return number ambIntensity
---@return number ambR
---@return number ambG
---@return number ambB
---@return number dirIntensity
---@return number dirR
---@return number dirG
---@return number dirB
function WoWModel:GetLight() end

---@return string filename
function WoWModel:GetModel() end

---@return number scale
function WoWModel:GetModelScale() end

---@return number x
---@return number y
---@return number z
function WoWModel:GetPosition() end

---@param filename string
function WoWModel:ReplaceIconTexture(filename) end

---@param index number
function WoWModel:SetCamera(index) end

---@param facing number
function WoWModel:SetFacing(facing) end

---@param red number
---@param green number
---@param blue number
function WoWModel:SetFogColor(red, green, blue) end

---@param distance number
function WoWModel:SetFogFar(distance) end

---@param distance number
function WoWModel:SetFogNear(distance) end

---@param amount number
function WoWModel:SetGlow(amount) end

--- Source signature: SetLight(enabled: 1nil, omni: number, dirX: number, dirY: number, dirZ: negative values place the light below the model, positive values above (number, ambIntensity: number, ambR: number, ambG: number, ambB: number, dirIntensity: number, dirR: number, dirG: number, dirB: number)
---@param enabled 1|nil
---@param omni number
---@param dirX number
---@param dirY number
---@param dirZ any
---@param ambIntensity number
---@param ambR number
---@param ambG number
---@param ambB number
---@param dirIntensity number
---@param dirR number
---@param dirG number
---@param dirB number
function WoWModel:SetLight(enabled, omni, dirX, dirY, dirZ, ambIntensity, ambR, ambG, ambB, dirIntensity, dirR, dirG, dirB) end

---@param filename string
function WoWModel:SetModel(filename) end

---@param scale number
function WoWModel:SetModelScale(scale) end

---@param x number
---@param y number
---@param z number
function WoWModel:SetPosition(x, y, z) end

---@param sequence number
function WoWModel:SetSequence(sequence) end

---@param sequence number
---@param time number
function WoWModel:SetSequenceTime(sequence, time) end

---@return 1|nil enabled
function WoWModel:CanChangeAttribute() end

function WoWModel:GetDontSavePosition() end

function WoWModel:GetPropagateKeyboardInput() end

function WoWModel:SetDontSavePosition() end

function WoWModel:SetPropagateKeyboardInput() end


-- ==================== Modified Click ====================
-- Source: APIDocumentation/Documentation/ModifiedClickDocumentation.lua

---@param name string
---@return string binding
function GetModifiedClick(name) end

---@param index integer
---@return string action
function GetModifiedClickAction(index) end

---@return number num
function GetNumModifiedClickActions() end

---@param type string
---@return boolean modifiedClick
function IsModifiedClick(type) end

---@param action string
---@param binding string
function SetModifiedClick(action, binding) end


-- ==================== Money ====================
-- Source: APIDocumentation/Documentation/MoneyDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: AddTradeMoney()

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: CanWithdrawGuildBankMoney()

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: CursorHasMoney()

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: DepositGuildBankMoney(money: number)

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: DropCursorMoney()

---@param amount number
---@return string icon
function GetCoinIcon(amount) end

---@param amount number
---@param separator string
---@return string coinText
function GetCoinText(amount, separator) end

---@param amount number
---@param fontSize? number
---@return string coinText
function GetCoinTextureString(amount, fontSize) end

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: GetCursorMoney()

---@return number money
function GetMoney() end

---@return number amount
function GetPlayerTradeMoney() end

---@return number money
function GetQuestLogRequiredMoney() end

---@return number money
function GetQuestLogRewardMoney() end

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: GetSendMailMoney()

---@return number amount
function GetTargetTradeMoney() end

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: PickupGuildBankMoney(amount: number)

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: PickupPlayerMoney(amount: number)

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: PickupTradeMoney(amount: number)

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: SetSendMailMoney(amount: number)

---@param amount number
function SetTradeMoney(amount) end

-- Additional source entry: APIDocumentation/Documentation/MoneyDocumentation.lua :: WithdrawGuildBankMoney()


-- ==================== Movement ====================
-- Source: APIDocumentation/Documentation/MovementDocumentation.lua

function AscendStop() end

function DescendStop() end

---@param unit? UnitToken
---@param name? string
---@param strict? boolean
function FollowUnit(unit, name, strict) end

---@param unit UnitToken
function InteractUnit(unit) end

function JumpOrAscendStart() end

function MoveAndSteerStart() end

function MoveAndSteerStop() end

function MoveBackwardStart() end

function MoveBackwardStop() end

function MoveForwardStart() end

function MoveForwardStop() end

function PitchDownStart() end

function PitchDownStop() end

function PitchUpStart() end

function PitchUpStop() end

function SitStandOrDescendStart() end

function StrafeLeftStart() end

function StrafeLeftStop() end

function StrafeRightStart() end

function StrafeRightStop() end

function ToggleAutoRun() end

function ToggleRun() end

function TurnLeftStart() end

function TurnLeftStop() end

function TurnOrActionStart() end

function TurnOrActionStop() end

function TurnRightStart() end

function TurnRightStop() end


-- ==================== MovieFrame ====================
-- Source: APIDocumentation/Documentation/MovieFrameAPIDocumentation.lua

---@param enable boolean
function WoWMovieFrame:EnableSubtitles(enable) end

---@param filename string
---@param volume number
---@return 1|nil enabled
function WoWMovieFrame:StartMovie(filename, volume) end

function WoWMovieFrame:StopMovie() end

---@return 1|nil enabled
function WoWMovieFrame:CanChangeAttribute() end

function WoWMovieFrame:GetDontSavePosition() end

function WoWMovieFrame:GetPropagateKeyboardInput() end

function WoWMovieFrame:SetDontSavePosition() end

function WoWMovieFrame:SetPropagateKeyboardInput() end


-- ==================== MultiCast Actions ====================
-- Source: APIDocumentation/Documentation/MultiCastActionsDocumentation.lua

---@param action number
---@param spell number
function SetMultiCastSpell(action, spell) end


-- ==================== NPC Gossip Dialog ====================
-- Source: APIDocumentation/Documentation/NpcGossipDialogDocumentation.lua

function CloseGossip() end

---@return string name
---@return number level
---@return boolean isTrivial
---@return any[] ...
function GetGossipActiveQuests() end

---@return string name
---@return number level
---@return boolean isTrivial
---@return boolean isDaily
---@return boolean isRepeatable
---@return any[] ...
function GetGossipAvailableQuests() end

---@return string text
---@return string gossipType
---@return any[] ...
function GetGossipOptions() end

---@return string text
function GetGossipText() end

---@return number num
function GetNumGossipActiveQuests() end

---@return number num
function GetNumGossipAvailableQuests() end

---@return number numOptions
function GetNumGossipOptions() end

---@param index integer
function SelectGossipActiveQuest(index) end

---@param index integer
function SelectGossipAvailableQuest(index) end

---@param index integer
---@param text string
---@param confirm? boolean
function SelectGossipOption(index, text, confirm) end


-- ==================== Objectives Tracking ====================
-- Source: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua

---@param questIndex integer
function AddQuestWatch(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua :: AddTrackedAchievement(id: number)

---@return number numWatches
function GetNumQuestWatches() end

-- Additional source entry: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua :: GetNumTrackedAchievements()

---@param index integer
---@return integer questIndex
function GetQuestIndexForWatch(index) end

---@param questIndex integer
---@return number start
---@return number duration
---@return number enable
function GetQuestLogSpecialItemCooldown(questIndex) end

---@param questIndex integer
---@return string link
---@return string icon
---@return number charges
function GetQuestLogSpecialItemInfo(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua :: GetTrackedAchievements()

---@param questIndex integer
---@return number inRange
function IsQuestLogSpecialItemInRange(questIndex) end

---@param questIndex integer
---@return boolean isWatched
function IsQuestWatched(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua :: IsTrackedAchievement(id: number)

---@param questIndex integer
function RemoveQuestWatch(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/ObjectivesTrackingDocumentation.lua :: RemoveTrackedAchievement(id: number)

---@param questIndex integer
function UseQuestLogSpecialItem(questIndex) end


-- ==================== Party ====================
-- Source: APIDocumentation/Documentation/PartyDocumentation.lua

function AcceptGroup() end

---@param assignment? string
---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function ClearPartyAssignment(assignment, unit, name, exactMatch) end

---@param ready boolean
function ConfirmReadyCheck(ready) end

function ConvertToRaid() end

function DeclineGroup() end

function DoReadyCheck() end

---@return number numPartyMembers
function GetNumPartyMembers() end

---@param assignment? string
---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
---@return boolean isAssigned
function GetPartyAssignment(assignment, unit, name, exactMatch) end

---@return integer index
function GetPartyLeaderIndex() end

---@param index integer
---@return boolean hasMember
function GetPartyMember(index) end

---@param unit UnitToken
---@return string status
function GetReadyCheckStatus(unit) end

---@return number timeLeft
function GetReadyCheckTimeLeft() end

-- Additional source entry: APIDocumentation/Documentation/PartyDocumentation.lua :: GetRealNumPartyMembers()

---@param name string
function InviteUnit(name) end

---@param unit UnitToken
---@return boolean isLeader
function IsPartyLeader(unit) end

-- Additional source entry: APIDocumentation/Documentation/PartyDocumentation.lua :: IsRealPartyLeader()

function LeaveParty() end

---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function PromoteToLeader(unit, name, exactMatch) end

---@param assignment? string
---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function SetPartyAssignment(assignment, unit, name, exactMatch) end

---@param name string
function UninviteUnit(name) end

---@param unit UnitToken
---@return boolean inParty
function UnitInParty(unit) end

---@param unit? UnitToken
---@param name? string
---@return boolean leader
function UnitIsPartyLeader(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return boolean inParty
function UnitPlayerOrPetInParty(unit, name) end


-- ==================== Path ====================
-- Source: APIDocumentation/Documentation/PathAPIDocumentation.lua

---@param name string
---@param template string
---@param order number
function WoWPath:CreateControlPoint(name, template, order) end

---@return WoWControlPoint ...
function WoWPath:GetControlPoints() end

---@return any curveType
function WoWPath:GetCurve() end

---@return number max
function WoWPath:GetMaxOrder() end

--- Source signature: SetCurve(curveType: value)
---@param curveType any
function WoWPath:SetCurve(curveType) end


-- ==================== Pet ====================
-- Source: APIDocumentation/Documentation/PetDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: CastPetAction(index: luaIndex, unit: UnitToken?)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: DestroyTotem(slot: number)

---@param spell string
function DisableSpellAutocast(spell) end

---@param spell string
function EnableSpellAutocast(spell) end

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetPetActionCooldown(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetPetActionInfo(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetPetActionSlotUsable(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetPetActionsUsable()

---@return number currXP
---@return number nextXP
function GetPetExperience() end

---@return any[] ...
function GetPetFoodTypes() end

---@return string texture
function GetPetIcon() end

---@return string talent
function GetPetTalentTree() end

---@return number petTimeRemaining
function GetPetTimeRemaining() end

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetTotemInfo(slot: number)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: GetTotemTimeLeft(slot: number)

---@return boolean hasPetSpells
---@return string petType
function HasPetSpells() end

---@return boolean hasPetUI
---@return boolean isHunterPet
function HasPetUI() end

---@return boolean isActive
function IsPetAttackActive() end

function PetAbandon() end

function PetAggressiveMode() end

function PetAttack() end

---@return boolean canAbandon
function PetCanBeAbandoned() end

---@return boolean canDismiss
function PetCanBeDismissed() end

---@return boolean canRename
function PetCanBeRenamed() end

function PetDefensiveMode() end

function PetDismiss() end

function PetFollow() end

---@return boolean hasActionBar
function PetHasActionBar() end

function PetPassiveMode() end

---@param name string
---@param genitive string
---@param dative string
---@param accusative string
---@param instrumental string
---@param prepositional? string
function PetRename(name, genitive, dative, accusative, instrumental, prepositional) end

function PetStopAttack() end

function PetWait() end

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: PickupPetAction(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: TargetTotem(slot: number)

-- Additional source entry: APIDocumentation/Documentation/PetDocumentation.lua :: TogglePetAutocast(index: luaIndex)

function GetPetHappiness() end


-- ==================== Pet Stable ====================
-- Source: APIDocumentation/Documentation/PetStableDocumentation.lua

function BuyStableSlot() end

---@param index integer
---@return boolean selected
function ClickStablePet(index) end

function ClosePetStables() end

---@return number numPets
function GetNumStablePets() end

---@return number selectedPet
function GetSelectedStablePet() end

---@param index integer
---@return any[] ...
function GetStablePetFoodTypes(index) end

---@param index integer
---@return string icon
---@return string name
---@return number level
---@return string family
---@return string talent
function GetStablePetInfo(index) end

---@return boolean isAtNPC
function IsAtStableMaster() end

-- Additional source entry: APIDocumentation/Documentation/PetStableDocumentation.lua :: PickupStablePet(index: luaIndex)

---@param model table
function SetPetStablePaperdoll(model) end

function StablePet() end

function GetNextStableSlotCost() end

function GetNumStableSlots() end

function UnstablePet() end


-- ==================== Petition ====================
-- Source: APIDocumentation/Documentation/PetitionDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/PetitionDocumentation.lua :: BuyGuildCharter(guildName: string)

---@return boolean canSign
function CanSignPetition() end

function ClickPetitionButton() end

function ClosePetition() end

-- Additional source entry: APIDocumentation/Documentation/PetitionDocumentation.lua :: GetGuildCharterCost()

function GetNumPetitionItems() end

---@return number numNames
function GetNumPetitionNames() end

---@return string petitionType
---@return string title
---@return string bodyText
---@return number maxSignatures
---@return string originatorName
---@return boolean isOriginator
---@return number minSignatures
function GetPetitionInfo() end

---@param index integer
---@return string name
function GetPetitionNameInfo(index) end

function OfferPetition() end

---@param name string
function RenamePetition(name) end

function SignPetition() end

-- Additional source entry: APIDocumentation/Documentation/PetitionDocumentation.lua :: TurnInGuildCharter()

function TurnInPetition() end

function BuyPetition() end

function ClosePetitionVendor() end

function GetPetitionItemInfo() end

function HasFilledPetition() end

function TurnInArenaPetition() end


-- ==================== Player Information ====================
-- Source: APIDocumentation/Documentation/PlayerInformationDocumentation.lua

function AcceptResurrect() end

function AcceptXPLoss() end

---@return boolean status
function CanHearthAndResurrectFromArea() end

---@return boolean inRange
function CheckBinderDist() end

---@return boolean inRange
function CheckSpiritHealerDist() end

function ConfirmBinder() end

function DeclineResurrect() end

function Dismount() end

---@return string location
function GetBindLocation() end

---@param unit UnitToken
---@param target? string
---@return number comboPoints
function GetComboPoints(unit, target) end

---@return number timeLeft
function GetCorpseRecoveryDelay() end

---@return number currentTitle
function GetCurrentTitle() end

---@return number numTitles
function GetNumTitles() end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: GetPlayerFacing()

---@return string title
function GetQuestLogRewardTitle() end

---@return string realm
function GetRealmName() end

---@return number timeleft
function GetReleaseTimeRemaining() end

---@return string resSicknessTime
function GetResSicknessDuration() end

---@return number state
---@return string name
---@return number multiplier
function GetRestState() end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: GetRuneCooldown(slot: number)

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: GetRuneCount(slot: number)

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: GetRuneType(slot: number)

function GetTimeToWellRested() end

---@param titleIndex integer
---@return string titleName
function GetTitleName(titleIndex) end

---@param unit UnitToken
---@return number pitch
function GetUnitPitch(unit) end

---@param unit UnitToken
---@return number speed
function GetUnitSpeed(unit) end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: GetXPExhaustion()

---@return boolean hasControl
function HasFullControl() end

---@return boolean hasKey
function HasKey() end

---@return string text
function HasSoulstone() end

---@return boolean isEquipped
function HasWandEquipped() end

---@return boolean falling
function IsFalling() end

---@return boolean isFlyable
function IsFlyableArea() end

---@return boolean isFlying
function IsFlying() end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: IsInInstance()

---@return boolean inside
function IsIndoors() end

---@return boolean mounted
function IsMounted() end

---@return boolean outOfBounds
function IsOutOfBounds() end

---@return boolean isOutdoors
function IsOutdoors() end

---@return boolean resting
function IsResting() end

---@return boolean stealthed
function IsStealthed() end

---@return boolean isSwimming
function IsSwimming() end

---@param titleIndex integer
---@return boolean isKnown
function IsTitleKnown(titleIndex) end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: IsXPUserDisabled()

---@return boolean hasWeapon
function OffhandHasWeapon() end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: OpeningCinematic()

function RepopMe() end

---@return string name
function ResurrectGetOfferer() end

---@return boolean hasSickness
function ResurrectHasSickness() end

---@return boolean hasTimer
function ResurrectHasTimer() end

function RetrieveCorpse() end

---@param titleIndex integer
function SetCurrentTitle(titleIndex) end

---@param show boolean
function ShowCloak(show) end

---@param show boolean
function ShowHelm(show) end

---@return boolean isShown
function ShowingCloak() end

---@return boolean isShown
function ShowingHelm() end

function ToggleSheath() end

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: UnitXP(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/PlayerInformationDocumentation.lua :: UnitXPMax(unit: UnitToken)

function UseSoulstone() end


-- ==================== PlayerModel ====================
-- Source: APIDocumentation/Documentation/PlayerModelAPIDocumentation.lua

function WoWPlayerModel:RefreshCamera() end

function WoWPlayerModel:RefreshUnit() end

function WoWPlayerModel:SetBarberShopAlternateForm() end

function WoWPlayerModel:SetCamDistanceScale() end

---@param creature number
function WoWPlayerModel:SetCreature(creature) end

function WoWPlayerModel:SetCustomRace() end

function WoWPlayerModel:SetDisplayInfo() end

function WoWPlayerModel:SetPortraitZoom() end

---@param facing number
function WoWPlayerModel:SetRotation(facing) end

---@param unit string
function WoWPlayerModel:SetUnit(unit) end


-- ==================== PvP ====================
-- Source: APIDocumentation/Documentation/PvpDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/PvpDocumentation.lua :: CanHearthAndResurrectFromArea()

---@return boolean canQueue
function CanQueueForWintergrasp() end

-- Additional source entry: APIDocumentation/Documentation/PvpDocumentation.lua :: GetHolidayBGHonorCurrencyBonuses()

-- Additional source entry: APIDocumentation/Documentation/PvpDocumentation.lua :: GetHonorCurrency()

-- Additional source entry: APIDocumentation/Documentation/PvpDocumentation.lua :: GetNumWorldStateUI()

---@return number isPVPDesired
function GetPVPDesired() end

---@return number hk
---@return number highestRank
function GetPVPLifetimeStats() end

---@param index integer
---@param unit? UnitToken
---@return string rankName
---@return number rankNumber
function GetPVPRankInfo(index, unit) end

function GetPVPRankProgress() end

---@return number honorKills
---@return number honorPoints
function GetPVPSessionStats() end

---@return number timer
function GetPVPTimer() end

---@return number honorKills
---@return number honorPoints
function GetPVPYesterdayStats() end

---@param index integer
---@return string status
---@return string mapName
---@return number queueID
function GetWorldPVPQueueStatus(index) end

-- Additional source entry: APIDocumentation/Documentation/PvpDocumentation.lua :: GetWorldStateUIInfo(index: luaIndex)

---@return string pvpType
---@return boolean isSubZonePVP
---@return string factionName
function GetZonePVPInfo() end

function HearthAndResurrectFromArea() end

---@return boolean isRunning
function IsPVPTimerRunning() end

---@return boolean isPVPPOI
function IsSubZonePVPPOI() end

---@return boolean questFlag
function QuestFlagsPVP() end

---@param state boolean
function SetPVP(state) end

function TogglePVP() end

---@param unit UnitToken
---@return boolean isFreeForAll
function UnitIsPVPFreeForAll(unit) end

---@param unit UnitToken
---@return boolean state
function UnitIsPVPSanctuary(unit) end

---@param unit UnitToken
---@return string name
function UnitPVPName(unit) end

---@param unit UnitToken
---@return number rank
function UnitPVPRank(unit) end

function GetWintergraspWaitTime() end


-- ==================== Quest ====================
-- Source: APIDocumentation/Documentation/QuestDocumentation.lua

function AbandonQuest() end

function AcceptQuest() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: AddQuestWatch(questIndex: luaIndex)

function CloseQuest() end

---@param questIndex integer
function CollapseQuestHeader(questIndex) end

function CompleteQuest() end

function ConfirmAcceptQuest() end

function DeclineQuest() end

---@param questIndex integer
function ExpandQuestHeader(questIndex) end

---@return string items
function GetAbandonQuestItems() end

---@return string name
function GetAbandonQuestName() end

---@param index integer
---@return number level
function GetActiveLevel(index) end

---@param index integer
---@return string title
function GetActiveTitle(index) end

---@param index integer
---@return number level
function GetAvailableLevel(index) end

---@param index integer
---@return string title
function GetAvailableTitle(index) end

---@return number dailyQuestsComplete
function GetDailyQuestsCompleted() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetGossipActiveQuests()

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetGossipAvailableQuests()

---@return string greetingText
function GetGreetingText() end

---@return number max
function GetMaxDailyQuests() end

---@return number numActiveQuests
function GetNumActiveQuests() end

---@return number numAvailableQuests
function GetNumAvailableQuests() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetNumGossipActiveQuests()

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetNumGossipAvailableQuests()

---@return number numQuestChoices
function GetNumQuestChoices() end

---@return number numRequiredItems
function GetNumQuestItems() end

---@param questIndex? integer
---@return number numObjectives
function GetNumQuestLeaderBoards(questIndex) end

---@return number numChoices
function GetNumQuestLogChoices() end

---@return number numEntries
---@return number numQuests
function GetNumQuestLogEntries() end

---@return number numRewards
function GetNumQuestLogRewards() end

---@return number numQuestRewards
function GetNumQuestRewards() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetNumQuestWatches()

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetNumWorldStateUI()

---@return string questObjective
function GetObjectiveText() end

---@return string text
function GetProgressText() end

---@return string material
function GetQuestBackgroundMaterial() end

---@param level number
---@return table color
function GetQuestDifficultyColor(level) end

---@return number range
function GetQuestGreenRange() end

---@param index integer
---@return integer questIndex
function GetQuestIndexForTimer(index) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestIndexForWatch(index: luaIndex)

---@param type string
---@param index integer
---@return string name
---@return string texture
---@return number numItems
---@return integer quality
---@return boolean isUsable
function GetQuestItemInfo(type, index) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestItemLink(itemType: string, index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLink(questIndex: luaIndex)

---@param index integer
---@return string name
---@return string texture
---@return number numItems
---@return integer quality
---@return boolean isUsable
function GetQuestLogChoiceInfo(index) end

---@return string completionText
function GetQuestLogCompletionText() end

---@return number suggestedGroup
function GetQuestLogGroupNum() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogItemLink(itemType: string, index: luaIndex)

---@param objective number
---@param questIndex? integer
---@return string text
---@return string type
---@return boolean finished
function GetQuestLogLeaderBoard(objective, questIndex) end

---@return boolean shareable
function GetQuestLogPushable() end

---@return string questDescription
---@return string questObjectives
function GetQuestLogQuestText() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogRequiredMoney()

---@param index integer
---@return string name
---@return string texture
---@return number numItems
---@return integer quality
---@return boolean isUsable
function GetQuestLogRewardInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogRewardMoney()

---@return string texture
---@return string name
---@return boolean isTradeskillSpell
---@return boolean isSpellLearned
function GetQuestLogRewardSpell() end

---@return number talents
function GetQuestLogRewardTalents() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogRewardTitle()

---@return integer questIndex
function GetQuestLogSelection() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogSpecialItemCooldown(questIndex: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetQuestLogSpecialItemInfo(questIndex: luaIndex)

---@return string link
function GetQuestLogSpellLink() end

---@return number questTimer
function GetQuestLogTimeLeft() end

---@param questIndex integer
---@return string questLogTitleText
---@return number level
---@return string questTag
---@return number suggestedGroup
---@return boolean isHeader
---@return boolean isCollapsed
---@return number isComplete
---@return boolean isDaily
---@return number questID
function GetQuestLogTitle(questIndex) end

---@return number money
function GetQuestMoneyToGet() end

---@return number time
function GetQuestResetTime() end

---@param choice number
function GetQuestReward(choice) end

---@return string link
function GetQuestSpellLink() end

---@return string text
function GetQuestText() end

---@return any[] ...
function GetQuestTimers() end

---@param questTbl table
---@return table completedQuests
function GetQuestsCompleted(questTbl) end

---@return number honor
function GetRewardHonor() end

---@return number money
function GetRewardMoney() end

---@return string texture
---@return string name
---@return boolean isTradeskillSpell
---@return boolean isSpellLearned
function GetRewardSpell() end

---@return number talents
function GetRewardTalents() end

---@return string text
function GetRewardText() end

---@return string title
function GetRewardTitle() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetRewardXP()

---@return number suggestedGroup
function GetSuggestedGroupNum() end

---@return string text
function GetTitleText() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: GetWorldStateUIInfo(index: luaIndex)

---@param index integer
---@return boolean trivial
function IsActiveQuestTrivial(index) end

---@param index integer
---@return boolean trivial
function IsAvailableQuestTrivial(index) end

---@return boolean isFailed
function IsCurrentQuestFailed() end

---@return boolean isCompletable
function IsQuestCompletable() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: IsQuestLogSpecialItemInRange(questIndex: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: IsQuestWatched(questIndex: luaIndex)

---@param index integer
---@param unit UnitToken
---@return boolean state
function IsUnitOnQuest(index, unit) end

function QueryQuestsCompleted() end

function QuestChooseRewardError() end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: QuestFlagsPVP()

function QuestGetAutoAccept() end

---@param questIndex? integer
function QuestLogPushQuest(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: RemoveQuestWatch(questIndex: luaIndex)

---@param index integer
function SelectActiveQuest(index) end

---@param index integer
function SelectAvailableQuest(index) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: SelectGossipActiveQuest(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: SelectGossipAvailableQuest(index: luaIndex)

---@param questIndex integer
function SelectQuestLogEntry(questIndex) end

---@param questIndex integer
function SetAbandonQuest(questIndex) end

-- Additional source entry: APIDocumentation/Documentation/QuestDocumentation.lua :: UseQuestLogSpecialItem(questIndex: luaIndex)

function GetQuestLogRewardHonor() end


-- ==================== QuestPOIFrame ====================
-- Source: APIDocumentation/Documentation/QuestPOIFrameAPIDocumentation.lua

function WoWQuestPOIFrame:DrawBlob() end

function WoWQuestPOIFrame:DrawNone() end

function WoWQuestPOIFrame:EnableMerging() end

function WoWQuestPOIFrame:EnableSmoothing() end

function WoWQuestPOIFrame:GetNumTooltips() end

function WoWQuestPOIFrame:GetTooltipIndex() end

function WoWQuestPOIFrame:SetBorderAlpha() end

function WoWQuestPOIFrame:SetBorderScalar() end

function WoWQuestPOIFrame:SetBorderTexture() end

function WoWQuestPOIFrame:SetFillAlpha() end

function WoWQuestPOIFrame:SetFillTexture() end

function WoWQuestPOIFrame:SetMergeThreshold() end

function WoWQuestPOIFrame:SetNumSplinePoints() end

function WoWQuestPOIFrame:UpdateMouseOverTooltip() end

---@return 1|nil enabled
function WoWQuestPOIFrame:CanChangeAttribute() end

function WoWQuestPOIFrame:GetDontSavePosition() end

function WoWQuestPOIFrame:GetPropagateKeyboardInput() end

function WoWQuestPOIFrame:SetDontSavePosition() end

function WoWQuestPOIFrame:SetPropagateKeyboardInput() end


-- ==================== Raid ====================
-- Source: APIDocumentation/Documentation/RaidDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: AcceptGroup()

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: ClearPartyAssignment(assignment: string?, unit: UnitToken?, name: string?, exactMatch: bool?)

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: ConfirmReadyCheck(ready: bool)

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: ConvertToRaid()

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: DeclineGroup()

---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function DemoteAssistant(unit, name, exactMatch) end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: DoReadyCheck()

---@return number numRaidMembers
function GetNumRaidMembers() end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: GetPartyAssignment(assignment: string?, unit: UnitToken?, name: string?, exactMatch: bool?)

---@param index integer
---@return string name
---@return number rank
---@return number subgroup
---@return number level
---@return string class
---@return string fileName
---@return string zone
---@return boolean online
---@return boolean isDead
---@return string role
---@return boolean isML
function GetRaidRosterInfo(index) end

---@return integer raidIndex
function GetRaidRosterSelection() end

---@param unit? UnitToken
---@param name? string
---@return integer index
function GetRaidTargetIndex(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: GetReadyCheckStatus(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: GetReadyCheckTimeLeft()

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: GetRealNumRaidMembers()

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: InviteUnit(name: string)

---@return boolean isLeader
function IsRaidLeader() end

---@return boolean isRaidOfficer
function IsRaidOfficer() end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: IsRealRaidLeader()

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: LeaveParty()

---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function PromoteToAssistant(unit, name, exactMatch) end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: PromoteToLeader(unit: UnitToken?, name: string?, exactMatch: bool?)

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: SetPartyAssignment(assignment: string?, unit: UnitToken?, name: string?, exactMatch: bool?)

---@param index integer
function SetRaidRosterSelection(index) end

---@param index integer
---@param subgroup number
function SetRaidSubgroup(index, subgroup) end

---@param unit? UnitToken
---@param name? string
---@param index? integer
function SetRaidTarget(unit, name, index) end

---@param index1 integer
---@param index2 integer
function SwapRaidSubgroup(index1, index2) end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: UninviteUnit(name: string)

---@param unit UnitToken
---@return number inRaid
function UnitInRaid(unit) end

-- Additional source entry: APIDocumentation/Documentation/RaidDocumentation.lua :: UnitIsPartyLeader(unit: UnitToken?, name: string?)

---@param unit? UnitToken
---@param name? string
---@return boolean leader
function UnitIsRaidOfficer(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return boolean inParty
function UnitPlayerOrPetInRaid(unit, name) end

---@param unit UnitToken
---@return boolean targetVehicle
function UnitTargetsVehicleInRaidUI(unit) end


-- ==================== Recruit Friend ====================
-- Source: APIDocumentation/Documentation/RecruitAFriendDocumentation.lua

function AcceptLevelGrant() end

---@param unit UnitToken
---@return boolean canGrant
function CanGrantLevel(unit) end

---@param name? string
---@param unit? UnitToken
---@return boolean canSummon
function CanSummonFriend(name, unit) end

function DeclineLevelGrant() end

---@return number start
---@return number duration
function GetSummonFriendCooldown() end

---@param unit UnitToken
function GrantLevel(unit) end

---@param unit UnitToken
---@return boolean isLinked
function IsReferAFriendLinked(unit) end

---@param name? string
---@param unit? UnitToken
function SummonFriend(name, unit) end


-- ==================== Rotation ====================
-- Source: APIDocumentation/Documentation/RotationAPIDocumentation.lua

---@return number degrees
function WoWRotation:GetDegrees() end

---@return string point
---@return number xOffset
---@return number yOffset
function WoWRotation:GetOrigin() end

---@return number radians
function WoWRotation:GetRadians() end

---@param degrees number
function WoWRotation:SetDegrees(degrees) end

---@param point string
---@param xOffset number
---@param yOffset number
function WoWRotation:SetOrigin(point, xOffset, yOffset) end

---@param radians number
function WoWRotation:SetRadians(radians) end


-- ==================== Scale ====================
-- Source: APIDocumentation/Documentation/ScaleAPIDocumentation.lua

---@return string point
---@return number xOffset
---@return number yOffset
function WoWScale:GetOrigin() end

---@return number xFactor
---@return number yFactor
function WoWScale:GetScale() end

---@param point string
---@param xOffset number
---@param yOffset number
function WoWScale:SetOrigin(point, xOffset, yOffset) end

---@param xFactor number
---@param yFactor number
function WoWScale:SetScale(xFactor, yFactor) end


-- ==================== ScrollFrame ====================
-- Source: APIDocumentation/Documentation/ScrollFrameAPIDocumentation.lua

---@return number scroll
function WoWScrollFrame:GetHorizontalScroll() end

---@return number maxScroll
function WoWScrollFrame:GetHorizontalScrollRange() end

---@return WoWFrame scrollChild
function WoWScrollFrame:GetScrollChild() end

---@return number scroll
function WoWScrollFrame:GetVerticalScroll() end

---@return number maxScroll
function WoWScrollFrame:GetVerticalScrollRange() end

---@param scroll number
function WoWScrollFrame:SetHorizontalScroll(scroll) end

---@param frame WoWFrame
function WoWScrollFrame:SetScrollChild(frame) end

---@param scroll number
function WoWScrollFrame:SetVerticalScroll(scroll) end

function WoWScrollFrame:UpdateScrollChildRect() end

---@return 1|nil enabled
function WoWScrollFrame:CanChangeAttribute() end

function WoWScrollFrame:GetDontSavePosition() end

function WoWScrollFrame:GetPropagateKeyboardInput() end

function WoWScrollFrame:SetDontSavePosition() end

function WoWScrollFrame:SetPropagateKeyboardInput() end


-- ==================== ScrollingMessageFrame ====================
-- Source: APIDocumentation/Documentation/ScrollingMessageFrameAPIDocumentation.lua

---@param text string
---@param red number
---@param green number
---@param blue number
---@param id number
---@param addToTop boolean
function WoWScrollingMessageFrame:AddMessage(text, red, green, blue, id, addToTop) end

---@return 1|nil atBottom
function WoWScrollingMessageFrame:AtBottom() end

---@return 1|nil atTop
function WoWScrollingMessageFrame:AtTop() end

function WoWScrollingMessageFrame:Clear() end

---@return number lineNum
function WoWScrollingMessageFrame:GetCurrentLine() end

---@return number offset
function WoWScrollingMessageFrame:GetCurrentScroll() end

---@return number duration
function WoWScrollingMessageFrame:GetFadeDuration() end

---@return 1|nil fading
function WoWScrollingMessageFrame:GetFading() end

---@return 1|nil enabled
function WoWScrollingMessageFrame:GetHyperlinksEnabled() end

---@return 1|nil indent
function WoWScrollingMessageFrame:GetIndentedWordWrap() end

---@return any position
function WoWScrollingMessageFrame:GetInsertMode() end

---@param maxLines number
function WoWScrollingMessageFrame:GetMaxLines(maxLines) end

function WoWScrollingMessageFrame:GetMessageInfo() end

---@return number count
function WoWScrollingMessageFrame:GetNumLinesDisplayed() end

---@return number count
function WoWScrollingMessageFrame:GetNumMessages() end

---@return number time
function WoWScrollingMessageFrame:GetTimeVisible() end

function WoWScrollingMessageFrame:PageDown() end

function WoWScrollingMessageFrame:PageUp() end

function WoWScrollingMessageFrame:RemoveMessagesByAccessID() end

function WoWScrollingMessageFrame:ScrollDown() end

function WoWScrollingMessageFrame:ScrollToBottom() end

function WoWScrollingMessageFrame:ScrollToTop() end

function WoWScrollingMessageFrame:ScrollUp() end

---@param duration number
function WoWScrollingMessageFrame:SetFadeDuration(duration) end

---@param fading boolean
function WoWScrollingMessageFrame:SetFading(fading) end

---@param enable boolean
function WoWScrollingMessageFrame:SetHyperlinksEnabled(enable) end

---@param indent boolean
function WoWScrollingMessageFrame:SetIndentedWordWrap(indent) end

--- Source signature: SetInsertMode(position: value)
---@param position any
function WoWScrollingMessageFrame:SetInsertMode(position) end

---@param maxLines number
function WoWScrollingMessageFrame:SetMaxLines(maxLines) end

---@param offset number
function WoWScrollingMessageFrame:SetScrollOffset(offset) end

---@param time number
function WoWScrollingMessageFrame:SetTimeVisible(time) end

---@param id number
---@param red number
---@param green number
---@param blue number
function WoWScrollingMessageFrame:UpdateColorByID(id, red, green, blue) end

---@return 1|nil enabled
function WoWScrollingMessageFrame:CanChangeAttribute() end

function WoWScrollingMessageFrame:GetDontSavePosition() end

function WoWScrollingMessageFrame:GetPropagateKeyboardInput() end

function WoWScrollingMessageFrame:SetDontSavePosition() end

function WoWScrollingMessageFrame:SetPropagateKeyboardInput() end


-- ==================== Secure Execution Utility ====================
-- Source: APIDocumentation/Documentation/SecureExecutionUtilityDocumentation.lua

---@return boolean inLockdown
function InCombatLockdown() end

function forceinsecure() end

---@param table? table
---@param function_ string
---@param hookfunc function
function hooksecurefunc(table, function_, hookfunc) end

---@return boolean secure
function issecure() end

-- Additional source entry: APIDocumentation/Documentation/SecureExecutionUtilityDocumentation.lua :: issecurevariable(table: table?, variable: string)

-- Additional source entry: APIDocumentation/Documentation/SecureExecutionUtilityDocumentation.lua :: newproxy(boolean: bool?, userdata: userdata?)

---@param function_ function
---@param ... table
---@return any[] ...
function securecall(function_, ...) end


-- ==================== SimpleHTML ====================
-- Source: APIDocumentation/Documentation/SimpleHTMLAPIDocumentation.lua

---@return string format
function WoWSimpleHTML:GetHyperlinkFormat() end

---@return 1|nil enabled
function WoWSimpleHTML:GetHyperlinksEnabled() end

---@param element string
---@return 1|nil indent
function WoWSimpleHTML:GetIndentedWordWrap(element) end

---@param format string
function WoWSimpleHTML:SetHyperlinkFormat(format) end

---@param enable boolean
function WoWSimpleHTML:SetHyperlinksEnabled(enable) end

---@param element string
---@param indent boolean
function WoWSimpleHTML:SetIndentedWordWrap(element, indent) end

---@param text string
function WoWSimpleHTML:SetText(text) end

---@return 1|nil enabled
function WoWSimpleHTML:CanChangeAttribute() end

function WoWSimpleHTML:GetDontSavePosition() end

function WoWSimpleHTML:GetPropagateKeyboardInput() end

function WoWSimpleHTML:SetDontSavePosition() end

function WoWSimpleHTML:SetPropagateKeyboardInput() end


-- ==================== Skill ====================
-- Source: APIDocumentation/Documentation/SkillDocumentation.lua

---@param index integer
function AbandonSkill(index) end

---@param index integer
function ExpandSkillHeader(index) end

---@return number numSkills
function GetNumSkillLines() end

---@param index integer
---@return string skillName
---@return boolean header
---@return boolean isExpanded
---@return number skillRank
---@return number numTempPoints
---@return number skillModifier
---@return number skillMaxRank
---@return boolean isAbandonable
---@return number stepCost
---@return number rankCost
---@return number minLevel
---@return number skillCostType
---@return string skillDescription
function GetSkillLineInfo(index) end

function CollapseSkillHeader() end

function GetSelectedSkill() end

function SetSelectedSkill() end


-- ==================== Slider ====================
-- Source: APIDocumentation/Documentation/SliderAPIDocumentation.lua

function WoWSlider:Disable() end

function WoWSlider:Enable() end

---@return number minValue
---@return number maxValue
function WoWSlider:GetMinMaxValues() end

---@return any orientation
function WoWSlider:GetOrientation() end

---@return string|WoWTexture texture
function WoWSlider:GetThumbTexture() end

---@return number value
function WoWSlider:GetValue() end

---@return number step
function WoWSlider:GetValueStep() end

---@return 1|nil enabled
function WoWSlider:IsEnabled() end

---@param minValue number
---@param maxValue number
function WoWSlider:SetMinMaxValues(minValue, maxValue) end

--- Source signature: SetOrientation(orientation: default)
---@param orientation any
function WoWSlider:SetOrientation(orientation) end

---@param texture string|WoWTexture
---@param filename string
---@param layer string
function WoWSlider:SetThumbTexture(texture, filename, layer) end

---@param value number
function WoWSlider:SetValue(value) end

---@param step number
function WoWSlider:SetValueStep(step) end

---@return 1|nil enabled
function WoWSlider:CanChangeAttribute() end

function WoWSlider:GetDontSavePosition() end

function WoWSlider:GetPropagateKeyboardInput() end

function WoWSlider:SetDontSavePosition() end

function WoWSlider:SetPropagateKeyboardInput() end


-- ==================== Social ====================
-- Source: APIDocumentation/Documentation/SocialDocumentation.lua

---@param name string
function AddFriend(name) end

---@param name string
function AddIgnore(name) end

---@param fullname string
function AddOrDelIgnore(fullname) end

---@param name string
---@param note string
function AddOrRemoveFriend(name, note) end

---@param name string
function DelIgnore(name) end

---@param index number
---@return string name
---@return number level
---@return string class
---@return string area
---@return boolean|nil connected
---@return string status
---@return string note
---@return boolean|nil RAF
function GetFriendInfo(index) end

---@param index integer
---@return string name
function GetIgnoreName(index) end

---@return number numFriends
function GetNumFriends() end

---@return number numIgnores
function GetNumIgnores() end

---@return number numResults
---@return number totalCount
function GetNumWhoResults() end

---@return number index
function GetSelectedFriend() end

---@return integer index
function GetSelectedIgnore() end

---@param index integer
---@return string name
---@return string guild
---@return number level
---@return string race
---@return string class
---@return string zone
---@return string filename
function GetWhoInfo(index) end

---@param unit? UnitToken
---@param name? string
---@return boolean isIgnored
function IsIgnored(unit, name) end

---@param name string
function RemoveFriend(name) end

---@param filter string
function SendWho(filter) end

---@param index number
function SetSelectedFriend(index) end

---@param index integer
function SetSelectedIgnore(index) end

---@param state number
function SetWhoToUI(state) end

function ShowFriends() end

---@param sortType string
function SortWho(sortType) end

---@param index number
---@param name string
---@param note string
function SetFriendNotes(index, name, note) end


-- ==================== Socketing ====================
-- Source: APIDocumentation/Documentation/SocketingDocumentation.lua

function AcceptSockets() end

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: ClickSocketButton(index: luaIndex)

function CloseSocketInfo() end

---@param index integer
---@return string name
---@return string texture
---@return boolean name
function GetExistingSocketInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: GetExistingSocketLink(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: GetItemGem(itemID: number?, itemName: string?, itemLink: string?, index: luaIndex?)

---@param index integer
---@return string name
---@return string texture
---@return boolean matches
function GetNewSocketInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: GetNewSocketLink(index: luaIndex)

---@return number numSockets
function GetNumSockets() end

---@return boolean tradeable
function GetSocketItemBoundTradeable() end

---@return string name
---@return string icon
---@return integer quality
function GetSocketItemInfo() end

---@return boolean refundable
function GetSocketItemRefundable() end

---@param index integer
---@return string gemColor
function GetSocketTypes(index) end

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: SocketContainerItem(container: number, slot: number)

-- Additional source entry: APIDocumentation/Documentation/SocketingDocumentation.lua :: SocketInventoryItem(slot: number)


-- ==================== Sound ====================
-- Source: APIDocumentation/Documentation/SoundDocumentation.lua

---@param musicfile string
function PlayMusic(musicfile) end

---@param sound string
function PlaySound(sound) end

---@param soundFile string
function PlaySoundFile(soundFile) end

---@param index integer
function Sound_ChatSystem_GetInputDriverNameByIndex(index) end

function Sound_ChatSystem_GetNumInputDrivers() end

function Sound_ChatSystem_GetNumOutputDrivers() end

---@param index integer
function Sound_ChatSystem_GetOutputDriverNameByIndex(index) end

---@param index integer
function Sound_GameSystem_GetInputDriverNameByIndex(index) end

function Sound_GameSystem_GetNumInputDrivers() end

function Sound_GameSystem_GetNumOutputDrivers() end

---@param index integer
function Sound_GameSystem_GetOutputDriverNameByIndex(index) end

function Sound_GameSystem_RestartSoundSystem() end

function StopMusic() end

---@param deviceIndex integer
---@return string deviceName
function VoiceEnumerateCaptureDevices(deviceIndex) end

---@param deviceIndex integer
---@return string device
function VoiceEnumerateOutputDevices(deviceIndex) end

---@return integer index
function VoiceGetCurrentCaptureDevice() end

---@return integer index
function VoiceGetCurrentOutputDevice() end

---@param deviceName string
function VoiceSelectCaptureDevice(deviceName) end

---@param deviceName string
function VoiceSelectOutputDevice(deviceName) end


-- ==================== Spell ====================
-- Source: APIDocumentation/Documentation/SpellDocumentation.lua

---@param id number
---@param bookType string
function CastSpell(id, bookType) end

---@param spellID number
---@param target? string
function CastSpellByID(spellID, target) end

---@param name string
---@param target? string
function CastSpellByName(name, target) end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: CursorHasSpell()

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: DisableSpellAutocast(spell: string)

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: EnableSpellAutocast(spell: string)

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: GetItemSpell(itemID: number?, itemName: string?, itemLink: string?)

---@param slot number
---@return number maxRankSlot
function GetKnownSlotFromHighestRankSlot(slot) end

---@return number numTabs
function GetNumSpellTabs() end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: GetQuestLogRewardSpell()

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: GetRewardSpell()

---@param id number
---@param bookType string
---@return boolean autocastAllowed
---@return boolean autocastEnabled
function GetSpellAutocast(id, bookType) end

--- 
--- spell is a spell ID/name, or a spellbook index together with bookType.
---@param spell string|number
---@param bookType? string
---@return number start
---@return number duration
---@return number enable
function GetSpellCooldown(spell, bookType) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return number numCasts
function GetSpellCount(index, bookType, name) end

--- 
--- spell is a spell ID/name, or a spellbook index together with bookType.
---@param spell string|number
---@param bookType? string
---@return string|nil name
---@return string rank
---@return string icon
---@return number powerCost
---@return boolean isFunnel
---@return number powerType
---@return number castingTime
---@return number minRange
---@return number maxRange
function GetSpellInfo(spell, bookType) end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: GetSpellLink(index: luaIndex?, bookType: string?, name: string?, id: number?)

---@param id number
---@param bookType string
---@return string spellName
---@return string subSpellName
function GetSpellName(id, bookType) end

---@param index integer
---@return string name
---@return string texture
---@return number offset
---@return number numSpells
function GetSpellTabInfo(index) end

--- 
--- spell is a spell ID/name, or a spellbook index together with bookType.
---@param spell string|number
---@param bookType? string
---@return string texture
function GetSpellTexture(spell, bookType) end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: HasPetSpells()

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isAttack
function IsAttackSpell(index, bookType, name) end

---@param spellName string
---@return boolean isAutoRepeat
function IsAutoRepeatSpell(spellName) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isConsumable
function IsConsumableSpell(index, bookType, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isCurrent
function IsCurrentSpell(index, bookType, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isHarmful
function IsHarmfulSpell(index, bookType, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isHarmful
function IsHelpfulSpell(index, bookType, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isPassive
function IsPassiveSpell(index, bookType, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@param unit? UnitToken
---@return boolean inRange
function IsSpellInRange(index, bookType, name, unit) end

---@param spellID number
---@param isPet? boolean
---@return boolean isKnown
function IsSpellKnown(spellID, isPet) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean isUsable
---@return boolean notEnoughMana
function IsUsableSpell(index, bookType, name) end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: PickupSpell(id: number, bookType: string)

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: SetMultiCastSpell(action: number, spell: number)

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: SpellCanTargetGlyph()

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: SpellCanTargetItem()

---@param unit? UnitToken
---@param name? string
---@return boolean canTarget
function SpellCanTargetUnit(unit, name) end

---@param index? integer
---@param bookType? string
---@param name? string
---@return boolean hasRange
function SpellHasRange(index, bookType, name) end

---@return boolean isTargeting
function SpellIsTargeting() end

function SpellStopCasting() end

function SpellStopTargeting() end

-- Additional source entry: APIDocumentation/Documentation/SpellDocumentation.lua :: SpellTargetItem(itemID: number?, itemName: string?, itemLink: string?)

---@param unit? UnitToken
---@param name? string
function SpellTargetUnit(unit, name) end

---@param index? integer
---@param bookType? string
---@param name? string
function ToggleSpellAutocast(index, bookType, name) end

---@param unit UnitToken
---@return string name
---@return string subText
---@return string text
---@return string texture
---@return number startTime
---@return number endTime
---@return boolean isTradeSkill
---@return number castID
---@return boolean notInterruptible
function UnitCastingInfo(unit) end

---@param unit UnitToken
---@return string name
---@return string subText
---@return string text
---@return string texture
---@return number startTime
---@return number endTime
---@return boolean isTradeSkill
---@return boolean notInterruptible
function UnitChannelInfo(unit) end

function IsSelectedSpell() end

function UpdateSpells() end


-- ==================== StanceShapeshift ====================
-- Source: APIDocumentation/Documentation/StanceshapeshiftDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/StanceshapeshiftDocumentation.lua :: CancelShapeshiftForm()

---@param index integer
function CastShapeshiftForm(index) end

---@return number numForms
function GetNumShapeshiftForms() end

---@return integer index
function GetShapeshiftForm() end

---@param index integer
---@return number start
---@return number duration
---@return number enable
function GetShapeshiftFormCooldown(index) end

---@param index integer
---@return string texture
---@return string name
---@return boolean isActive
---@return boolean isCastable
function GetShapeshiftFormInfo(index) end


-- ==================== Stat Information ====================
-- Source: APIDocumentation/Documentation/StatInformationDocumentation.lua

---@return number amount
function GetArmorPenetration() end

---@param statIndex integer
---@param effectiveStat number
---@return number attackPower
function GetAttackPowerForStat(statIndex, effectiveStat) end

---@return number chance
function GetBlockChance() end

---@param ratingIndex integer
---@return number rating
function GetCombatRating(ratingIndex) end

---@param ratingIndex integer
---@return number ratingBonus
function GetCombatRatingBonus(ratingIndex) end

---@return number critChance
function GetCritChance() end

---@param unit? UnitToken
---@return number critChance
function GetCritChanceFromAgility(unit) end

---@return number bonusStat
function GetDamageBonusStat() end

---@return number chance
function GetDodgeChance() end

---@return number expertise
function GetExpertise() end

---@return number expertisePerc
---@return number offhandExpertisePercent
function GetExpertisePercent() end

---@return number base
---@return number casting
function GetManaRegen() end

---@param ratingIndex integer
---@return number max
function GetMaxCombatRatingBonus(ratingIndex) end

---@return number chance
function GetParryChance() end

---@return number inactiveRegen
---@return number activeRegen
function GetPowerRegen() end

---@return number critChance
function GetRangedCritChance() end

---@return number damage
function GetShieldBlock() end

---@param school number
---@return number minModifier
function GetSpellBonusDamage(school) end

---@return number bonusHealing
function GetSpellBonusHealing() end

---@param school number
---@return number minCrit
function GetSpellCritChance(school) end

---@param unit? UnitToken
---@return number critChance
function GetSpellCritChanceFromIntellect(unit) end

---@return number penetration
function GetSpellPenetration() end

---@param unit UnitToken
---@return number modifier
function GetUnitHealthModifier(unit) end

---@param unit UnitToken
---@return number regen
function GetUnitHealthRegenRateFromSpirit(unit) end

---@param unit UnitToken
---@return number regen
function GetUnitManaRegenRateFromSpirit(unit) end

---@param unit UnitToken
---@return number modifier
function GetUnitMaxHealthModifier(unit) end

---@param unit UnitToken
---@return number modifier
function GetUnitPowerModifier(unit) end

---@param unit UnitToken
---@return number base
---@return number effectiveArmor
---@return number armor
---@return number posBuff
---@return number negBuff
function UnitArmor(unit) end

---@param unit UnitToken
---@return number mainHandAttackBase
---@return number mainHandAttackMod
---@return number offHandHandAttackBase
---@return number offHandAttackMod
function UnitAttackBothHands(unit) end

---@param unit UnitToken
---@return number base
---@return number posBuff
---@return number negBuff
function UnitAttackPower(unit) end

---@param unit UnitToken
---@return number speed
---@return number offhandSpeed
function UnitAttackSpeed(unit) end

---@param unit UnitToken
---@return number minDamage
---@return number maxDamage
---@return number minOffHandDamage
---@return number maxOffHandDamage
---@return number physicalBonusPos
---@return number physicalBonusNeg
---@return number percent
function UnitDamage(unit) end

---@param unit UnitToken
---@return number base
---@return number modifier
function UnitDefense(unit) end

---@param unit UnitToken
---@return number rangedAttackBase
---@return number rangedAttackMod
function UnitRangedAttack(unit) end

---@param unit UnitToken
---@return number base
---@return number posBuff
---@return number negBuff
function UnitRangedAttackPower(unit) end

---@param unit UnitToken
---@return number rangedAttackSpeed
---@return number minDamage
---@return number maxDamage
---@return number physicalBonusPos
---@return number physicalBonusNeg
---@return number percent
function UnitRangedDamage(unit) end

---@param unit UnitToken
---@param resistanceIndex integer
---@return number base
---@return number resistance
---@return number positive
---@return number negative
function UnitResistance(unit, resistanceIndex) end

---@param unit UnitToken
---@param statIndex integer
---@return number stat
---@return number effectiveStat
---@return number posBuff
---@return number negBuff
function UnitStat(unit, statIndex) end


-- ==================== StatusBar ====================
-- Source: APIDocumentation/Documentation/StatusBarAPIDocumentation.lua

---@return number minValue
---@return number maxValue
function WoWStatusBar:GetMinMaxValues() end

---@return any orientation
function WoWStatusBar:GetOrientation() end

---@return 1|nil rotate
function WoWStatusBar:GetRotatesTexture() end

---@return number red
---@return number green
---@return number blue
---@return number alpha
function WoWStatusBar:GetStatusBarColor() end

---@return string|WoWTexture texture
function WoWStatusBar:GetStatusBarTexture() end

---@return number value
function WoWStatusBar:GetValue() end

---@param minValue number
---@param maxValue number
function WoWStatusBar:SetMinMaxValues(minValue, maxValue) end

--- Source signature: SetOrientation(orientation: value)
---@param orientation any
function WoWStatusBar:SetOrientation(orientation) end

---@param rotate 1|nil
function WoWStatusBar:SetRotatesTexture(rotate) end

---@param red number
---@param green number
---@param blue number
---@param alpha number
function WoWStatusBar:SetStatusBarColor(red, green, blue, alpha) end

---@param texture string|WoWTexture
---@param filename string
---@param layer string
function WoWStatusBar:SetStatusBarTexture(texture, filename, layer) end

---@param value number
function WoWStatusBar:SetValue(value) end

---@return 1|nil enabled
function WoWStatusBar:CanChangeAttribute() end


-- ==================== Summoning ====================
-- Source: APIDocumentation/Documentation/SummoningDocumentation.lua

function CancelSummon() end

function ConfirmSummon() end

---@return string area
function GetSummonConfirmAreaName() end

---@return string text
function GetSummonConfirmSummoner() end

---@return number timeleft
function GetSummonConfirmTimeLeft() end

---@return boolean amount
function PlayerCanTeleport() end


-- ==================== TabardModel ====================
-- Source: APIDocumentation/Documentation/TabardModelAPIDocumentation.lua

---@return 1|nil enabled
function WoWTabardModel:CanSaveTabardNow() end

--- Source signature: CycleVariation(variable: value, delta: number)
---@param variable any
---@param delta number
function WoWTabardModel:CycleVariation(variable, delta) end

---@param filename string
function WoWTabardModel:GetLowerBackgroundFileName(filename) end

---@param filename string
function WoWTabardModel:GetLowerEmblemFileName(filename) end

---@param texture string|WoWTexture
function WoWTabardModel:GetLowerEmblemTexture(texture) end

---@param filename string
function WoWTabardModel:GetUpperBackgroundFileName(filename) end

---@param filename string
function WoWTabardModel:GetUpperEmblemFileName(filename) end

---@param texture string|WoWTexture
function WoWTabardModel:GetUpperEmblemTexture(texture) end

function WoWTabardModel:InitializeTabardColors() end

function WoWTabardModel:Save() end


-- ==================== Talent ====================
-- Source: APIDocumentation/Documentation/TalentDocumentation.lua

---@param tabIndex integer
---@param talentIndex integer
---@param points number
---@param isPet boolean
---@param talentGroup number
function AddPreviewTalentPoints(tabIndex, talentIndex, points, isPet, talentGroup) end

---@return boolean inRange
function CheckTalentMasterDist() end

function ConfirmTalentWipe() end

---@param isInspect boolean
---@param isPet boolean
---@return number activeTalentGroup
function GetActiveTalentGroup(isInspect, isPet) end

---@param isPet boolean
---@param talentGroup number
---@return number pointsSpent
function GetGroupPreviewTalentPointsSpent(isPet, talentGroup) end

---@param isInspect boolean
---@param isPet boolean
---@return number numTalentGroups
function GetNumTalentGroups(isInspect, isPet) end

---@param inspect boolean
---@param pet boolean
---@return number numTabs
function GetNumTalentTabs(inspect, pet) end

---@param tabIndex integer
---@param inspect boolean
---@param pet boolean
---@return number numTalents
function GetNumTalents(tabIndex, inspect, pet) end

-- Additional source entry: APIDocumentation/Documentation/TalentDocumentation.lua :: GetPetTalentTree()

function GetPreviewTalentPointsSpent() end

---@param tabIndex integer
---@param talentIndex integer
---@param inspect boolean
---@param pet boolean
---@param talentGroup number
---@return string name
---@return string iconTexture
---@return number tier
---@return number column
---@return number rank
---@return number maxRank
---@return boolean isExceptional
---@return boolean meetsPrereq
---@return number previewRank
---@return boolean meetsPreviewPrereq
function GetTalentInfo(tabIndex, talentIndex, inspect, pet, talentGroup) end

-- Additional source entry: APIDocumentation/Documentation/TalentDocumentation.lua :: GetTalentLink(tabIndex: luaIndex, talentIndex: luaIndex, inspect: bool, pet: bool, talentGroup: number)

---@param tabIndex integer
---@param talentIndex integer
---@param inspect boolean
---@param pet boolean
---@param talentGroup number
---@return number tier
---@return number column
---@return boolean isLearnable
---@return boolean isPreviewLearnable
---@return any[] ...
function GetTalentPrereqs(tabIndex, talentIndex, inspect, pet, talentGroup) end

---@param tabIndex integer
---@param inspect boolean
---@param pet boolean
---@param talentGroup number
---@return number id
---@return string name
---@return string description
---@return string icon
---@return number points
---@return string background
---@return number previewPoints
---@return boolean isUnlocked
function GetTalentTabInfo(tabIndex, inspect, pet, talentGroup) end

---@param inspect boolean
---@param pet boolean
---@param talentGroup number
---@return number points
function GetUnspentTalentPoints(inspect, pet, talentGroup) end

---@param isPet boolean
function LearnPreviewTalents(isPet) end

---@param tabIndex integer
---@param talentIndex integer
---@param isPet boolean
---@param talentGroup number
function LearnTalent(tabIndex, talentIndex, isPet, talentGroup) end

---@param isPet boolean
---@param talentGroup number
function ResetGroupPreviewTalentPoints(isPet, talentGroup) end

---@param tabIndex integer
---@param isPet boolean
---@param talentGroup number
function ResetPreviewTalentPoints(tabIndex, isPet, talentGroup) end

---@param talentGroup number
function SetActiveTalentGroup(talentGroup) end


-- ==================== Targeting ====================
-- Source: APIDocumentation/Documentation/TargetingDocumentation.lua

---@param unit? UnitToken
---@param name? string
function AssistUnit(unit, name) end

function ClearFocus() end

function ClearTarget() end

---@param unit? UnitToken
---@param name? string
function FocusUnit(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/TargetingDocumentation.lua :: SpellCanTargetUnit(unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/TargetingDocumentation.lua :: SpellTargetUnit(unit: UnitToken?, name: string?)

function TargetLastEnemy() end

function TargetLastFriend() end

function TargetLastTarget() end

---@param backward? boolean
function TargetNearest(backward) end

---@param backward boolean
function TargetNearestEnemy(backward) end

---@param backward boolean
function TargetNearestEnemyPlayer(backward) end

---@param backward boolean
function TargetNearestFriend(backward) end

---@param backward boolean
function TargetNearestFriendPlayer(backward) end

---@param backward boolean
function TargetNearestPartyMember(backward) end

---@param backward boolean
function TargetNearestRaidMember(backward) end

---@param unit? UnitToken
---@param name? string
---@param exactMatch? boolean
function TargetUnit(unit, name, exactMatch) end


-- ==================== TaxiFlight ====================
-- Source: APIDocumentation/Documentation/TaxiflightDocumentation.lua

function CloseTaxiMap() end

---@param index integer
---@return number numHops
function GetNumRoutes(index) end

-- Additional source entry: APIDocumentation/Documentation/TaxiflightDocumentation.lua :: GetTaxiBenchmarkMode()

---@return number numNodes
function NumTaxiNodes() end

-- Additional source entry: APIDocumentation/Documentation/TaxiflightDocumentation.lua :: SetTaxiBenchmarkMode(arg: string)

---@param texture table
function SetTaxiMap(texture) end

---@param index integer
function TakeTaxiNode(index) end

---@param source number
---@param dest number
---@return number dX
function TaxiGetDestX(source, dest) end

---@param source number
---@param dest number
---@return number dY
function TaxiGetDestY(source, dest) end

---@param source number
---@param dest number
---@return number sX
function TaxiGetSrcX(source, dest) end

---@param source number
---@param dest number
---@return number sY
function TaxiGetSrcY(source, dest) end

---@param index integer
---@return number cost
function TaxiNodeCost(index) end

---@param index integer
---@return number type
function TaxiNodeGetType(index) end

---@param index integer
---@return string name
function TaxiNodeName(index) end

---@param index integer
---@return number x
---@return number y
function TaxiNodePosition(index) end

---@param slot number
function TaxiNodeSetCurrent(slot) end

---@param unit UnitToken
---@return boolean onTaxi
function UnitOnTaxi(unit) end


-- ==================== Texture ====================
-- Source: APIDocumentation/Documentation/TextureAPIDocumentation.lua

---@return any mode
function WoWTexture:GetBlendMode() end

function WoWTexture:GetHorizTile() end

---@return 1|nil nonBlocking
function WoWTexture:GetNonBlocking() end

---@return number ULx
---@return number ULy
---@return number LLx
---@return number LLy
---@return number URx
---@return number URy
---@return number LRx
---@return number LRy
function WoWTexture:GetTexCoord() end

---@return any texture
function WoWTexture:GetTexture() end

function WoWTexture:GetVertTile() end

---@return number red
---@return number green
---@return number blue
---@return number alpha
function WoWTexture:GetVertexColor() end

---@return 1|nil desaturated
function WoWTexture:IsDesaturated() end

--- Source signature: SetBlendMode(mode: value)
---@param mode any
function WoWTexture:SetBlendMode(mode) end

---@param desaturate boolean
---@return 1|nil supported
function WoWTexture:SetDesaturated(desaturate) end

--- Source signature: SetGradient(orientation: value, startR: number, startG: number, startB: number, endR: number, endG: number, endB: number)
---@param orientation any
---@param startR number
---@param startG number
---@param startB number
---@param endR number
---@param endG number
---@param endB number
function WoWTexture:SetGradient(orientation, startR, startG, startB, endR, endG, endB) end

--- Source signature: SetGradientAlpha(orientation: value, startR: number, startG: number, startB: number, startAlpha: number, endR: number, endG: number, endB: number, endAlpha: number)
---@param orientation any
---@param startR number
---@param startG number
---@param startB number
---@param startAlpha number
---@param endR number
---@param endG number
---@param endB number
---@param endAlpha number
function WoWTexture:SetGradientAlpha(orientation, startR, startG, startB, startAlpha, endR, endG, endB, endAlpha) end

function WoWTexture:SetHorizTile() end

---@param nonBlocking boolean
function WoWTexture:SetNonBlocking(nonBlocking) end

---@param radians number
---@param cx? number
---@param cy? number
function WoWTexture:SetRotation(radians, cx, cy) end

---@param left number
---@param right number
---@param top number
---@param bottom number
---@param ULx number
---@param ULy number
---@param LLx number
---@param LLy number
---@param URx number
---@param URy number
---@param LRx number
---@param LRy number
function WoWTexture:SetTexCoord(left, right, top, bottom, ULx, ULy, LLx, LLy, URx, URy, LRx, LRy) end

---@param texture string
---@param red number
---@param green number
---@param blue number
---@param alpha number
---@return 1|nil visible
function WoWTexture:SetTexture(texture, red, green, blue, alpha) end

function WoWTexture:SetVertTile() end


-- ==================== Threat ====================
-- Source: APIDocumentation/Documentation/ThreatDocumentation.lua

---@param status number
---@return number red
---@return number green
---@return number blue
function GetThreatStatusColor(status) end

---@return boolean enabled
function IsThreatWarningEnabled() end

---@param unit? UnitToken
---@param name? string
---@param mobUnit UnitToken
---@return boolean|nil isTanking
---@return number status
---@return number scaledPercent
---@return number rawPercent
---@return number threatValue
function UnitDetailedThreatSituation(unit, name, mobUnit) end

---@param unit? UnitToken
---@param name? string
---@param mobUnit? UnitToken
---@return number status
function UnitThreatSituation(unit, name, mobUnit) end


-- ==================== Tracking ====================
-- Source: APIDocumentation/Documentation/TrackingDocumentation.lua

---@return number count
function GetNumTrackingTypes() end

---@param index integer
---@return string name
---@return string texture
---@return boolean active
---@return string category
function GetTrackingInfo(index) end

---@param index integer
---@param enabled boolean
function SetTracking(index, enabled) end

function GetTrackingTexture() end


-- ==================== Trade ====================
-- Source: APIDocumentation/Documentation/TradeDocumentation.lua

function AcceptTrade() end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: AddTradeMoney()

function BeginTrade() end

function CancelTrade() end

function CancelTradeAccept() end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: ClickTargetTradeButton(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: ClickTradeButton(index: luaIndex)

function CloseTrade() end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: GetPlayerTradeMoney()

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: GetTargetTradeMoney()

---@param index integer
---@return string name
---@return string texture
---@return number numItems
---@return integer quality
---@return boolean isUsable
---@return string enchantment
function GetTradePlayerItemInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: GetTradePlayerItemLink(index: luaIndex)

---@param index integer
---@return string name
---@return string texture
---@return number numItems
---@return integer quality
---@return boolean isUsable
---@return string enchantment
function GetTradeTargetItemInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: GetTradeTargetItemLink(index: luaIndex)

---@param unit? UnitToken
---@param name? string
function InitiateTrade(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: PickupTradeMoney(amount: number)

function ReplaceTradeEnchant() end

-- Additional source entry: APIDocumentation/Documentation/TradeDocumentation.lua :: SetTradeMoney(amount: number)


-- ==================== Tradeskill ====================
-- Source: APIDocumentation/Documentation/TradeskillDocumentation.lua

function CloseTradeSkill() end

---@param index integer
function CollapseTradeSkillSubClass(index) end

---@param index integer
---@param repeat_? number
function DoTradeSkill(index, repeat_) end

---@param index integer
function ExpandTradeSkillSubClass(index) end

---@return integer index
function GetFirstTradeSkill() end

---@return number numSkills
function GetNumTradeSkills() end

---@param index integer
---@return number cooldown
function GetTradeSkillCooldown(index) end

---@param index integer
---@return string description
function GetTradeSkillDescription(index) end

---@param index integer
---@return string texturePath
function GetTradeSkillIcon(index) end

---@param index integer
---@return string skillName
---@return string skillType
---@return number numAvailable
---@return boolean isExpanded
---@return string serviceType
function GetTradeSkillInfo(index) end

---@param index integer
---@return boolean enabled
function GetTradeSkillInvSlotFilter(index) end

---@return any[] ...
function GetTradeSkillInvSlots() end

---@return number minLevel
---@return number maxLevel
function GetTradeSkillItemLevelFilter() end

-- Additional source entry: APIDocumentation/Documentation/TradeskillDocumentation.lua :: GetTradeSkillItemLink(index: luaIndex)

---@return string text
function GetTradeSkillItemNameFilter() end

---@return string tradeskillName
---@return number rank
---@return number maxLevel
function GetTradeSkillLine() end

-- Additional source entry: APIDocumentation/Documentation/TradeskillDocumentation.lua :: GetTradeSkillListLink()

---@param index integer
---@return number minMade
---@return number maxMade
function GetTradeSkillNumMade(index) end

---@param index integer
---@return number numReagents
function GetTradeSkillNumReagents(index) end

---@param skillIndex integer
---@param reagentIndex integer
---@return string reagentName
---@return string reagentTexture
---@return number reagentCount
---@return number playerReagentCount
function GetTradeSkillReagentInfo(skillIndex, reagentIndex) end

-- Additional source entry: APIDocumentation/Documentation/TradeskillDocumentation.lua :: GetTradeSkillReagentItemLink(skillIndex: luaIndex, reagentIndex: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/TradeskillDocumentation.lua :: GetTradeSkillRecipeLink(index: luaIndex)

---@return integer index
function GetTradeSkillSelectionIndex() end

---@param index integer
---@return boolean enabled
function GetTradeSkillSubClassFilter(index) end

---@return any[] ...
function GetTradeSkillSubClasses() end

---@param index integer
---@return string toolName
---@return boolean hasTool
---@return any[] ...
function GetTradeSkillTools(index) end

---@return number repeatCount
function GetTradeskillRepeatCount() end

---@return boolean isLinked
---@return string name
function IsTradeSkillLinked() end

---@param index integer
function SelectTradeSkill(index) end

---@param index integer
---@param enable number
---@param exclusive? boolean
function SetTradeSkillInvSlotFilter(index, enable, exclusive) end

---@param minLevel number
---@param maxLevel number
function SetTradeSkillItemLevelFilter(minLevel, maxLevel) end

---@param text string
function SetTradeSkillItemNameFilter(text) end

---@param index integer
---@param enable number
---@param exclusive? boolean
function SetTradeSkillSubClassFilter(index, enable, exclusive) end

function StopTradeSkillRepeat() end

---@param filter boolean
function TradeSkillOnlyShowMakeable(filter) end

---@param filter boolean
function TradeSkillOnlyShowSkillUps(filter) end


-- ==================== Trainer ====================
-- Source: APIDocumentation/Documentation/TrainerDocumentation.lua

---@param index integer
function BuyTrainerService(index) end

-- Additional source entry: APIDocumentation/Documentation/TrainerDocumentation.lua :: CheckTalentMasterDist()

function CloseTrainer() end

---@return number numServices
function GetNumTrainerServices() end

---@return string text
function GetTrainerGreetingText() end

---@return integer selectionIndex
function GetTrainerSelectionIndex() end

---@param index integer
---@param abilityIndex integer
---@return string ability
---@return boolean hasReq
function GetTrainerServiceAbilityReq(index, abilityIndex) end

---@param index integer
---@return number moneyCost
---@return number talentCost
---@return number skillCost
function GetTrainerServiceCost(index) end

---@param index integer
---@return string text
function GetTrainerServiceDescription(index) end

---@param index integer
---@return string icon
function GetTrainerServiceIcon(index) end

---@param index integer
---@return string serviceName
---@return string serviceSubText
---@return string serviceType
---@return boolean isExpanded
function GetTrainerServiceInfo(index) end

-- Additional source entry: APIDocumentation/Documentation/TrainerDocumentation.lua :: GetTrainerServiceItemLink(index: luaIndex)

---@param index integer
---@return number reqLevel
function GetTrainerServiceLevelReq(index) end

---@param index integer
---@return number numRequirements
function GetTrainerServiceNumAbilityReq(index) end

---@param index integer
---@return string skillLine
function GetTrainerServiceSkillLine(index) end

---@param index integer
---@return string skill
---@return number rank
---@return boolean hasReq
function GetTrainerServiceSkillReq(index) end

function GetTrainerServiceStepReq() end

---@param type string
---@return boolean isEnabled
function GetTrainerServiceTypeFilter(type) end

---@return boolean isTradeskill
function IsTradeskillTrainer() end

function OpenTrainer() end

---@param index integer
function SelectTrainerService(index) end

---@param type string
---@param enable number
---@param exclusive? boolean
function SetTrainerServiceTypeFilter(type, enable, exclusive) end

---@param type string
---@param enable number
---@param exclusive? boolean
function SetTrainerSkillLineFilter(type, enable, exclusive) end

function CollapseTrainerSkillLine() end

function ExpandTrainerSkillLine() end

function GetTrainerServiceStepIncrease() end

function GetTrainerSkillLineFilter() end

function GetTrainerSkillLines() end

function IsTrainerServiceSkillStep() end

function UnitCharacterPoints() end


-- ==================== Translation ====================
-- Source: APIDocumentation/Documentation/TranslationAPIDocumentation.lua

---@return number xOffset
---@return number yOffset
function WoWTranslation:GetOffset() end

---@param xOffset number
---@param yOffset number
function WoWTranslation:SetOffset(xOffset, yOffset) end


-- ==================== Tutorial ====================
-- Source: APIDocumentation/Documentation/TutorialDocumentation.lua

function ClearTutorials() end

---@param tutorial string
function FlagTutorial(tutorial) end

function ResetTutorials() end


-- ==================== UIVisual ====================
-- Source: APIDocumentation/Documentation/UivisualDocumentation.lua

function ConsoleAddMessage() end

---@param console_command string
function ConsoleExec(console_command) end

---@param frame WoWFrame
function SetupFullscreenScale(frame) end

-- Additional source entry: APIDocumentation/Documentation/UivisualDocumentation.lua :: ShowCloak(show: bool)

-- Additional source entry: APIDocumentation/Documentation/UivisualDocumentation.lua :: ShowHelm(show: bool)

-- Additional source entry: APIDocumentation/Documentation/UivisualDocumentation.lua :: ShowingCloak()

-- Additional source entry: APIDocumentation/Documentation/UivisualDocumentation.lua :: ShowingHelm()


-- ==================== Uncategorized ====================
-- Source: APIDocumentation/Documentation/UncategorizedDocumentation.lua

function AcceptProposal() end

function BNAcceptFriendInvite() end

---@return boolean isOnline
function BNConnected() end

---@param presenceID_1 number
---@param presenceID_2 number
---@return boolean result
function BNCreateConversation(presenceID_1, presenceID_2) end

function BNDeclineFriendInvite() end

---@return boolean isEnabled
function BNFeaturesEnabled() end

function BNFeaturesEnabledAndConnected() end

function BNGetBlockedInfo() end

function BNGetBlockedToonInfo() end

---@param channel number
---@return string type
function BNGetConversationInfo(channel) end

---@param channel number
---@param memberIndex integer
---@return number presenceID
---@return number unknown
---@return string displayName
function BNGetConversationMemberInfo(channel, memberIndex) end

function BNGetCustomMessageTable() end

---@param presenceID number
---@param mutual boolean
---@param non_mutual boolean
---@param index integer
---@return number presenceID
---@return string givenName
---@return string surname
---@return boolean isFriend
function BNGetFOFInfo(presenceID, mutual, non_mutual, index) end

function BNGetFriendInviteInfo() end

---@return number count
function BNGetMaxPlayersInConversation() end

function BNGetNumBlocked() end

function BNGetNumBlockedToons() end

---@param channel number
---@return number memberCount
function BNGetNumConversationMembers(channel) end

function BNGetNumFOF() end

function BNGetNumFriendInvites() end

function BNGetSelectedBlock() end

function BNGetSelectedToonBlock() end

---@param channel number
---@param presenceID number
function BNInviteToConversation(channel, presenceID) end

function BNIsBlocked() end

function BNIsFriend() end

---@param presenceID number
---@return boolean isSelf
function BNIsSelf(presenceID) end

function BNIsToonBlocked() end

function BNLeaveConversation() end

function BNListConversation() end

function BNRemoveFriend() end

function BNReportFriendInvite() end

function BNReportPlayer() end

function BNRequestFOFInfo() end

function BNSendConversationMessage() end

function BNSendFriendInvite() end

function BNSendFriendInviteByID() end

function BNSendWhisper() end

function BNSetAFK() end

function BNSetBlocked() end

function BNSetDND() end

function BNSetFocus() end

function BNSetSelectedBlock() end

function BNSetSelectedFriend() end

function BNSetSelectedToonBlock() end

function BNSetToonBlocked() end

function BattlefieldMgrEntryInviteResponse() end

function BattlefieldMgrExitRequest() end

function BattlefieldMgrQueueInviteResponse() end

function BattlefieldMgrQueueRequest() end

function CalendarContextInviteTentative() end

function CalendarEventTentative() end

function CalendarGetDayEventSequenceInfo() end

function CanChangePlayerDifficulty() end

function CanMapChangeDifficulty() end

function CanPartyLFGBackfill() end

function CanResetTutorials() end

function CancelSell() end

function CannotBeResurrected() end

function ChangePlayerDifficulty() end

function ClearAllLFGDungeons() end

function ClearLFGDungeon() end

function CompleteLFGRoleCheck() end

function DungeonUsesTerrainMap() end

function FindSpellBookSlotByID() end

function ForceGossip() end

function GMReportLag() end

function GetAllowLowLevelRaid() end

function GetAutoCompletePresenceID() end

---@param availableIndex integer
---@return boolean isTrivial
---@return boolean isDaily
---@return boolean isRepeatable
function GetAvailableQuestInfo(availableIndex) end

function GetChatWindowSavedDimensions() end

function GetChatWindowSavedPosition() end

---@param container number
---@param slot number
---@return boolean isQuest
---@return number questId
---@return boolean isActive
function GetContainerItemQuestInfo(container, slot) end

---@param factionID number
---@return string name
---@return string description
---@return number standingID
---@return number barMin
---@return number barMax
---@return number barValue
---@return boolean atWarWith
---@return boolean canToggleAtWar
---@return boolean isHeader
---@return boolean isCollapsed
---@return boolean hasRep
---@return boolean isWatched
---@return boolean isChild
function GetFactionInfoByID(factionID) end

function GetInstanceLockTimeRemainingEncounter() end

function GetLFDChoiceCollapseState() end

function GetLFDChoiceEnabledState() end

function GetLFDChoiceLockedState() end

function GetLFDLockInfo() end

function GetLFDLockPlayerCount() end

function GetLFGBootProposal() end

---@return string name
---@return number typeID
---@return string textureFilename
---@return number moneyBase
---@return number moneyVar
---@return number experienceBase
---@return number experienceVar
---@return number numStrangers
---@return number numRewards
function GetLFGCompletionReward() end

function GetLFGCompletionRewardItem() end

function GetLFGDeserterExpiration() end

function GetLFGDungeonInfo() end

function GetLFGDungeonRewardInfo() end

function GetLFGDungeonRewardLink() end

function GetLFGDungeonRewards() end

function GetLFGInfoLocal() end

function GetLFGInfoServer() end

function GetLFGProposal() end

function GetLFGProposalEncounter() end

function GetLFGProposalMember() end

function GetLFGQueueStats() end

function GetLFGQueuedList() end

function GetLFGRandomCooldownExpiration() end

function GetLFGRandomDungeonInfo() end

function GetLFGRoleUpdate() end

function GetLFGRoleUpdateMember() end

function GetLFGRoleUpdateSlot() end

function GetLFRChoiceOrder() end

function GetLastQueueStatusIndex() end

function GetMultiCastBarOffset() end

function GetMultiCastTotemSpells() end

function GetNextCompleatedTutorial() end

function GetNumQuestItemDrops() end

function GetNumQuestLogRewardFactions() end

function GetNumRandomDungeons() end

function GetPartyLFGBackfillInfo() end

function GetPetSpellBonusDamage() end

function GetPrevCompleatedTutorial() end

function GetQuestLogItemDrop() end

function GetQuestLogRewardArenaPoints() end

function GetQuestLogRewardFactionInfo() end

---@return number experience
function GetQuestLogRewardXP() end

function GetQuestPOILeaderBoard() end

function GetQuestSortIndex() end

---@param questLogIndex integer
---@return integer questWatchIndex
function GetQuestWatchIndex(questLogIndex) end

function GetQuestWorldMapAreaID() end

function GetRaidDifficulty() end

function GetRandomBGHonorCurrencyBonuses() end

function GetRandomDungeonBestChoice() end

---@return number arenaPoints
function GetRewardArenaPoints() end

function GetVehicleUIIndicator() end

function GetVehicleUIIndicatorSeat() end

---@return boolean state
function HasCompletedAnyAchievement() end

function HasLFGRestrictions() end

function IsBNLogin() end

function IsInLFGDungeon() end

function IsLFGDungeonJoinable() end

---@return boolean listedInLFR
function IsListedInLFR() end

function IsPartyLFG() end

function IsPetAttackAction() end

function IsTutorialFlagged() end

function IsZoomOutAvailable() end

function JoinLFG() end

function LeaveLFG() end

function PartyLFGStartBackfill() end

function ProcessQuestLogRewardFactions() end

function QuestIsDaily() end

function QuestIsWeekly() end

function QuestMapUpdateAllQuests() end

function QuestPOIGetIconInfo() end

function QuestPOIGetQuestIDByIndex() end

function QuestPOIGetQuestIDByVisibleIndex() end

function QuestPOIUpdateIcons() end

function RefreshLFGList() end

function RegisterStaticConstants() end

function RejectProposal() end

function RequestLFDPartyLockInfo() end

function RequestLFDPlayerLockInfo() end

function RespondMailLockSendItem() end

function SearchLFGGetEncounterResults() end

function SearchLFGGetJoinedID() end

function SearchLFGGetNumResults() end

function SearchLFGGetPartyResults() end

function SearchLFGGetResults() end

function SearchLFGJoin() end

function SearchLFGLeave() end

function SearchLFGSort() end

function SendSystemMessage() end

---@param enable boolean
function SetAllowLowLevelRaid(enable) end

function SetAuctionsTabShowing() end

---@param chatType string
---@param colorByName boolean
function SetChatColorNameByClass(chatType, colorByName) end

function SetChatWindowSavedDimensions() end

function SetChatWindowSavedPosition() end

function SetLFGBootVote() end

---@param queueIndex integer
function SetLFGDungeon(queueIndex) end

function SetLFGDungeonEnabled() end

function SetLFGHeaderCollapsed() end

---@param id number
function SetMapByID(id) end

function SetPOIIconOverlapDistance() end

function SetPOIIconOverlapPushDistance() end

function SetSavedInstanceExtend() end

function ShiftQuestWatches() end

function SortBGList() end

---@return boolean changed
function SortQuestWatches() end

function Stopwatch_Clear() end

function Stopwatch_FinishCountdown() end

function Stopwatch_IsPlaying() end

function Stopwatch_Pause() end

function Stopwatch_Play() end

function Stopwatch_StartCountdown() end

function Stopwatch_Toggle() end

function TriggerTutorial() end

function UnitGroupRolesAssigned() end

function UnitHasLFGDeserter() end

function UnitHasLFGRandomCooldown() end

function debughook() end

function GetAvailableRoles() end

function GetLFDChoiceInfo() end

function GetLFDChoiceOrder() end

function QuestPOIUpdateTexture() end


-- ==================== UncategorizedEvents ====================
-- Source: APIDocumentation/Documentation/UncategorizedeventsDocumentation.lua


-- ==================== Unit ====================
-- Source: APIDocumentation/Documentation/UnitDocumentation.lua

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: CanInspect(unit: UnitToken, showError: bool)

---@param unit UnitToken
---@param distIndex integer
---@return boolean canInteract
function CheckInteractDistance(unit, distIndex) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: GetGuildInfo(unit: UnitToken?, name: string?)

---@param unit? UnitToken
---@param name? string
---@param channel? string
---@return boolean muteStatus
function GetMuteStatus(unit, name, channel) end

---@param guid WOWGUID
---@return string class
---@return string classFilename
---@return string race
---@return string raceFilename
---@return number sex
---@return string name
---@return string realm
function GetPlayerInfoByGUID(guid) end

---@param unit UnitToken
---@param showServerName boolean
---@return string nameString
function GetUnitName(unit, showServerName) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: GetUnitSpeed(unit: UnitToken)

---@param unit UnitToken
---@return boolean isIgnoredOrMuted
function IsIgnoredOrMuted(unit) end

---@param unit? UnitToken
---@param name? string
---@return boolean muted
function IsMuted(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: IsUnitOnQuest(index: luaIndex, unit: UnitToken)

---@param texture table
---@param unit UnitToken
function SetPortraitTexture(texture, unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitAffectingCombat(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitAura(unit: UnitToken?, index: luaIndex?, name: string?, rank: string?, filter: string?)

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean canAssist
function UnitCanAssist(unit, unit2) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean canAttack
function UnitCanAttack(unit, unit2) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean canCooperate
function UnitCanCooperate(unit, unit2) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitCastingInfo(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitChannelInfo(unit: UnitToken)

---@param unit? UnitToken
---@param name? string
---@return string class
---@return string classFileName
function UnitClass(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return string class
---@return string classFileName
function UnitClassBase(unit, name) end

---@param unit UnitToken
---@return string classification
function UnitClassification(unit) end

---@param unit UnitToken
---@return string family
function UnitCreatureFamily(unit) end

---@param unit UnitToken
---@return string type
function UnitCreatureType(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitDebuff(unit: UnitToken?, index: luaIndex?, name: string?, rank: string?, filter: string?)

---@param unit? UnitToken
---@param name? string
---@return boolean exists
function UnitExists(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return string factionGroup
---@return string factionName
function UnitFactionGroup(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitGUID(unit: UnitToken)

---@param unit UnitToken
---@return boolean hasRelic
function UnitHasRelicSlot(unit) end

---@param unit? UnitToken
---@param name? string
---@return number health
function UnitHealth(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return number maxValue
function UnitHealthMax(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitInBattleground(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitInParty(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitInRaid(unit: UnitToken)

---@param unit? UnitToken
---@param name? string
---@return boolean inRange
function UnitInRange(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return boolean isAFK
function UnitIsAFK(unit, name) end

---@param unit UnitToken
---@return boolean isCharmed
function UnitIsCharmed(unit) end

---@param unit UnitToken
---@return boolean isConnected
function UnitIsConnected(unit) end

---@param unit UnitToken
---@return boolean isControlling
function UnitIsControlling(unit) end

---@param unit UnitToken
---@return boolean isCorpse
function UnitIsCorpse(unit) end

---@param unit? UnitToken
---@param name? string
---@return boolean isDND
function UnitIsDND(unit, name) end

---@param unit UnitToken
---@return boolean isDead
function UnitIsDead(unit) end

---@param unit UnitToken
---@return boolean isDeadOrGhost
function UnitIsDeadOrGhost(unit) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean isEnemy
function UnitIsEnemy(unit, unit2) end

---@param unit UnitToken
---@return boolean isFeign
function UnitIsFeignDeath(unit) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean isFriends
function UnitIsFriend(unit, unit2) end

---@param unit UnitToken
---@return boolean isGhost
function UnitIsGhost(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitIsInMyGuild(unit: UnitToken?, name: string?)

---@param unit UnitToken
---@return boolean isPVP
function UnitIsPVP(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitIsPVPFreeForAll(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitIsPVPSanctuary(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitIsPartyLeader(unit: UnitToken?, name: string?)

---@param unit UnitToken
---@return boolean isPlayer
function UnitIsPlayer(unit) end

---@param unit UnitToken
---@return boolean isPossessed
function UnitIsPossessed(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitIsRaidOfficer(unit: UnitToken?, name: string?)

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean isSame
function UnitIsSameServer(unit, unit2) end

---@param unit UnitToken
function UnitIsTapped(unit) end

---@param unit UnitToken
---@return boolean allTapped
function UnitIsTappedByAllThreatList(unit) end

---@param unit UnitToken
---@return boolean isTapped
function UnitIsTappedByPlayer(unit) end

---@param unit UnitToken
---@return boolean isTrivial
function UnitIsTrivial(unit) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return boolean isSame
function UnitIsUnit(unit, unit2) end

---@param unit UnitToken
---@return boolean isVisible
function UnitIsVisible(unit) end

---@param unit UnitToken
---@return number level
function UnitLevel(unit) end

---@param unit? UnitToken
---@param name? string
---@return number mana
function UnitMana(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return number maxValue
function UnitManaMax(unit, name) end

---@param unit string
---@return string name
---@return string|nil realm
function UnitName(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitOnTaxi(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitPVPName(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitPVPRank(unit: UnitToken)

---@param unit UnitToken
---@return boolean isPlayer
function UnitPlayerControlled(unit) end

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitPlayerOrPetInParty(unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/UnitDocumentation.lua :: UnitPlayerOrPetInRaid(unit: UnitToken?, name: string?)

---@param unitID string
---@param powerType? string
---@return number power
function UnitPower(unitID, powerType) end

---@param unitID UnitToken
---@param powerType? number
---@return number maxValue
function UnitPowerMax(unitID, powerType) end

---@param unit? UnitToken
---@param name? string
---@return number powerType
---@return string powerToken
---@return number altR
---@return number altG
---@return number altB
function UnitPowerType(unit, name) end

---@param unit UnitToken
---@return string race
---@return string fileName
function UnitRace(unit) end

---@param unit UnitToken
---@param unit2 UnitToken
---@return number reaction
function UnitReaction(unit, unit2) end

---@param unit? UnitToken
---@param name? string
---@return number red
---@return number green
---@return number blue
---@return number alpha
function UnitSelectionColor(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return number gender
function UnitSex(unit, name) end

---@param unit UnitToken
---@return boolean usingVehicle
function UnitUsingVehicle(unit) end


-- ==================== Utility ====================
-- Source: APIDocumentation/Documentation/UtilityDocumentation.lua

---@param name string
---@return table fontObject
function CreateFont(name) end

---@overload fun(frameType: "Button", name?: string, parent?: WoWFrame, template?: string): WoWButton
---@overload fun(frameType: "CheckButton", name?: string, parent?: WoWFrame, template?: string): WoWCheckButton
---@overload fun(frameType: "ColorSelect", name?: string, parent?: WoWFrame, template?: string): WoWColorSelect
---@overload fun(frameType: "Cooldown", name?: string, parent?: WoWFrame, template?: string): WoWCooldown
---@overload fun(frameType: "DressUpModel", name?: string, parent?: WoWFrame, template?: string): WoWDressUpModel
---@overload fun(frameType: "EditBox", name?: string, parent?: WoWFrame, template?: string): WoWEditBox
---@overload fun(frameType: "Frame", name?: string, parent?: WoWFrame, template?: string): WoWFrame
---@overload fun(frameType: "GameTooltip", name?: string, parent?: WoWFrame, template?: string): WoWGameTooltip
---@overload fun(frameType: "MessageFrame", name?: string, parent?: WoWFrame, template?: string): WoWMessageFrame
---@overload fun(frameType: "Minimap", name?: string, parent?: WoWFrame, template?: string): WoWMinimap
---@overload fun(frameType: "Model", name?: string, parent?: WoWFrame, template?: string): WoWModel
---@overload fun(frameType: "MovieFrame", name?: string, parent?: WoWFrame, template?: string): WoWMovieFrame
---@overload fun(frameType: "PlayerModel", name?: string, parent?: WoWFrame, template?: string): WoWPlayerModel
---@overload fun(frameType: "QuestPOIFrame", name?: string, parent?: WoWFrame, template?: string): WoWQuestPOIFrame
---@overload fun(frameType: "ScrollFrame", name?: string, parent?: WoWFrame, template?: string): WoWScrollFrame
---@overload fun(frameType: "ScrollingMessageFrame", name?: string, parent?: WoWFrame, template?: string): WoWScrollingMessageFrame
---@overload fun(frameType: "SimpleHTML", name?: string, parent?: WoWFrame, template?: string): WoWSimpleHTML
---@overload fun(frameType: "Slider", name?: string, parent?: WoWFrame, template?: string): WoWSlider
---@overload fun(frameType: "StatusBar", name?: string, parent?: WoWFrame, template?: string): WoWStatusBar
---@overload fun(frameType: "TabardModel", name?: string, parent?: WoWFrame, template?: string): WoWTabardModel
---@param frameType string
---@param name? string
---@param parent? WoWFrame
---@param template? string
---@return WoWFrame frame
function CreateFrame(frameType, name, parent, template) end

---@param currentFrame? WoWFrame
---@return WoWFrame nextFrame
function EnumerateFrames(currentFrame) end

---@param inputString string
---@param includeBitfield number
---@param excludeBitfield number
---@param maxResults number
---@param cursorPosition? number
---@return any[] ...
function GetAutoCompleteResults(inputString, includeBitfield, excludeBitfield, maxResults, cursorPosition) end

---@param name string
---@return WoWFrame frame
function GetClickFrame(name) end

-- Additional source entry: APIDocumentation/Documentation/UtilityDocumentation.lua :: GetCurrentKeyBoardFocus()

---@param event string
---@return any[] ...
function GetFramesRegisteredForEvent(event) end

---@param index integer
---@return string timer
---@return number value
---@return number maxvalue
---@return number scale
---@return number paused
---@return string label
function GetMirrorTimerInfo(index) end

---@param timer string
---@return number progress
function GetMirrorTimerProgress(timer) end

---@return string button
function GetMouseButtonClicked() end

---@param buttonNumber number
---@return string buttonName
function GetMouseButtonName(buttonNumber) end

-- Additional source entry: APIDocumentation/Documentation/UtilityDocumentation.lua :: GetMouseFocus()

---@param index integer
---@return string name
function GetMuteName(index) end

---@return number numFrames
function GetNumFrames() end

---@param token string
---@param gender? number
---@param ordinal? number
---@return string text
function GetText(token, gender, ordinal) end

---@return number time
function GetTime() end

---@return boolean loggedIn
function IsLoggedIn() end

---@param button? number
---@return boolean isDown
function IsMouseButtonDown(button) end

function RegisterForSave() end

function RegisterForSavePerCharacter() end

function RequestTimePlayed() end

---@param script string
function RunScript(script) end

---@param seconds number
---@param noSeconds boolean
---@param notAbbreviated boolean
---@param maxCount? number
---@return string time
function SecondsToTime(seconds, noSeconds, notAbbreviated, maxCount) end

---@param frameName string
---@param texturePath string
function SetPortraitToTexture(frameName, texturePath) end

---@param stackLevel number
---@return string localsInfo
function debuglocals(stackLevel) end

---@param name string
---@return string value
function getglobal(name) end

---@param ... table
---@return any[] ...
function scrub(...) end

---@param name string
---@param value string
function setglobal(name, value) end

---@param ... string
---@return string result
function strconcat(...) end

---@param sep string
---@param ... table
---@return string text
function strjoin(sep, ...) end

---@param string string
---@return number length
function strlenutf8(string) end

---@param text string
---@param pattern string
---@param replacement string
---@param count string
---@return string newText
---@return number count
function strreplace(text, pattern, replacement, count) end

---@param sep string
---@param text string
---@param limit number
---@return any[] ...
function strsplit(sep, text, limit) end

---@param str string
---@param trimChars? string
---@return string text
function strtrim(str, trimChars) end

---@param aTable table
---@return table emptyTable
function wipe(aTable) end


-- ==================== Vehicle ====================
-- Source: APIDocumentation/Documentation/VehicleDocumentation.lua

---@param seat number
---@return boolean canEject
function CanEjectPassengerFromSeat(seat) end

---@return boolean canExit
function CanExitVehicle() end

---@return boolean canSwitch
function CanSwitchVehicleSeat() end

---@return boolean canSwitch
function CanSwitchVehicleSeats() end

---@param unit UnitToken
function CombatTextSetActiveUnit(unit) end

---@param seat number
function EjectPassengerFromSeat(seat) end

function IsUsingVehicleControls() end

---@return boolean hasAngleControl
function IsVehicleAimAngleAdjustable() end

function IsVehicleAimPowerAdjustable() end

---@param unit? UnitToken
---@param name? string
---@return boolean isControlling
function UnitControllingVehicle(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return boolean hasVehicle
function UnitHasVehicleUI(unit, name) end

---@param unit? UnitToken
---@param name? string
---@return boolean inVehicle
function UnitInVehicle(unit, name) end

---@return boolean isInControl
function UnitInVehicleControlSeat() end

-- Additional source entry: APIDocumentation/Documentation/VehicleDocumentation.lua :: UnitIsControlling(unit: UnitToken)

---@param unit UnitToken
---@param seat number
function UnitSwitchToVehicleSeat(unit, seat) end

-- Additional source entry: APIDocumentation/Documentation/VehicleDocumentation.lua :: UnitTargetsVehicleInRaidUI(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/VehicleDocumentation.lua :: UnitUsingVehicle(unit: UnitToken)

function UnitVehicleSeatCount() end

---@param unit UnitToken
---@param seat number
---@return string controlType
---@return string occupantName
---@return string occupantRealm
---@return boolean canEject
---@return boolean canSwitchSeats
function UnitVehicleSeatInfo(unit, seat) end

---@param unit? UnitToken
---@param name? string
---@return string skin
function UnitVehicleSkin(unit, name) end

---@param amount number
function VehicleAimDecrement(amount) end

function VehicleAimDownStart() end

function VehicleAimDownStop() end

---@return number angle
function VehicleAimGetAngle() end

function VehicleAimGetNormAngle() end

function VehicleAimGetNormPower() end

---@param amount number
function VehicleAimIncrement(amount) end

---@param amount number
function VehicleAimRequestAngle(amount) end

---@param amount number
function VehicleAimRequestNormAngle(amount) end

function VehicleAimSetNormPower() end

function VehicleAimUpStart() end

function VehicleAimUpStop() end

function VehicleCameraZoomIn() end

function VehicleCameraZoomOut() end

function VehicleExit() end

function VehicleNextSeat() end

function VehiclePrevSeat() end


-- ==================== Video ====================
-- Source: APIDocumentation/Documentation/VideoDocumentation.lua

---@return integer index
function GetCurrentMultisampleFormat() end

---@return integer index
function GetCurrentResolution() end

---@return number distance
function GetFarclip() end

-- Additional source entry: APIDocumentation/Documentation/VideoDocumentation.lua :: GetFramerate()

---@return number gamma
function GetGamma() end

---@return number color
---@return number depth
---@return number multisample
---@return any[] ...
function GetMultisampleFormats() end

---@return any[] ...
function GetRefreshRates() end

---@return number height
function GetScreenHeight() end

---@return any[] ...
function GetScreenResolutions() end

---@return number screenWidth
function GetScreenWidth() end

---@return number terrainDetail
function GetTerrainMip() end

---@return number hasAnisotropic
---@return number hasPixelShaders
---@return number hasVertexShaders
---@return number hasTrilinear
---@return number hasTripleBufering
---@return number maxAnisotropy
---@return number hasHardwareCursor
function GetVideoCaps() end

---@return boolean isSupported
function IsDesaturateSupported() end

---@return boolean isAvailable
function IsPlayerResolutionAvailable() end

---@return boolean isAvailable
function IsStereoVideoAvailable() end

function RestartGx() end

function RestoreVideoStereoDefaults() end

---@param value number
function SetGamma(value) end

---@param index integer
function SetMultisampleFormat(index) end

---@param index integer
function SetScreenResolution(index) end

function SetTexLodBias() end

---@param value number
function SetWaterDetail(value) end

function GetBaseMip() end

function GetWaterDetail() end

function RestoreVideoEffectsDefaults() end

function RestoreVideoResolutionDefaults() end

function SetBaseMip() end

function SetFarclip() end

function SetTerrainMip() end


-- ==================== Voice ====================
-- Source: APIDocumentation/Documentation/VoiceDocumentation.lua

---@param name string
function AddMute(name) end

---@param unit? UnitToken
---@param name? string
function AddOrDelMute(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelSilenceAll(channelName: string?, channelId: number?, unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelSilenceVoice(channelName: string?, channelId: number?, unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelUnSilenceAll(channelName: string?, channelId: number?, unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelUnSilenceVoice(channelName: string?, channelId: number?, unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelVoiceOff(channel: string?, channelIndex: luaIndex?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: ChannelVoiceOn(channel: string?, channelIndex: luaIndex?)

---@param unit? UnitToken
---@param name? string
function DelMute(unit, name) end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: DisplayChannelVoiceOff(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: DisplayChannelVoiceOn(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: GetActiveVoiceChannel()

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: GetMuteName(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: GetMuteStatus(unit: UnitToken?, name: string?, channel: string?)

---@return number numMuted
function GetNumMutes() end

---@param sessionId number
---@return number numMembers
function GetNumVoiceSessionMembersBySessionID(sessionId) end

---@return number count
function GetNumVoiceSessions() end

---@return number selectedMute
function GetSelectedMute() end

---@return number id
function GetVoiceCurrentSessionID() end

---@param session number
---@return string name
---@return boolean active
function GetVoiceSessionInfo(session) end

---@param session number
---@param index integer
---@return string name
---@return boolean voiceActive
---@return boolean sessionActive
---@return boolean muted
---@return boolean squelched
function GetVoiceSessionMemberInfoBySessionID(session, index) end

---@param unit? UnitToken
---@param name? string
---@param channel? string
---@return boolean status
function GetVoiceStatus(unit, name, channel) end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: IsIgnoredOrMuted(unit: UnitToken)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: IsMuted(unit: UnitToken?, name: string?)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: IsSilenced(name: string, channel: string)

---@return boolean isAllowed
function IsVoiceChatAllowed() end

function IsVoiceChatAllowedByServer() end

---@return boolean isEnabled
function IsVoiceChatEnabled() end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: SetActiveVoiceChannel(index: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: SetActiveVoiceChannelBySessionID(session: number)

---@param index integer
function SetSelectedMute(index) end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: SilenceMember()

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: UnSilenceMember()

---@param name string
---@param channel string
---@return boolean silenced
function UnitIsSilenced(name, channel) end

---@param unit UnitToken
---@return boolean state
function UnitIsTalking(unit) end

function VoiceChat_ActivatePrimaryCaptureCallback() end

---@return number volume
function VoiceChat_GetCurrentMicrophoneSignalLevel() end

---@param isPlaying number
function VoiceChat_IsPlayingLoopbackSound(isPlaying) end

---@return number isRecording
function VoiceChat_IsRecordingLoopbackSound() end

function VoiceChat_PlayLoopbackSound() end

---@param seconds number
function VoiceChat_RecordLoopbackSound(seconds) end

function VoiceChat_StartCapture() end

function VoiceChat_StopCapture() end

function VoiceChat_StopPlayingLoopbackSound() end

function VoiceChat_StopRecordingLoopbackSound() end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceEnumerateCaptureDevices(deviceIndex: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceEnumerateOutputDevices(deviceIndex: luaIndex)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceGetCurrentCaptureDevice()

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceGetCurrentOutputDevice()

---@return boolean isDisabled
function VoiceIsDisabledByClient() end

function VoicePushToTalkStart() end

function VoicePushToTalkStop() end

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceSelectCaptureDevice(deviceName: string)

-- Additional source entry: APIDocumentation/Documentation/VoiceDocumentation.lua :: VoiceSelectOutputDevice(deviceName: string)


-- ==================== UIObject ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return string name
function WoWUIObject:GetName() end

---@return string type
function WoWUIObject:GetObjectType() end

---@param type string
---@return 1|nil isType
function WoWUIObject:IsObjectType(type) end


-- ==================== ScriptObject ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@param scriptType string
---@return function handler
function WoWScriptObject:GetScript(scriptType) end

---@param scriptType string
---@return 1|nil hasScript
function WoWScriptObject:HasScript(scriptType) end

---@param scriptType string
---@param handler function
function WoWScriptObject:HookScript(scriptType, handler) end

---@param scriptType string
---@param handler? function
function WoWScriptObject:SetScript(scriptType, handler) end


-- ==================== ParentedObject ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return WoWUIObject? object
function WoWParentedObject:GetParent() end


-- ==================== Region ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return any|nil canChange
function WoWRegion:CanChangeProtectedState() end

function WoWRegion:ClearAllPoints() end

---@param name string
---@param inheritsFrom string
---@return WoWAnimationGroup object
function WoWRegion:CreateAnimationGroup(name, inheritsFrom) end

---@return any[] ...
function WoWRegion:GetAnimationGroups() end

---@return number bottom
function WoWRegion:GetBottom() end

---@return number x
---@return number y
function WoWRegion:GetCenter() end

---@return number height
function WoWRegion:GetHeight() end

---@return number left
function WoWRegion:GetLeft() end

---@return number numPoints
function WoWRegion:GetNumPoints() end

---@param index number
---@return string point
---@return WoWRegion relativeTo
---@return string relativePoint
---@return number xOffset
---@return number yOffset
function WoWRegion:GetPoint(index) end

---@return number left
---@return number bottom
---@return number width
---@return number height
function WoWRegion:GetRect() end

---@return number right
function WoWRegion:GetRight() end

---@return number width
---@return number height
function WoWRegion:GetSize() end

---@return number top
function WoWRegion:GetTop() end

---@return number width
function WoWRegion:GetWidth() end

---@return 1|nil isDragging
function WoWRegion:IsDragging() end

---@return 1|nil isOver
function WoWRegion:IsMouseOver() end

---@return any|nil isProtected
---@return any|nil explicit
function WoWRegion:IsProtected() end

---@param region WoWRegion
---@param name string
function WoWRegion:SetAllPoints(region, name) end

---@param height number
function WoWRegion:SetHeight(height) end

---@param frame WoWFrame
---@param name string
function WoWRegion:SetParent(frame, name) end

---@param point string
---@param relativeTo WoWRegion
---@param relativePoint string
---@param xOffset number
---@param yOffset number
function WoWRegion:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset) end

---@param width number
---@param height number
function WoWRegion:SetSize(width, height) end

---@param width number
function WoWRegion:SetWidth(width) end

function WoWRegion:StopAnimating() end


-- ==================== VisibleRegion ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return number alpha
function WoWVisibleRegion:GetAlpha() end

function WoWVisibleRegion:Hide() end

---@return 1|nil shown
function WoWVisibleRegion:IsShown() end

---@return 1|nil visible
function WoWVisibleRegion:IsVisible() end

---@param alpha number
function WoWVisibleRegion:SetAlpha(alpha) end

function WoWVisibleRegion:Show() end


-- ==================== FontInstance ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return string filename
---@return number fontHeight
---@return any flags
function WoWFontInstance:GetFont() end

---@return WoWFont font
function WoWFontInstance:GetFontObject() end

---@return any justify
function WoWFontInstance:GetJustifyH() end

---@return any justify
function WoWFontInstance:GetJustifyV() end

---@return number shadowR
---@return number shadowG
---@return number shadowB
---@return number shadowAlpha
function WoWFontInstance:GetShadowColor() end

---@return number xOffset
---@return number yOffset
function WoWFontInstance:GetShadowOffset() end

---@return number spacing
function WoWFontInstance:GetSpacing() end

---@return number textR
---@return number textG
---@return number textB
---@return number textAlpha
function WoWFontInstance:GetTextColor() end

--- Source signature: SetFont(filename: string, fontHeight: number, flags: value)
---@param filename string
---@param fontHeight number
---@param flags any
---@return 1|nil isValid
function WoWFontInstance:SetFont(filename, fontHeight, flags) end

---@param object WoWFont
---@param name string
function WoWFontInstance:SetFontObject(object, name) end

--- Source signature: SetJustifyH(justify: value)
---@param justify any
function WoWFontInstance:SetJustifyH(justify) end

function WoWFontInstance:SetJustifyV() end

---@param shadowR number
---@param shadowG number
---@param shadowB number
---@param shadowAlpha number
function WoWFontInstance:SetShadowColor(shadowR, shadowG, shadowB, shadowAlpha) end

---@param xOffset number
---@param yOffset number
function WoWFontInstance:SetShadowOffset(xOffset, yOffset) end

---@param spacing number
function WoWFontInstance:SetSpacing(spacing) end

---@param textR number
---@param textG number
---@param textB number
---@param textAlpha number
function WoWFontInstance:SetTextColor(textR, textG, textB, textAlpha) end


-- ==================== LayeredRegion ====================
-- Source: APIDocumentation/Documentation/WidgetSharedDocumentation.lua

---@return any layer
function WoWLayeredRegion:GetDrawLayer() end

--- Source signature: SetDrawLayer(layer: value)
---@param layer any
function WoWLayeredRegion:SetDrawLayer(layer) end

---@param red number
---@param green number
---@param blue number
---@param alpha number
function WoWLayeredRegion:SetVertexColor(red, green, blue, alpha) end


-- ==================== Zone Information ====================
-- Source: APIDocumentation/Documentation/ZoneInformationDocumentation.lua

---@return string zoneText
function GetMinimapZoneText() end

---@return string zoneName
function GetRealZoneText() end

---@return string subzoneText
function GetSubZoneText() end

-- Additional source entry: APIDocumentation/Documentation/ZoneInformationDocumentation.lua :: GetZonePVPInfo()

---@return string zone
function GetZoneText() end

-- Additional source entry: APIDocumentation/Documentation/ZoneInformationDocumentation.lua :: IsSubZonePVPPOI()


-- Event names and documented payloads (the payload is passed after the event name).
---@alias WotLKEvent
---| "ACHIEVEMENT_EARNED" # no payload documented
---| "CHAT_MSG_ACHIEVEMENT" # no payload documented
---| "CHAT_MSG_GUILD_ACHIEVEMENT" # message: string, sender: string
---| "INSPECT_ACHIEVEMENT_READY" # no payload documented
---| "RECEIVED_ACHIEVEMENT_LIST" # no payload documented
---| "TRACKED_ACHIEVEMENT_UPDATE" # achievementId: number
---| "ADDON_ACTION_BLOCKED" # no payload documented
---| "ADDON_ACTION_FORBIDDEN" # culprit: string
---| "MACRO_ACTION_BLOCKED" # no payload documented
---| "MACRO_ACTION_FORBIDDEN" # no payload documented
---| "ACTIONBAR_HIDEGRID" # no payload documented
---| "ACTIONBAR_PAGE_CHANGED" # no payload documented
---| "ACTIONBAR_SHOWGRID" # no payload documented
---| "ACTIONBAR_SLOT_CHANGED" # slot: number
---| "ACTIONBAR_UPDATE_COOLDOWN" # no payload documented
---| "ACTIONBAR_UPDATE_STATE" # no payload documented
---| "ACTIONBAR_UPDATE_USABLE" # no payload documented
---| "UPDATE_BONUS_ACTIONBAR" # no payload documented
---| "UPDATE_MULTI_CAST_ACTIONBAR" # no payload documented
---| "ADDON_LOADED" # name: string
---| "ARENA_OPPONENT_UPDATE" # no payload documented
---| "ARENA_SEASON_WORLD_STATE" # no payload documented
---| "ARENA_TEAM_INVITE_REQUEST" # source: string, team: string
---| "ARENA_TEAM_ROSTER_UPDATE" # unknown: bool
---| "ARENA_TEAM_UPDATE" # no payload documented
---| "AUCTION_BIDDER_LIST_UPDATE" # no payload documented
---| "AUCTION_HOUSE_CLOSED" # no payload documented
---| "AUCTION_HOUSE_DISABLED" # no payload documented
---| "AUCTION_HOUSE_SHOW" # no payload documented
---| "AUCTION_ITEM_LIST_UPDATE" # no payload documented
---| "AUCTION_MULTISELL_FAILURE" # no payload documented
---| "AUCTION_MULTISELL_START" # amount: number
---| "AUCTION_MULTISELL_UPDATE" # createdAmount: number, amount: number
---| "AUCTION_OWNED_LIST_UPDATE" # no payload documented
---| "NEW_AUCTION_UPDATE" # no payload documented
---| "BANKFRAME_CLOSED" # no payload documented
---| "BANKFRAME_OPENED" # no payload documented
---| "PLAYERBANKBAGSLOTS_CHANGED" # no payload documented
---| "PLAYERBANKSLOTS_CHANGED" # slotID: number
---| "BARBER_SHOP_APPEARANCE_APPLIED" # no payload documented
---| "BARBER_SHOP_CLOSE" # no payload documented
---| "BARBER_SHOP_OPEN" # no payload documented
---| "BARBER_SHOP_SUCCESS" # no payload documented
---| "BN_BLOCK_LIST_UPDATED" # no payload documented
---| "BN_CONNECTED" # no payload documented
---| "BN_CUSTOM_MESSAGE_CHANGED" # no payload documented
---| "BN_CUSTOM_MESSAGE_LOADED" # no payload documented
---| "BN_DISCONNECTED" # no payload documented
---| "BN_FRIEND_ACCOUNT_OFFLINE" # presenceID: number
---| "BN_FRIEND_ACCOUNT_ONLINE" # presenceID: number
---| "BN_FRIEND_INFO_CHANGED" # no payload documented
---| "BN_FRIEND_INVITE_ADDED" # no payload documented
---| "BN_FRIEND_INVITE_LIST_INITIALIZED" # no payload documented
---| "BN_FRIEND_INVITE_REMOVED" # no payload documented
---| "BN_FRIEND_INVITE_SEND_RESULT" # no payload documented
---| "BN_FRIEND_LIST_SIZE_CHANGED" # no payload documented
---| "BN_FRIEND_TOON_OFFLINE" # no payload documented
---| "BN_FRIEND_TOON_ONLINE" # no payload documented
---| "BN_MATURE_LANGUAGE_FILTER" # no payload documented
---| "BN_NEW_PRESENCE" # index: luaIndex, name: string
---| "BN_SELF_OFFLINE" # no payload documented
---| "BN_SELF_ONLINE" # no payload documented
---| "BN_SYSTEM_MESSAGE" # no payload documented
---| "BN_TOON_NAME_UPDATED" # no payload documented
---| "BATTLEFIELDS_CLOSED" # no payload documented
---| "BATTLEFIELDS_SHOW" # no payload documented
---| "BATTLEFIELD_MGR_EJECTED" # no payload documented
---| "BATTLEFIELD_MGR_EJECT_PENDING" # no payload documented
---| "BATTLEFIELD_MGR_ENTERED" # no payload documented
---| "BATTLEFIELD_MGR_ENTRY_INVITE" # no payload documented
---| "BATTLEFIELD_MGR_QUEUE_INVITE" # no payload documented
---| "BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE" # no payload documented
---| "BATTLEFIELD_MGR_STATE_CHANGE" # no payload documented
---| "UPDATE_BATTLEFIELD_SCORE" # no payload documented
---| "UPDATE_BATTLEFIELD_STATUS" # no payload documented
---| "CALENDAR_ACTION_PENDING" # no payload documented
---| "CALENDAR_CLOSE_EVENT" # no payload documented
---| "CALENDAR_EVENT_ALARM" # no payload documented
---| "CALENDAR_NEW_EVENT" # no payload documented
---| "CALENDAR_OPEN_EVENT" # no payload documented
---| "CALENDAR_UPDATE_ERROR" # no payload documented
---| "CALENDAR_UPDATE_EVENT" # no payload documented
---| "CALENDAR_UPDATE_EVENT_LIST" # no payload documented
---| "CALENDAR_UPDATE_INVITE_LIST" # no payload documented
---| "CALENDAR_UPDATE_PENDING_INVITES" # no payload documented
---| "BN_CHAT_CHANNEL_CLOSED" # no payload documented
---| "BN_CHAT_CHANNEL_CREATE_FAILED" # no payload documented
---| "BN_CHAT_CHANNEL_CREATE_SUCCEEDED" # no payload documented
---| "BN_CHAT_CHANNEL_INVITE_FAILED" # no payload documented
---| "BN_CHAT_CHANNEL_INVITE_SUCCEEDED" # no payload documented
---| "BN_CHAT_CHANNEL_JOINED" # no payload documented
---| "BN_CHAT_CHANNEL_LEFT" # no payload documented
---| "BN_CHAT_CHANNEL_MEMBER_JOINED" # no payload documented
---| "BN_CHAT_CHANNEL_MEMBER_LEFT" # no payload documented
---| "BN_CHAT_CHANNEL_MEMBER_UPDATED" # no payload documented
---| "BN_CHAT_CHANNEL_MESSAGE_BLOCKED" # no payload documented
---| "BN_CHAT_CHANNEL_MESSAGE_UNDELIVERABLE" # no payload documented
---| "CHANNEL_COUNT_UPDATE" # id: number, count: number
---| "CHANNEL_FLAGS_UPDATED" # id: number
---| "CHANNEL_INVITE_REQUEST" # channelName: string, inviterName: string
---| "CHANNEL_PASSWORD_REQUEST" # channelName: string
---| "CHANNEL_ROSTER_UPDATE" # id: number
---| "CHANNEL_UI_UPDATE" # no payload documented
---| "CHANNEL_VOICE_UPDATE" # id: number, enabled: bool, active: bool
---| "CHAT_MSG_CHANNEL" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number, guid: WOWGUID
---| "CHAT_MSG_CHANNEL_JOIN" # unkown: string, sender: string, unknown: string, channelString: string, unknown: string, unknown: string, unknown: number, channelNumber: number, channelName: string, unknown: number, unknown: number
---| "CHAT_MSG_CHANNEL_LEAVE" # unkown: string, sender: string, unknown: string, channelString: string, unknown: string, unknown: string, unknown: number, channelNumber: number, channelName: string, unknown: number, unknown: number
---| "CHAT_MSG_CHANNEL_LIST" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_CHANNEL_NOTICE" # no payload documented
---| "CHAT_MSG_CHANNEL_NOTICE_USER" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "UNIT_SPELLCAST_CHANNEL_START" # unitID: UnitToken, spell: string, rank: string, lineID: number, spellID: spellID
---| "UNIT_SPELLCAST_CHANNEL_STOP" # unitID: UnitToken, spell: string, rank: string
---| "UNIT_SPELLCAST_CHANNEL_UPDATE" # unitID: UnitToken, spell: string, rank: string, lineID: number, spellID: spellID
---| "VOICE_CHANNEL_STATUS_UPDATE" # no payload documented
---| "BN_CHAT_WHISPER_UNDELIVERABLE" # no payload documented
---| "CHAT_MSG_ADDON" # prefix: string, message: string, channel: string, sender: string
---| "CHAT_MSG_AFK" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number, senderGUID: WOWGUID
---| "CHAT_MSG_BATTLEGROUND" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_BATTLEGROUND_LEADER" # message: string, author: string, language: string
---| "CHAT_MSG_BG_SYSTEM_ALLIANCE" # message: string
---| "CHAT_MSG_BG_SYSTEM_HORDE" # message: string
---| "CHAT_MSG_BG_SYSTEM_NEUTRAL" # message: string
---| "CHAT_MSG_BN_CONVERSATION" # message: string, sender: string, unknown: string, channelString: string, unknown: string, unknown: string, unknown: number, channelNumber: number, unknown: string, unknown: number, counter: number, unknown: string, presenceID: presenceID, unknown: bool
---| "CHAT_MSG_BN_CONVERSATION_LIST" # no payload documented
---| "CHAT_MSG_BN_CONVERSATION_NOTICE" # message/status: string, sender: string, unknown: string, channelString: string, unknown: string, unknown: string, unknown: number, channelNumber: number, unknown: string, unknown: number, counter: number, unknown: string, presenceID: presenceID, unknown: bool
---| "CHAT_MSG_BN_INLINE_TOAST_ALERT" # no payload documented
---| "CHAT_MSG_BN_INLINE_TOAST_BROADCAST" # message: string, sender: string, unknown: string, unknown: string, unknown: string, unknown: string, unknown: number, unknown: number, unknown: string, unknown: number, counter: number, unknown: string, presenceID: presenceID, unknown: bool
---| "CHAT_MSG_BN_INLINE_TOAST_BROADCAST_INFORM" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number, guid: WOWGUID
---| "CHAT_MSG_BN_INLINE_TOAST_CONVERSATION" # no payload documented
---| "CHAT_MSG_BN_WHISPER" # message: string, sender: string, unknown: string, unknown: string, unknown: string, unknown: string, unknown: number, unknown: number, unknown: string, unknown: number, counter: number, unknown: string, presenceID: presenceID, unknown: bool
---| "CHAT_MSG_BN_WHISPER_INFORM" # no payload documented
---| "CHAT_MSG_DND" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_EMOTE" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_FILTERED" # no payload documented
---| "CHAT_MSG_IGNORED" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_LOOT" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_MONSTER_EMOTE" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_MONSTER_SAY" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_MONSTER_WHISPER" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_MONSTER_YELL" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_OFFICER" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_OPENING" # no payload documented
---| "CHAT_MSG_PET_INFO" # no payload documented
---| "CHAT_MSG_RAID" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_RAID_BOSS_EMOTE" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_RAID_BOSS_WHISPER" # no payload documented
---| "CHAT_MSG_RAID_LEADER" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_RAID_WARNING" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_RESTRICTED" # no payload documented
---| "CHAT_MSG_SAY" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_SYSTEM" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_TARGETICONS" # no payload documented
---| "CHAT_MSG_TEXT_EMOTE" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_WHISPER" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number, guid: WOWGUID
---| "CHAT_MSG_WHISPER_INFORM" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_YELL" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "EXECUTE_CHAT_LINE" # no payload documented
---| "UPDATE_CHAT_COLOR" # type: string, red: number, green: number, blue: number
---| "UPDATE_CHAT_COLOR_NAME_BY_CLASS" # no payload documented
---| "UPDATE_CHAT_WINDOWS" # no payload documented
---| "UPDATE_FLOATING_CHAT_WINDOWS" # no payload documented
---| "CHAT_MSG_COMBAT_HONOR_GAIN" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_COMBAT_MISC_INFO" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_COMBAT_XP_GAIN" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "COMBAT_RATING_UPDATE" # no payload documented
---| "COMBAT_TEXT_UPDATE" # type: string, desc1: varies, desc2: varies
---| "PLAYER_ENTER_COMBAT" # no payload documented
---| "PLAYER_LEAVE_COMBAT" # no payload documented
---| "UNIT_COMBAT" # unitID: UnitToken, action: string, descriptor: string, damage: number, damageType: number
---| "COMBAT_LOG_EVENT" # no payload documented
---| "COMBAT_LOG_EVENT_UNFILTERED" # no payload documented
---| "COMMENTATOR_ENTER_WORLD" # no payload documented
---| "COMMENTATOR_MAP_UPDATE" # no payload documented
---| "COMMENTATOR_PLAYER_UPDATE" # no payload documented
---| "COMMENTATOR_SKIRMISH_MODE_REQUEST" # no payload documented
---| "COMMENTATOR_SKIRMISH_QUEUE_REQUEST" # no payload documented
---| "COMPANION_LEARNED" # no payload documented
---| "COMPANION_UNLEARNED" # no payload documented
---| "COMPANION_UPDATE" # no payload documented
---| "BAG_CLOSED" # bagID: number
---| "BAG_OPEN" # bagID: number
---| "BAG_UPDATE" # bagID: containerID
---| "BAG_UPDATE_COOLDOWN" # no payload documented
---| "CURRENCY_DISPLAY_UPDATE" # no payload documented
---| "CURSOR_UPDATE" # no payload documented
---| "CVAR_UPDATE" # glStr: string, value: string
---| "DUEL_FINISHED" # no payload documented
---| "DUEL_INBOUNDS" # no payload documented
---| "DUEL_OUTOFBOUNDS" # no payload documented
---| "AUTOEQUIP_BIND_CONFIRM" # slot: number
---| "EQUIPMENT_SETS_CHANGED" # no payload documented
---| "EQUIPMENT_SWAP_FINISHED" # no payload documented
---| "EQUIPMENT_SWAP_PENDING" # no payload documented
---| "CHAT_MSG_COMBAT_FACTION_CHANGE" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "UNIT_FACTION" # unitID: UnitToken
---| "UPDATE_FACTION" # no payload documented
---| "GLYPH_ADDED" # no payload documented
---| "GLYPH_DISABLED" # no payload documented
---| "GLYPH_ENABLED" # no payload documented
---| "GLYPH_REMOVED" # no payload documented
---| "GLYPH_UPDATED" # no payload documented
---| "USE_GLYPH" # no payload documented
---| "GMSURVEY_DISPLAY" # no payload documented
---| "GUILDBANKBAGSLOTS_CHANGED" # no payload documented
---| "GUILDBANKFRAME_CLOSED" # no payload documented
---| "GUILDBANKFRAME_OPENED" # no payload documented
---| "GUILDBANKLOG_UPDATE" # no payload documented
---| "GUILDBANK_ITEM_LOCK_CHANGED" # no payload documented
---| "GUILDBANK_TEXT_CHANGED" # no payload documented
---| "GUILDBANK_UPDATE_MONEY" # no payload documented
---| "GUILDBANK_UPDATE_TABS" # no payload documented
---| "GUILDBANK_UPDATE_TEXT" # no payload documented
---| "GUILDBANK_UPDATE_WITHDRAWMONEY" # no payload documented
---| "CHAT_MSG_GUILD" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "GUILDTABARD_UPDATE" # no payload documented
---| "GUILD_EVENT_LOG_UPDATE" # no payload documented
---| "GUILD_INVITE_CANCEL" # no payload documented
---| "GUILD_INVITE_REQUEST" # from: string, guildname: string
---| "GUILD_MOTD" # message: string
---| "GUILD_REGISTRAR_CLOSED" # no payload documented
---| "GUILD_REGISTRAR_SHOW" # no payload documented
---| "GUILD_ROSTER_UPDATE" # update: bool
---| "PLAYER_GUILD_UPDATE" # unitID: UnitToken
---| "CINEMATIC_START" # no payload documented
---| "CINEMATIC_STOP" # no payload documented
---| "MOVIE_COMPRESSING_PROGRESS" # no payload documented
---| "MOVIE_RECORDING_PROGRESS" # no payload documented
---| "MOVIE_UNCOMPRESSED_MOVIE" # filename: string
---| "INSPECT_HONOR_UPDATE" # no payload documented
---| "INSPECT_TALENT_READY" # no payload documented
---| "CORPSE_IN_INSTANCE" # no payload documented
---| "INSTANCE_BOOT_START" # no payload documented
---| "INSTANCE_BOOT_STOP" # no payload documented
---| "INSTANCE_ENCOUNTER_ENGAGE_UNIT" # no payload documented
---| "INSTANCE_LOCK_START" # no payload documented
---| "INSTANCE_LOCK_STOP" # no payload documented
---| "RAID_INSTANCE_WELCOME" # name: string, ttl: number
---| "UPDATE_INSTANCE_INFO" # no payload documented
---| "UNIT_INVENTORY_CHANGED" # unitID: UnitToken
---| "UPDATE_INVENTORY_ALERTS" # no payload documented
---| "UPDATE_INVENTORY_DURABILITY" # no payload documented
---| "CLOSE_INBOX_ITEM" # id: number
---| "DELETE_ITEM_CONFIRM" # itemName: string, itemQuality: number
---| "ITEM_LOCKED" # no payload documented
---| "ITEM_LOCK_CHANGED" # no payload documented
---| "ITEM_PUSH" # bagID: number, icon: string
---| "ITEM_UNLOCKED" # no payload documented
---| "MAIL_LOCK_SEND_ITEMS" # no payload documented
---| "MAIL_UNLOCK_SEND_ITEMS" # no payload documented
---| "ITEM_TEXT_BEGIN" # no payload documented
---| "ITEM_TEXT_CLOSED" # no payload documented
---| "ITEM_TEXT_READY" # no payload documented
---| "ITEM_TEXT_TRANSLATION" # maxvalue: number
---| "KNOWLEDGE_BASE_ARTICLE_LOAD_FAILURE" # no payload documented
---| "KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS" # no payload documented
---| "KNOWLEDGE_BASE_QUERY_LOAD_FAILURE" # no payload documented
---| "KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS" # no payload documented
---| "KNOWLEDGE_BASE_SERVER_MESSAGE" # no payload documented
---| "KNOWLEDGE_BASE_SETUP_LOAD_FAILURE" # no payload documented
---| "KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS" # no payload documented
---| "KNOWLEDGE_BASE_SYSTEM_MOTD_UPDATED" # no payload documented
---| "BILLING_NAG_DIALOG" # remaining: number
---| "LFG_BOOT_PROPOSAL_UPDATE" # no payload documented
---| "LFG_COMPLETION_REWARD" # no payload documented
---| "LFG_LOCK_INFO_RECEIVED" # no payload documented
---| "LFG_OFFER_CONTINUE" # no payload documented
---| "LFG_OPEN_FROM_GOSSIP" # no payload documented
---| "LFG_PROPOSAL_FAILED" # no payload documented
---| "LFG_PROPOSAL_SHOW" # no payload documented
---| "LFG_PROPOSAL_SUCCEEDED" # no payload documented
---| "LFG_PROPOSAL_UPDATE" # no payload documented
---| "LFG_QUEUE_STATUS_UPDATE" # no payload documented
---| "LFG_ROLE_CHECK_HIDE" # no payload documented
---| "LFG_ROLE_CHECK_ROLE_CHOSEN" # no payload documented
---| "LFG_ROLE_CHECK_SHOW" # no payload documented
---| "LFG_ROLE_CHECK_UPDATE" # no payload documented
---| "LFG_ROLE_UPDATE" # no payload documented
---| "LFG_UPDATE" # no payload documented
---| "LFG_UPDATE_RANDOM_INFO" # no payload documented
---| "CANCEL_LOOT_ROLL" # rollID: number
---| "CONFIRM_LOOT_ROLL" # id: number, rolltype: number
---| "LOOT_BIND_CONFIRM" # slotID: number
---| "LOOT_CLOSED" # no payload documented
---| "LOOT_OPENED" # autoLoot: bool
---| "LOOT_SLOT_CHANGED" # no payload documented
---| "LOOT_SLOT_CLEARED" # slotID: number
---| "OPEN_MASTER_LOOT_LIST" # no payload documented
---| "START_LOOT_ROLL" # id: number, time: time_t
---| "UPDATE_MASTER_LOOT_LIST" # no payload documented
---| "UPDATE_MACROS" # no payload documented
---| "MAIL_CLOSED" # no payload documented
---| "MAIL_FAILED" # no payload documented
---| "MAIL_INBOX_UPDATE" # no payload documented
---| "MAIL_SEND_INFO_UPDATE" # no payload documented
---| "MAIL_SEND_SUCCESS" # no payload documented
---| "MAIL_SHOW" # no payload documented
---| "MAIL_SUCCESS" # no payload documented
---| "SEND_MAIL_COD_CHANGED" # no payload documented
---| "UPDATE_PENDING_MAIL" # no payload documented
---| "CLOSE_WORLD_MAP" # no payload documented
---| "MINIMAP_PING" # unit: UnitToken, x: number, y: number
---| "MINIMAP_UPDATE_ZOOM" # no payload documented
---| "TAXIMAP_CLOSED" # no payload documented
---| "TAXIMAP_OPENED" # no payload documented
---| "WORLD_MAP_NAME_UPDATE" # no payload documented
---| "WORLD_MAP_UPDATE" # no payload documented
---| "MERCHANT_CLOSED" # no payload documented
---| "MERCHANT_SHOW" # no payload documented
---| "MERCHANT_UPDATE" # no payload documented
---| "MINIGAME_UPDATE" # no payload documented
---| "START_MINIGAME" # no payload documented
---| "CHAT_MSG_MONEY" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "PLAYER_MONEY" # no payload documented
---| "PLAYER_TRADE_MONEY" # no payload documented
---| "SEND_MAIL_MONEY_CHANGED" # no payload documented
---| "TRADE_MONEY_CHANGED" # no payload documented
---| "AUTOFOLLOW_BEGIN" # following: number
---| "AUTOFOLLOW_END" # no payload documented
---| "GOSSIP_CLOSED" # no payload documented
---| "GOSSIP_CONFIRM" # index: luaIndex, message: string, cost: number
---| "GOSSIP_CONFIRM_CANCEL" # no payload documented
---| "GOSSIP_ENTER_CODE" # id: number
---| "GOSSIP_SHOW" # no payload documented
---| "CHAT_MSG_MONSTER_PARTY" # no payload documented
---| "CHAT_MSG_PARTY" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "CHAT_MSG_PARTY_LEADER" # no payload documented
---| "PARTY_CONVERTED_TO_RAID" # no payload documented
---| "PARTY_INVITE_CANCEL" # no payload documented
---| "PARTY_INVITE_REQUEST" # sender: string
---| "PARTY_LEADER_CHANGED" # no payload documented
---| "PARTY_LFG_RESTRICTED" # no payload documented
---| "PARTY_LOOT_METHOD_CHANGED" # no payload documented
---| "PARTY_MEMBERS_CHANGED" # no payload documented
---| "PARTY_MEMBER_DISABLE" # id: number
---| "PARTY_MEMBER_ENABLE" # id: number
---| "READY_CHECK" # name: string
---| "READY_CHECK_CONFIRM" # id: number, response: bool
---| "READY_CHECK_FINISHED" # no payload documented
---| "LOCALPLAYER_PET_RENAMED" # no payload documented
---| "PET_ATTACK_START" # no payload documented
---| "PET_ATTACK_STOP" # no payload documented
---| "PET_BAR_HIDE" # no payload documented
---| "PET_BAR_HIDEGRID" # no payload documented
---| "PET_BAR_SHOWGRID" # no payload documented
---| "PET_BAR_UPDATE" # no payload documented
---| "PET_BAR_UPDATE_COOLDOWN" # no payload documented
---| "PET_BAR_UPDATE_USABLE" # no payload documented
---| "PET_DISMISS_START" # no payload documented
---| "PET_FORCE_NAME_DECLENSION" # no payload documented
---| "PET_RENAMEABLE" # no payload documented
---| "PET_UI_CLOSE" # no payload documented
---| "PET_UI_UPDATE" # no payload documented
---| "PET_STABLE_CLOSED" # no payload documented
---| "PET_STABLE_SHOW" # no payload documented
---| "PET_STABLE_UPDATE" # no payload documented
---| "PET_STABLE_UPDATE_PAPERDOLL" # no payload documented
---| "PETITION_CLOSED" # no payload documented
---| "PETITION_SHOW" # no payload documented
---| "PETITION_VENDOR_CLOSED" # no payload documented
---| "PETITION_VENDOR_SHOW" # no payload documented
---| "PETITION_VENDOR_UPDATE" # no payload documented
---| "CHARACTER_POINTS_CHANGED" # count: number, levels: number
---| "PLAYER_ALIVE" # no payload documented
---| "PLAYER_AURAS_CHANGED" # no payload documented
---| "PLAYER_CAMPING" # no payload documented
---| "PLAYER_CONTROL_GAINED" # no payload documented
---| "PLAYER_CONTROL_LOST" # no payload documented
---| "PLAYER_DAMAGE_DONE_MODS" # unit: UnitToken
---| "PLAYER_DEAD" # no payload documented
---| "PLAYER_DIFFICULTY_CHANGED" # no payload documented
---| "PLAYER_ENTERING_BATTLEGROUND" # no payload documented
---| "PLAYER_ENTERING_WORLD" # no payload documented
---| "PLAYER_EQUIPMENT_CHANGED" # slot: inventoryID, hasItem: 1nil
---| "PLAYER_FARSIGHT_FOCUS_CHANGED" # no payload documented
---| "PLAYER_FLAGS_CHANGED" # unitID: UnitToken
---| "PLAYER_FOCUS_CHANGED" # no payload documented
---| "PLAYER_LEAVING_WORLD" # no payload documented
---| "PLAYER_LEVEL_UP" # level: string, hp: number, mp: number, talentPoints: number, strength: number, agility: number, stamina: number, intellect: number, spirit: number
---| "PLAYER_LOGIN" # no payload documented
---| "PLAYER_LOGOUT" # no payload documented
---| "PLAYER_QUITING" # no payload documented
---| "PLAYER_REGEN_DISABLED" # no payload documented
---| "PLAYER_REGEN_ENABLED" # no payload documented
---| "PLAYER_ROLES_ASSIGNED" # no payload documented
---| "PLAYER_SKINNED" # no payload documented
---| "PLAYER_TARGET_CHANGED" # no payload documented
---| "PLAYER_TOTEM_UPDATE" # no payload documented
---| "PLAYER_UNGHOST" # no payload documented
---| "PLAYER_UPDATE_RESTING" # no payload documented
---| "PLAYER_XP_UPDATE" # no payload documented
---| "NPC_PVPQUEUE_ANYWHERE" # no payload documented
---| "PLAYER_PVP_KILLS_CHANGED" # no payload documented
---| "PLAYER_PVP_RANK_CHANGED" # no payload documented
---| "PVPQUEUE_ANYWHERE_SHOW" # no payload documented
---| "PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE" # no payload documented
---| "BN_REQUEST_FOF_FAILED" # no payload documented
---| "BN_REQUEST_FOF_SUCCEEDED" # no payload documented
---| "DUEL_REQUESTED" # challenger: string
---| "QUEST_ACCEPTED" # questIndex: luaIndex
---| "QUEST_ACCEPT_CONFIRM" # name: string, quest: string
---| "QUEST_COMPLETE" # no payload documented
---| "QUEST_DETAIL" # no payload documented
---| "QUEST_FINISHED" # no payload documented
---| "QUEST_GREETING" # no payload documented
---| "QUEST_ITEM_UPDATE" # no payload documented
---| "QUEST_LOG_UPDATE" # no payload documented
---| "QUEST_POI_UPDATE" # no payload documented
---| "QUEST_PROGRESS" # no payload documented
---| "QUEST_QUERY_COMPLETE" # no payload documented
---| "QUEST_WATCH_UPDATE" # questIndex: luaIndex
---| "RESURRECT_REQUEST" # name: string
---| "TRADE_REQUEST" # no payload documented
---| "TRADE_REQUEST_CANCEL" # no payload documented
---| "UNIT_QUEST_LOG_CHANGED" # unitID: UnitToken
---| "DISABLE_LOW_LEVEL_RAID" # no payload documented
---| "ENABLE_LOW_LEVEL_RAID" # no payload documented
---| "RAID_ROSTER_UPDATE" # no payload documented
---| "RAID_TARGET_UPDATE" # no payload documented
---| "CHAT_MSG_SKILL" # message: string, sender: string, language: string, channelString: string, target: string, flags: string, unknown: number, channelNumber: number, channelName: string, unknown: number, counter: number
---| "SKILL_LINES_CHANGED" # no payload documented
---| "SOCKET_INFO_CLOSE" # no payload documented
---| "SOCKET_INFO_UPDATE" # no payload documented
---| "SOUND_DEVICE_UPDATE" # no payload documented
---| "CURRENT_SPELL_CAST_CHANGED" # no payload documented
---| "LEARNED_SPELL_IN_TAB" # spellID: number, tabID: number
---| "PET_SPELL_POWER_UPDATE" # no payload documented
---| "SPELLS_CHANGED" # no payload documented
---| "SPELL_UPDATE_COOLDOWN" # no payload documented
---| "SPELL_UPDATE_USABLE" # no payload documented
---| "START_AUTOREPEAT_SPELL" # no payload documented
---| "STOP_AUTOREPEAT_SPELL" # no payload documented
---| "UNIT_SPELLCAST_DELAYED" # unitID: UnitToken, spell: string, rank: string
---| "UNIT_SPELLCAST_FAILED" # unitID: UnitToken, spell: string, rank: string, unknownid: number, spellid: blizzid
---| "UNIT_SPELLCAST_FAILED_QUIET" # unitID: UnitToken, spell: string, rank: string
---| "UNIT_SPELLCAST_INTERRUPTED" # unitID: UnitToken, spell: string, rank: string, lineID: number, spellID: spellID
---| "UNIT_SPELLCAST_INTERRUPTIBLE" # unitID: UnitToken
---| "UNIT_SPELLCAST_NOT_INTERRUPTIBLE" # unitID: UnitToken
---| "UNIT_SPELLCAST_SENT" # unitID: UnitToken, spell: string, rank: string, target: string, lineID: number
---| "UNIT_SPELLCAST_START" # unitID: UnitToken, spell: string, rank: string, lineID: number, spellID: spellID
---| "UNIT_SPELLCAST_STOP" # unitID: UnitToken, spell: string, rank: string, lineID: number, spellID: spellID
---| "UNIT_SPELLCAST_SUCCEEDED" # unitID: UnitToken, spell: string, rank: string, ?: number, spellID: number
---| "KNOWN_CURRENCY_TYPES_UPDATE" # currencyType: string, count: number
---| "ACTIVE_TALENT_GROUP_CHANGED" # no payload documented
---| "CONFIRM_TALENT_WIPE" # cost: number
---| "PET_TALENT_UPDATE" # no payload documented
---| "PLAYER_TALENT_UPDATE" # no payload documented
---| "PREVIEW_PET_TALENT_POINTS_CHANGED" # no payload documented
---| "PREVIEW_TALENT_POINTS_CHANGED" # no payload documented
---| "TALENTS_INVOLUNTARILY_RESET" # no payload documented
---| "UNIT_THREAT_LIST_UPDATE" # no payload documented
---| "UNIT_THREAT_SITUATION_UPDATE" # no payload documented
---| "MINIMAP_UPDATE_TRACKING" # no payload documented
---| "END_BOUND_TRADEABLE" # no payload documented
---| "TRADE_ACCEPT_UPDATE" # player: number, target: number
---| "TRADE_CLOSED" # no payload documented
---| "TRADE_PLAYER_ITEM_CHANGED" # slotID: number
---| "TRADE_POTENTIAL_BIND_ENCHANT" # no payload documented
---| "TRADE_REPLACE_ENCHANT" # current: string, new: string
---| "TRADE_SHOW" # no payload documented
---| "TRADE_TARGET_ITEM_CHANGED" # slotID: number
---| "TRADE_UPDATE" # no payload documented
---| "CHAT_MSG_TRADESKILLS" # no payload documented
---| "TRADE_SKILL_CLOSE" # no payload documented
---| "TRADE_SKILL_FILTER_UPDATE" # no payload documented
---| "TRADE_SKILL_SHOW" # no payload documented
---| "TRADE_SKILL_UPDATE" # no payload documented
---| "UPDATE_TRADESKILL_RECAST" # no payload documented
---| "TRAINER_CLOSED" # no payload documented
---| "TRAINER_DESCRIPTION_UPDATE" # no payload documented
---| "TRAINER_SHOW" # no payload documented
---| "TRAINER_UPDATE" # no payload documented
---| "TUTORIAL_TRIGGER" # id: number
---| "MIRROR_TIMER_PAUSE" # duration: time_t
---| "MIRROR_TIMER_START" # name: string, value: number, maxvalue: number, step: number, pause: number, label: string
---| "MIRROR_TIMER_STOP" # name: string
---| "TABARD_CANSAVE_CHANGED" # no payload documented
---| "TABARD_SAVE_PENDING" # no payload documented
---| "UI_ERROR_MESSAGE" # message: string
---| "UI_INFO_MESSAGE" # message: string
---| "BIND_ENCHANT" # no payload documented
---| "CONFIRM_BINDER" # newHome: string
---| "CONFIRM_DISENCHANT_ROLL" # no payload documented
---| "CONFIRM_SUMMON" # no payload documented
---| "CONFIRM_XP_LOSS" # no payload documented
---| "CORPSE_IN_RANGE" # no payload documented
---| "CORPSE_OUT_OF_RANGE" # no payload documented
---| "DISABLE_TAXI_BENCHMARK" # no payload documented
---| "DISABLE_XP_GAIN" # no payload documented
---| "ENABLE_TAXI_BENCHMARK" # no payload documented
---| "ENABLE_XP_GAIN" # no payload documented
---| "RUNE_POWER_UPDATE" # runeIndex: luaIndex, isEnergize: string
---| "RUNE_TYPE_UPDATE" # runeIndex: luaIndex
---| "SCREENSHOT_FAILED" # no payload documented
---| "SCREENSHOT_SUCCEEDED" # no payload documented
---| "UPDATE_BINDINGS" # no payload documented
---| "UPDATE_EXHAUSTION" # no payload documented
---| "UPDATE_GM_STATUS" # avilable: number
---| "UPDATE_LFG_LIST" # no payload documented
---| "UPDATE_LFG_LIST_INCREMENTAL" # no payload documented
---| "UPDATE_LFG_TYPES" # no payload documented
---| "UPDATE_SHAPESHIFT_COOLDOWN" # no payload documented
---| "UPDATE_SHAPESHIFT_FORM" # no payload documented
---| "UPDATE_SHAPESHIFT_FORMS" # no payload documented
---| "UPDATE_SHAPESHIFT_USABLE" # no payload documented
---| "UPDATE_STEALTH" # no payload documented
---| "UPDATE_TICKET" # no payload documented
---| "UPDATE_WORLD_STATES" # no payload documented
---| "HONOR_CURRENCY_UPDATE" # honorChange: number
---| "CANCEL_SUMMON" # no payload documented
---| "CLOSE_TABARD_FRAME" # no payload documented
---| "CRITERIA_UPDATE" # no payload documented
---| "DISPLAY_SIZE_CHANGED" # no payload documented
---| "END_REFUND" # no payload documented
---| "EQUIP_BIND_CONFIRM" # slot: number
---| "FRIENDLIST_UPDATE" # no payload documented
---| "GMRESPONSE_RECEIVED" # no payload documented
---| "GM_PLAYER_INFO" # no payload documented
---| "IGNORELIST_UPDATE" # no payload documented
---| "IGR_BILLING_NAG_DIALOG" # no payload documented
---| "KNOWN_TITLES_UPDATE" # no payload documented
---| "LANGUAGE_LIST_CHANGED" # no payload documented
---| "LEVEL_GRANT_PROPOSED" # no payload documented
---| "LOGOUT_CANCEL" # no payload documented
---| "MODIFIER_STATE_CHANGED" # key: string, state: number
---| "MUTELIST_UPDATE" # no payload documented
---| "NEW_TITLE_EARNED" # title: string
---| "OLD_TITLE_LOST" # title: string
---| "OPEN_TABARD_FRAME" # no payload documented
---| "PLAYTIME_CHANGED" # no payload documented
---| "PLAY_MOVIE" # no payload documented
---| "RAISED_AS_GHOUL" # no payload documented
---| "REPLACE_ENCHANT" # current: string, new: string
---| "SYNCHRONIZE_SETTINGS" # no payload documented
---| "TIME_PLAYED_MSG" # total: number, level: number
---| "USE_BIND_CONFIRM" # no payload documented
---| "VARIABLES_LOADED" # no payload documented
---| "VOTE_KICK_REASON_NEEDED" # no payload documented
---| "WEAR_EQUIPMENT_SET" # no payload documented
---| "WHO_LIST_UPDATE" # no payload documented
---| "WORLD_STATE_UI_TIMER_UPDATE" # no payload documented
---| "WOW_MOUSE_NOT_FOUND" # no payload documented
---| "UNIT_ATTACK" # unitID: UnitToken
---| "UNIT_ATTACK_POWER" # unitID: UnitToken
---| "UNIT_ATTACK_SPEED" # unitID: UnitToken
---| "UNIT_AURA" # unitID: UnitToken
---| "UNIT_CLASSIFICATION_CHANGED" # unitID: UnitToken
---| "UNIT_COMBO_POINTS" # no payload documented
---| "UNIT_DAMAGE" # unitID: UnitToken
---| "UNIT_DEFENSE" # unitID: UnitToken
---| "UNIT_DISPLAYPOWER" # unitID: UnitToken
---| "UNIT_DYNAMIC_FLAGS" # no payload documented
---| "UNIT_FLAGS" # unit: UnitToken
---| "UNIT_HEALTH" # unitID: UnitToken
---| "UNIT_LEVEL" # unitID: UnitToken
---| "UNIT_MANA" # unitID: UnitToken
---| "UNIT_MAXHEALTH" # unitID: UnitToken
---| "UNIT_MODEL_CHANGED" # unitID: UnitToken
---| "UNIT_NAME_UPDATE" # unitID: UnitToken
---| "UNIT_PET" # unitID: UnitToken
---| "UNIT_PET_EXPERIENCE" # no payload documented
---| "UNIT_PORTRAIT_UPDATE" # unitID: UnitToken
---| "UNIT_RAGE" # unitID: UnitToken
---| "UNIT_RANGEDDAMAGE" # unitID: UnitToken
---| "UNIT_RANGED_ATTACK_POWER" # unitID: UnitToken
---| "UNIT_RESISTANCES" # unitID: UnitToken
---| "UNIT_STATS" # unitID: UnitToken
---| "UNIT_TARGET" # unitID: UnitToken
---| "UPDATE_MOUSEOVER_UNIT" # no payload documented
---| "UNIT_ENERGY" # unitTarget: string
---| "UNIT_EXITED_VEHICLE" # unitTarget: string
---| "UNIT_FOCUS" # unitTarget: string
---| "UNIT_HAPPINESS" # unitTarget: string
---| "UNIT_MAXENERGY" # unitTarget: string
---| "UNIT_MAXFOCUS" # unitTarget: string
---| "UNIT_MAXHAPPINESS" # unitTarget: string
---| "UNIT_MAXMANA" # unitTarget: string
---| "UNIT_MAXRAGE" # unitTarget: string
---| "UNIT_MAXRUNIC_POWER" # unitTarget: string
---| "UNIT_RUNIC_POWER" # unitTarget: string
---| "PLAYER_GAINS_VEHICLE_DATA" # no payload documented
---| "PLAYER_LOSES_VEHICLE_DATA" # no payload documented
---| "UNIT_ENTERED_VEHICLE" # no payload documented
---| "UNIT_ENTERING_VEHICLE" # no payload documented
---| "UNIT_EXITING_VEHICLE" # no payload documented
---| "VEHICLE_ANGLE_SHOW" # no payload documented
---| "VEHICLE_ANGLE_UPDATE" # no payload documented
---| "VEHICLE_PASSENGERS_CHANGED" # no payload documented
---| "VEHICLE_POWER_SHOW" # no payload documented
---| "VEHICLE_UPDATE" # no payload documented
---| "VOICE_CHAT_ENABLED_UPDATE" # no payload documented
---| "VOICE_LEFT_SESSION" # no payload documented
---| "VOICE_PLATE_START" # name: string, unit: UnitToken
---| "VOICE_PLATE_STOP" # name: string, unit: UnitToken
---| "VOICE_PUSH_TO_TALK_START" # no payload documented
---| "VOICE_PUSH_TO_TALK_STOP" # no payload documented
---| "VOICE_SELF_MUTE" # no payload documented
---| "VOICE_SESSIONS_UPDATE" # no payload documented
---| "VOICE_START" # unit: UnitToken
---| "VOICE_STATUS_UPDATE" # no payload documented
---| "VOICE_STOP" # unit: UnitToken
---| "AREA_SPIRIT_HEALER_IN_RANGE" # no payload documented
---| "AREA_SPIRIT_HEALER_OUT_OF_RANGE" # no payload documented
---| "ZONE_CHANGED" # no payload documented
---| "ZONE_CHANGED_INDOORS" # no payload documented
---| "ZONE_CHANGED_NEW_AREA" # no payload documented

---@alias WotLKCVar
---| "accountList" # General; default: 
---| "accountName" # General; default: 
---| "accounttype" # General; default: 
---| "advancedWatchFrame" # General; default: 0
---| "advancedWorldMap" # General; default: 0
---| "AllowMultisampleFBO" # General; default: 1
---| "alwaysCompareItems" # General; default: 0
---| "alwaysShowActionBars" # General; default: 0
---| "assistAttack" # General; default: 0
---| "asyncHandlerTimeout" # General; default: 100
---| "asyncThreadSleep" # General; default: 0
---| "auctionDisplayOnCharacter" # General; default: 0
---| "autoClearAFK" # General; default: 1
---| "autoCompleteResortNamesOnRecency" # General; default: 1
---| "autoCompleteUseContext" # General; default: 1
---| "autoCompleteWhenEditingFromCenter" # General; default: 1
---| "autoDismount" # General; default: 1
---| "autoDismountFlying" # General; default: 0
---| "autoFilledMultiCastSlots" # General; default: 0
---| "autoInteract" # General; default: 0
---| "autojoinBGVoice" # General; default: 0
---| "autojoinPartyVoice" # General; default: 1
---| "autoLootDefault" # General; default: 0
---| "autoQuestProgress" # General; default: 1
---| "autoQuestWatch" # General; default: 1
---| "autoRangedCombat" # General; default: 1
---| "autoSelfCast" # General; default: 1
---| "autoStand" # General; default: 1
---| "autoUnshift" # General; default: 1
---| "baseMip" # General; default: 0
---| "blockTrades" # General; default: 0
---| "BlockTrades" # General; default: 0
---| "bspcache" # General; default: 1
---| "buffDurations" # General; default: 1
---| "calendarShowBattlegrounds" # General; default: 0
---| "calendarShowDarkmoon" # General; default: 1
---| "calendarShowLockouts" # General; default: 1
---| "calendarShowResets" # General; default: 0
---| "calendarShowWeeklyHolidays" # General; default: 1
---| "cameraBobbing" # Camera; default: 0
---| "cameraBobbingSmoothSpeed" # Camera; default: 0.8
---| "cameraCustomViewSmoothing" # Camera; default: 0
---| "cameraDistanceMax" # Camera; default: 15.0
---| "cameraDistanceMaxFactor" # Camera; default: 1.0
---| "cameraDistanceMoveSpeed" # Camera; default: 8.33
---| "cameraDistanceSmoothSpeed" # Camera; default: 8.33
---| "cameraDive" # Camera; default: 1
---| "cameraFlyingMountHeightSmoothSpeed" # Camera; default: 2.0
---| "cameraFoVSmoothSpeed" # Camera; default: 0.5
---| "cameraGroundSmoothSpeed" # Camera; default: 7.5
---| "cameraHeightIgnoreStandState" # Camera; default: 0
---| "cameraHeightSmoothSpeed" # Camera; default: 1.2
---| "cameraPitchMoveSpeed" # Camera; default: 90
---| "cameraPitchSmoothMax" # Camera; default: 30.0
---| "cameraPitchSmoothMin" # Camera; default: 0.0
---| "cameraPitchSmoothSpeed" # Camera; default: 45
---| "cameraPivot" # Camera; default: 1
---| "cameraPivotDXMax" # Camera; default: 0.05
---| "cameraPivotDYMin" # Camera; default: 0.00
---| "cameraSavedDistance" # Camera; default: 5.55
---| "cameraSavedPitch" # Camera; default: 10.0
---| "cameraSavedVehicleDistance" # Camera; default: -1.0
---| "camerasmooth" # Camera; default: 1
---| "cameraSmooth" # Camera; default: 1
---| "cameraSmoothPitch" # Camera; default: 1
---| "cameraSmoothStyle" # Camera; default: 4
---| "cameraSmoothTimeMax" # Camera; default: 2.0
---| "cameraSmoothTimeMin" # Camera; default: 0.1
---| "cameraSmoothTrackingStyle" # Camera; default: 4
---| "cameraSmoothYaw" # Camera; default: 1
---| "cameraSubmergeFinalPitch" # Camera; default: 5.0
---| "cameraSubmergePitch" # Camera; default: 18.0
---| "cameraSurfaceFinalPitch" # Camera; default: 5.0
---| "cameraSurfacePitch" # Camera; default: 0.0
---| "cameraTargetSmoothSpeed" # Camera; default: 90
---| "cameraTerrainTilt" # Camera; default: 0
---| "cameraTerrainTiltTimeMax" # Camera; default: 10.0
---| "cameraTerrainTiltTimeMin" # Camera; default: 3.0
---| "cameraView" # Camera; default: 2
---| "cameraViewBlendStyle" # Camera; default: 1
---| "cameraWaterCollision" # Camera; default: 1
---| "cameraYawMoveSpeed" # Camera; default: 180
---| "cameraYawSmoothMax" # Camera; default: 0.0
---| "cameraYawSmoothMin" # Camera; default: 0.0
---| "cameraYawSmoothSpeed" # Camera; default: 180
---| "ChatAmbienceVolume" # Chat; default: 0.3
---| "chatBubbles" # Chat; default: 1
---| "chatBubblesParty" # Chat; default: 1
---| "chatLocked" # Chat; default: 0
---| "ChatMusicVolume" # Chat; default: 0.3
---| "ChatSoundVolume" # Chat; default: 0.4
---| "checkAddonVersion" # General; default: 1
---| "CinematicJoystick" # General; default: 0
---| "colorblindMode" # General; default: 0
---| "colorChatNamesByClass" # General; default: 0
---| "CombatDamage" # Combat; default: 1
---| "CombatHealing" # Combat; default: 1
---| "combatLogOn" # Combat; default: 1
---| "CombatLogPeriodicSpells" # Combat; default: 1
---| "combatLogRetentionTime" # Combat; default: 300
---| "combatTextFloatMode" # Combat; default: 1
---| "componentCompress" # General; default: 1
---| "componentTextureLevel" # General; default: 8
---| "componentThread" # General; default: 1
---| "consolidateBuffs" # General; default: 0
---| "dbCompress" # General; default: -1
---| "decorateAccountName" # General; default: 0
---| "deselectOnClick" # General; default: 1
---| "DesktopGamma" # General; default: 0
---| "displayFreeBagSlots" # Interface; default: 0
---| "displayWorldPVPObjectives" # Interface; default: 1
---| "dontShowEquipmentSetsOnItems" # General; default: 0
---| "enableCombatText" # General; default: 1
---| "EnableMicrophone" # General; default: 1
---| "EnableMultiTouch" # General; default: 0
---| "enablePVPNotifyAFK" # General; default: 1
---| "EnableVoiceChat" # General; default: 0
---| "enableWowMouse" # General; default: 0
---| "environmentDetail" # General; default: 1.0
---| "equipmentManager" # General; default: 0
---| "ErrorFilter" # General; default: all
---| "ErrorLevelMax" # General; default: 3
---| "ErrorLevelMin" # General; default: 2
---| "errors" # General; default: 0
---| "Errors" # General; default: 0
---| "ERRORS" # General; default: 0
---| "expansionMovie" # General; default: 1
---| "extShadowQuality" # General; default: 0
---| "farclip" # General; default: 350
---| "farClipOverride" # General; default: 0
---| "fctAllSpellMechanics" # General; default: 0
---| "fctAuras" # General; default: 0
---| "fctCombatState" # General; default: 0
---| "fctComboPoints" # General; default: 0
---| "fctDamageReduction" # General; default: 0
---| "fctDodgeParryMiss" # General; default: 0
---| "fctEnergyGains" # General; default: 0
---| "fctFriendlyHealers" # General; default: 0
---| "fctHonorGains" # General; default: 0
---| "fctLowManaHealth" # General; default: 1
---| "fctPeriodicEnergyGains" # General; default: 0
---| "fctReactives" # General; default: 0
---| "fctRepChanges" # General; default: 0
---| "fctSpellMechanics" # General; default: 0
---| "fctSpellMechanicsOther" # General; default: 0
---| "ffxDeath" # General; default: 1
---| "FFXDeath" # General; default: 1
---| "ffxGlow" # General; default: 1
---| "FFXGlow" # General; default: 1
---| "ffxNetherWorld" # General; default: 1
---| "ffxRectangle" # General; default: 1
---| "ffxSpecial" # General; default: 1
---| "fixedFunction" # General; default: 0
---| "FixVBOBug" # General; default: -1
---| "flaggedTutorials" # General; default: 
---| "footstepBias" # General; default: 0.125
---| "FootstepSounds" # General; default: 1
---| "forceEnglishNames" # General; default: 0
---| "fullSizeFocusFrame" # General; default: 0
---| "g_accountUsesToken" # General; default: 0
---| "gameTip" # General; default: 0
---| "gamma" # General; default: 1.0
---| "Gamma" # General; default: 1.0
---| "GLFaster" # General; default: 1
---| "groundEffectDensity" # General; default: 16
---| "groundEffectDist" # General; default: 70.0
---| "guildMemberNotify" # General; default: 0
---| "guildRecruitmentChannel" # General; default: 1
---| "guildShowOffline" # General; default: 1
---| "gxApi" # Graphics; default: OpenGL
---| "gxAspect" # Graphics; default: 1
---| "gxColorBits" # Graphics; default: 24
---| "gxCursor" # Graphics; default: 1
---| "gxDepthBits" # Graphics; default: 24
---| "gxFixLag" # Graphics; default: 1
---| "gxMaximize" # Graphics; default: 0
---| "gxMultisample" # Graphics; default: 1
---| "gxMultisampleQuality" # Graphics; default: 0.0
---| "gxoverride" # Graphics; default: 
---| "gxOverride" # Graphics; default: 
---| "gxRefresh" # Graphics; default: 75
---| "gxResolution" # Graphics; default: 1440x900
---| "gxStereoConvergence" # Graphics; default: 1
---| "gxStereoEnabled" # Graphics; default: 0
---| "gxStereoSeparation" # Graphics; default: 25
---| "gxTextureCacheSize" # Graphics; default: 0
---| "gxTripleBuffer" # Graphics; default: 0
---| "gxVSync" # Graphics; default: 1
---| "gxWindow" # Graphics; default: 0
---| "heapAllocTracking" # General; default: 1
---| "hidePartyInRaid" # General; default: 0
---| "horizonFarclipScale" # General; default: 4.0
---| "horizonNearclipScale" # General; default: 0.7
---| "hwdetect" # General; default: 1
---| "hwDetect" # General; default: 1
---| "hwPCF" # General; default: 1
---| "InboundChatVolume" # General; default: 1.0
---| "iTunesRemoteFeedback" # General; default: 1
---| "iTunesTrackDisplay" # General; default: 0
---| "joystick" # General; default: 0
---| "Joystick" # General; default: 0
---| "JOYSTICK" # General; default: 0
---| "lastCharacterIndex" # General; default: 0
---| "lastTalkedToGM" # General; default: 
---| "lfdCollapsedHeaders" # General; default: 
---| "lfdSelectedDungeons" # General; default: 
---| "lfgAutoFill" # General; default: 0
---| "lfgAutoJoin" # General; default: 0
---| "lfgSelectedRoles" # General; default: 0
---| "locale" # General; default: ****
---| "lockActionBars" # General; default: 1
---| "lootUnderMouse" # General; default: 1
---| "mapObjLightLOD" # Map; default: 0
---| "mapQuestDifficulty" # Map; default: 0
---| "mapShadows" # Map; default: 1
---| "maxFPS" # General; default: 200
---| "maxFPSBk" # General; default: 30
---| "MaxLights" # General; default: 4
---| "minimapInsideZoom" # Map; default: 3
---| "minimapPortalMax" # Map; default: 99
---| "minimapTrackedInfo" # Map; default: 
---| "minimapZoom" # Map; default: 3
---| "miniWorldMap" # General; default: 0
---| "mouseInvertPitch" # General; default: 0
---| "mouseInvertYaw" # General; default: 0
---| "mouseSpeed" # General; default: 1.0
---| "movie" # General; default: 1
---| "MovieRecordingAutoCompress" # General; default: 1
---| "MovieRecordingCompression" # General; default: 1635148593
---| "MovieRecordingCursor" # General; default: 0
---| "MovieRecordingForceEnable" # General; default: 0
---| "MovieRecordingFramerate" # General; default: 29.97
---| "MovieRecordingGetTexImage" # General; default: 0
---| "MovieRecordingGUI" # General; default: 1
---| "MovieRecordingIcon" # General; default: 1
---| "MovieRecordingPath" # General; default: 
---| "MovieRecordingQuality" # General; default: 2
---| "movierecordingrecover" # General; default: 1
---| "MovieRecordingRecover" # General; default: 1
---| "MovieRecordingSound" # General; default: 1
---| "MovieRecordingWidth" # General; default: 640
---| "movieSubtitle" # General; default: 0
---| "MultiTouchAutoRunInvertY" # General; default: 0
---| "MultiTouchAutoRunSensitivityX" # General; default: 8
---| "MultiTouchAutoRunSensitivityY" # General; default: 9
---| "nameplateAllowOverlap" # Nameplates; default: 1
---| "nameplateShowEnemies" # Nameplates; default: 0
---| "nameplateShowEnemyGuardians" # Nameplates; default: 1
---| "nameplateShowEnemyPets" # Nameplates; default: 1
---| "nameplateShowEnemyTotems" # Nameplates; default: 1
---| "nameplateShowFriendlyGuardians" # Nameplates; default: 1
---| "nameplateShowFriendlyPets" # Nameplates; default: 1
---| "nameplateShowFriendlyTotems" # Nameplates; default: 1
---| "nameplateShowFriends" # Nameplates; default: 0
---| "nearclip" # General; default: 0.2
---| "NvidiaViewportFix" # General; default: -1
---| "objectFade" # General; default: 1
---| "objectFadeZFill" # General; default: 0
---| "ObjectSelectionCircle" # General; default: 1
---| "occlusion" # General; default: 1
---| "OutboundChatVolume" # General; default: 1.0
---| "particleDensity" # General; default: 1.0
---| "partyBackgroundOpacity" # General; default: 0.5
---| "partyStatusText" # General; default: 0
---| "pathDistTol" # General; default: 1
---| "PetMeleeDamage" # General; default: 1
---| "PetSpellDamage" # General; default: 1
---| "petStatusText" # General; default: 0
---| "playerStatLeftDropdown" # General; default: 
---| "playerStatRightDropdown" # General; default: 
---| "playerStatusText" # General; default: 0
---| "POIShiftComplete" # General; default: 0.6
---| "portal" # General; default: us
---| "predictedHealth" # General; default: 1
---| "predictedPower" # General; default: 1
---| "preferredFullscreenMode" # General; default: 0
---| "previewTalents" # General; default: 0
---| "processAffinityMask" # General; default: 0
---| "profanityFilter" # General; default: 1
---| "projectedTextures" # General; default: 0
---| "PushToTalkButton" # General; default: `
---| "PushToTalkSound" # General; default: 0
---| "questFadingDisable" # General; default: 1
---| "questLogCollapseFilter" # General; default: 0
---| "questPOI" # General; default: 1
---| "readContest" # General; default: 0
---| "readEULA" # General; default: 0
---| "readScanning" # General; default: 0
---| "readTerminationWithoutNotice" # General; default: 0
---| "readTOS" # General; default: 0
---| "realmList" # General; default: us.logon.worldofwarcraft.com:3724
---| "realmlistbn" # General; default: 
---| "realmListbn" # General; default: 
---| "realmName" # General; default: 
---| "removeChatDelay" # General; default: 0
---| "rotateMinimap" # General; default: 0
---| "screenEdgeFlash" # General; default: 1
---| "screenshotFormat" # General; default: jpeg
---| "screenshotQuality" # General; default: 3
---| "scriptErrors" # General; default: 0
---| "scriptProfile" # General; default: 0
---| "secureAbilityToggle" # General; default: 1
---| "serverAlert" # General; default: SERVER_ALERT_URL
---| "serviceTypeFilter" # General; default: 3
---| "shadowCull" # General; default: 1
---| "shadowInstancing" # General; default: 1
---| "shadowLevel" # General; default: 1
---| "shadowLOD" # General; default: 1
---| "shadowScissor" # General; default: 1
---| "ShowAllSpellRanks" # Interface; default: 1
---| "showArenaEnemyCastbar" # Interface; default: 1
---| "showArenaEnemyFrames" # Interface; default: 1
---| "showArenaEnemyPets" # Interface; default: 1
---| "showBattlefieldMinimap" # Interface; default: 0
---| "showCastableBuffs" # Interface; default: 0
---| "showCastableDebuffs" # Interface; default: 0
---| "showChatIcons" # Interface; default: 0
---| "ShowClassColorInNameplate" # Interface; default: 0
---| "showClock" # Interface; default: 1
---| "showDispelDebuffs" # Interface; default: 0
---| "ShowErrors" # Interface; default: 1
---| "showfootprintparticles" # Interface; default: 1
---| "showfootprints" # Interface; default: 1
---| "showGameTips" # Interface; default: 1
---| "showItemLevel" # Interface; default: 0
---| "showKeyring" # Interface; default: 0
---| "showLootSpam" # Interface; default: 1
---| "showNewbieTips" # Interface; default: 1
---| "showPartyBackground" # Interface; default: 0
---| "showPartyPets" # Interface; default: 1
---| "showQuestObjectivesOnMap" # Interface; default: 1
---| "showQuestTrackingTooltips" # Interface; default: 1
---| "showRaidRange" # Interface; default: 0
---| "showTargetCastbar" # Interface; default: 1
---| "showTargetOfTarget" # Interface; default: 0
---| "showTokenFrame" # Interface; default: 0
---| "showTokenFrameHonor" # Interface; default: 0
---| "showToolsUI" # Interface; default: -1
---| "showTutorials" # Interface; default: 1
---| "showVKeyCastbar" # Interface; default: 1
---| "SkyCloudLOD" # General; default: 0
---| "Sound_AmbienceVolume" # Sound; default: 0.6
---| "Sound_DSPBufferSize" # Sound; default: 0
---| "Sound_EnableAllSound" # Sound; default: 1
---| "Sound_EnableAmbience" # Sound; default: 1
---| "Sound_EnableArmorFoleySoundForOthers" # Sound; default: 1
---| "Sound_EnableArmorFoleySoundForSelf" # Sound; default: 1
---| "Sound_EnableDSPEffects" # Sound; default: 1
---| "Sound_EnableEmoteSounds" # Sound; default: 1
---| "Sound_EnableErrorSpeech" # Sound; default: 1
---| "Sound_EnableHardware" # Sound; default: 0
---| "Sound_EnableMusic" # Sound; default: 1
---| "Sound_EnablePetSounds" # Sound; default: 1
---| "Sound_EnableReverb" # Sound; default: 0
---| "Sound_EnableSFX" # Sound; default: 1
---| "Sound_EnableSoftwareHRTF" # Sound; default: 0
---| "Sound_EnableSoundWhenGameIsInBG" # Sound; default: 1
---| "Sound_ListenerAtCharacter" # Sound; default: 1
---| "Sound_MasterVolume" # Sound; default: 1.0
---| "Sound_MaxCacheableSizeInBytes" # Sound; default: 1048576
---| "Sound_MaxCacheSizeInBytes" # Sound; default: 16777216
---| "Sound_MusicVolume" # Sound; default: 0.4
---| "Sound_NumChannels" # Sound; default: 32
---| "Sound_OutputDriverIndex" # Sound; default: 0
---| "Sound_OutputDriverName" # Sound; default: Primary Sound Driver
---| "Sound_OutputQuality" # Sound; default: 1
---| "Sound_SFXVolume" # Sound; default: 1.0
---| "Sound_VoiceChatInputDriverIndex" # Sound; default: 0
---| "Sound_VoiceChatInputDriverName" # Sound; default: Primary Sound Capture Driver
---| "Sound_VoiceChatOutputDriverIndex" # Sound; default: 0
---| "Sound_VoiceChatOutputDriverName" # Sound; default: Primary Sound Driver
---| "Sound_ZoneMusicNoDelay" # Sound; default: 0
---| "SoundMemoryCache" # Sound; default: 4
---| "spamFilter" # General; default: 1
---| "specular" # General; default: 0
---| "spellEffectLevel" # General; default: 9
---| "SplineOpt" # General; default: 1
---| "StartTalkingDelay" # General; default: 0.0
---| "StartTalkingTime" # General; default: 1.0
---| "statusTextPercentage" # General; default: 0
---| "stopAutoAttackOnTargetChange" # General; default: 0
---| "StopTalkingDelay" # General; default: 0.0
---| "StopTalkingTime" # General; default: 2.0
---| "synchronizeBindings" # General; default: 1
---| "synchronizeConfig" # General; default: 1
---| "synchronizeMacros" # General; default: 1
---| "synchronizeSettings" # General; default: 1
---| "taintLog" # General; default: 0
---| "talentFrameShown" # General; default: 0
---| "targetOfTargetMode" # General; default: 5
---| "targetStatusText" # General; default: 0
---| "terrainAlphaBitDepth" # General; default: 8
---| "texLodBias" # General; default: 0.0
---| "textureCacheSize" # General; default: 32
---| "textureFilteringMode" # General; default: 1
---| "threatPlaySounds" # General; default: 1
---| "threatShowNumeric" # General; default: 0
---| "threatWarning" # General; default: 3
---| "threatWorldText" # General; default: 1
---| "timeMgrAlarmEnabled" # General; default: 0
---| "timeMgrAlarmMessage" # General; default: 
---| "timeMgrAlarmTime" # General; default: 0
---| "timeMgrUseLocalTime" # General; default: 0
---| "timeMgrUseMilitaryTime" # General; default: 1
---| "trackedAchievements" # General; default: 
---| "trackedQuests" # General; default: 
---| "trackerFilter" # General; default: 7
---| "trackerSorting" # General; default: 0
---| "UberTooltips" # General; default: 1
---| "UIFaster" # Interface; default: 3
---| "uiScale" # Interface; default: 1.0
---| "unitHighlights" # General; default: 1
---| "UnitNameEnemyGuardianName" # General; default: 0
---| "UnitNameEnemyPetName" # General; default: 1
---| "UnitNameEnemyPlayerName" # General; default: 1
---| "UnitNameEnemyTotemName" # General; default: 0
---| "UnitNameFriendlyGuardianName" # General; default: 0
---| "UnitNameFriendlyPetName" # General; default: 1
---| "UnitNameFriendlyPlayerName" # General; default: 1
---| "UnitNameFriendlyTotemName" # General; default: 0
---| "UnitNameNonCombatCreatureName" # General; default: 0
---| "UnitNameNPC" # General; default: 0
---| "UnitNameOwn" # General; default: 0
---| "UnitNamePlayerGuild" # General; default: 1
---| "UnitNamePlayerPVPTitle" # General; default: 1
---| "useDesktopMouseSpeed" # General; default: 0
---| "useEnglishAudio" # General; default: 0
---| "UseNVShaders" # General; default: 1
---| "UsePboSubImage" # General; default: 0
---| "UsePboSubImageZeroOffset" # General; default: 1
---| "useSimpleChat" # General; default: 0
---| "useUiScale" # General; default: 0
---| "useWeatherShaders" # General; default: 1
---| "videoOptionsVersion" # Graphics; default: 0
---| "violenceLevel" # General; default: 2
---| "VoiceActivationSensitivity" # General; default: 0.4
---| "VoiceChatMode" # General; default: 0
---| "VoiceChatSelfMute" # General; default: 0
---| "watchFrameBaseAlpha" # General; default: 0
---| "watchFrameIgnoreCursor" # General; default: 0
---| "watchFrameState" # General; default: 0
---| "watchFrameWidth" # General; default: 0
---| "waterLOD" # General; default: 0
---| "weatherDensity" # General; default: 2
---| "widescreen" # General; default: 1
---| "windowResizeLock" # General; default: 0
---| "worldMapOpacity" # General; default: 0
---| "worldPoolUsage" # General; default: Dynamic
---| "xpBarText" # General; default: 0


--[=[
UPSTREAM LICENSE (applies to these derived definitions):
                    GNU GENERAL PUBLIC LICENSE
                       Version 2, June 1991

 Copyright (C) 1989, 1991 Free Software Foundation, Inc., <http://fsf.org/>
 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation's software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Lesser General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author's protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone's free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.

                    GNU GENERAL PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

                            NO WARRANTY

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

                     END OF TERMS AND CONDITIONS

            How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
convey the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    {description}
    Copyright (C) {year}  {fullname}

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Also add information on how to contact you by electronic and paper mail.

If the program is interactive, make it output a short notice like this
when it starts in an interactive mode:

    Gnomovision version 69, Copyright (C) year name of author
    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, the commands you use may
be called something other than `show w' and `show c'; they could even be
mouse-clicks or menu items--whatever suits your program.

You should also get your employer (if you work as a programmer) or your
school, if any, to sign a "copyright disclaimer" for the program, if
necessary.  Here is a sample; alter the names:

  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
  `Gnomovision' (which makes passes at compilers) written by James Hacker.

  {signature of Ty Coon}, 1 April 1989
  Ty Coon, President of Vice

This General Public License does not permit incorporating your program into
proprietary programs.  If your program is a subroutine library, you may
consider it more useful to permit linking proprietary applications with the
library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.

]=]
