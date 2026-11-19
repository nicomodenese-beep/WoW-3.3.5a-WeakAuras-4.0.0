local E = aura_env
E.cfg = {
    multiplier = 2, -- Warmane double flush
    ratingRule = "150", -- "150" or "min"
    rounding = "after", -- "after": floor(raw * 2); "before": floor(raw) * 2
    overviewX = 4,
    overviewY = 0,
    rosterX = 4,
    width = 112,
}
E.cards = E.cards or {}
E.hooked = E.hooked or {}
E.active = E.active or false

function E.Team(slot)
    if not slot or slot < 1 or slot > 3 then return end
    local name, size, rating, games, _, _, _, played, _, _, personal = GetArenaTeam(slot)
    if not name or name == "" then return end
    return {slot=slot, name=name, size=size, rating=rating,
        games=games, played=played, personal=personal,
        bracket=size == 5 and "SoloQ" or (tostring(size).."v"..tostring(size))}
end

function E.Calculate(team, played, personal, name)
    local d = {team=team, name=name, played=played, personal=personal}
    if type(team.rating) ~= "number" or type(team.games) ~= "number"
    or type(played) ~= "number" or type(personal) ~= "number" then
        return d -- Unknown data must never look eligible.
    end
    local r = team.rating
    if E.cfg.ratingRule == "min" then
        r = math.min(r, personal)
    elseif personal + 150 < r then
        r = personal
    end
    d.rating = r
    local base = r <= 1500 and 344 or 1511.26 / (1 + 1639.28 * math.exp(-0.00412 * r))
    local raw = base * (team.size == 3 and 0.88 or 0.76)
    d.points = E.cfg.rounding == "before" and math.floor(raw) * E.cfg.multiplier
    or math.floor(raw * E.cfg.multiplier)
    if team.size == 5 then
        d.eligible = played >= 10
        d.more = math.max(0, 10-played)
    else
        d.eligible = team.games >= 10 and 10*played >= 3*team.games
        -- Each additional game played also adds one to the team's total.
        d.more = math.max(0, 10-team.games, math.ceil((3*team.games-10*played)/7))
        -- Minimum personal participation if others finish the team's minimum.
        d.personalMinimum = math.max(0, math.ceil(3*math.max(10,team.games)/10)-played)
    end
    return d
end

function E.Tooltip(card)
    local d = card.data
    if not d then return end
    GameTooltip:SetOwner(card, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine((d.name or "Player").." - "..d.team.bracket, 1, 0.82, 0)
    if not d.points then
        GameTooltip:AddLine("Waiting for arena data...", 1, 1, 1)
    else
        GameTooltip:AddLine("Estimated arena points (x"..E.cfg.multiplier.."): "..d.points, 1, 1, 1)
        GameTooltip:AddLine("Team rating: "..d.team.rating.." | Personal: "..d.personal, 0.8, 0.8, 0.8)
        GameTooltip:AddLine("Calculation rating: "..d.rating, 0.8, 0.8, 0.8)
        GameTooltip:AddLine(" ")
        if d.team.size == 5 then
            GameTooltip:AddLine("Your weekly games: "..d.played.." / 10", 1, 1, 1)
            if not d.eligible then
                GameTooltip:AddLine("Not eligible: play "..d.more.." more SoloQ games.", 1, 0.2, 0.2, true)
            end
        else
            GameTooltip:AddLine("Team games this week: "..d.team.games.." / 10", 1, 1, 1)
            local pct = d.team.games > 0 and 100*d.played/d.team.games or 0
            GameTooltip:AddLine(string.format("Player games: %d (%.1f%%; needs 30%%)", d.played, pct), 1, 1, 1)
            if d.team.games < 10 then
                GameTooltip:AddLine("Team needs "..(10-d.team.games).." more games.", 1, 0.2, 0.2, true)
            end
            if 10*d.played < 3*d.team.games then
                GameTooltip:AddLine("Participation is below 30%.", 1, 0.2, 0.2)
            end
            if not d.eligible then
                GameTooltip:AddLine("Play the next "..d.more.." team games to meet both conditions.", 1, 0.8, 0.2, true)
                if d.team.games < 10 then
                    GameTooltip:AddLine("If teammates complete the minimum: at least "..d.personalMinimum.." of those games must include this player.", 0.8, 0.8, 0.8, true)
                end
                GameTooltip:AddLine("Assumes no additional games without this player.", 0.65, 0.65, 0.65, true)
            end
        end
        if d.eligible then
            GameTooltip:AddLine("Eligible for this team.", 0.2, 1, 0.2)
            if d.best then GameTooltip:AddLine("Highest eligible reward for your character.", 0.2, 1, 0.2, true) end
        else
            GameTooltip:AddLine("Current reward from this team: 0", 1, 0.2, 0.2)
            GameTooltip:AddLine("Red number shows potential points at the current rating.", 0.8, 0.8, 0.8, true)
        end
        if d.roster then
            GameTooltip:AddLine("This team's reward only; other teams of this player are not known.", 0.65, 0.65, 0.65, true)
        end
        if d.bank then
            GameTooltip:AddLine("Current AP: "..d.bank.." / "..E.cfg.apCap, 0.8, 0.8, 0.8)
            if (d.loss or 0)>0 then
                GameTooltip:AddLine("! "..d.loss.." AP lost if this team supplies the reward.", 1, 0.35, 0.1, true)
                GameTooltip:AddLine("Spend at least "..d.loss.." AP before flush to avoid this loss.", 1, 0.8, 0.2, true)
            end
        end
        GameTooltip:AddLine("Estimate; team number is before the currency cap.", 0.65, 0.65, 0.65, true)
    end
    GameTooltip:Show()
end

function E.Card(key, parent, height, x, y)
    local c = E.cards[key]
    if not c then
        c = CreateFrame("Frame", nil, parent)
        c:SetBackdrop({bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
                edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile=true,
                tileSize=16, edgeSize=10, insets={left=2,right=2,top=2,bottom=2}})
        c:SetBackdropColor(0.04,0.04,0.06,0.95)
        c.text = c:CreateFontString(nil,"OVERLAY","GameFontHighlightSmall")
        c.text:SetPoint("CENTER")
        c:EnableMouse(true)
        c:SetScript("OnEnter", function(self) E.Tooltip(self) end)
        c:SetScript("OnLeave", function() GameTooltip:Hide() end)
        c:SetScript("OnHide", function(self)
                if GameTooltip:IsOwned(self) then GameTooltip:Hide() end
        end)
        E.cards[key] = c
    end
    c:SetWidth(E.cfg.width)
    c:SetHeight(height)
    c:ClearAllPoints()
    c:SetPoint("LEFT",parent,"RIGHT",x,y)
    c:SetFrameLevel(parent:GetFrameLevel()+5)
    return c
end

-- Account-local storage OUTSIDE displays: not part of a WA aura export.
-- Never attach this table (or a reference to it) to the display data.
local display = WeakAuras.GetData(E.id)
if display then display.arenaAccountLedger = nil end -- Remove old exportable data.
assert(type(WeakAurasSaved)=="table", "Arena Points: WeakAurasSaved unavailable")
WeakAurasSaved.ArenaPointsTrackerDB = WeakAurasSaved.ArenaPointsTrackerDB
or {version=1,chars={},epochs={}}
E.ledger = WeakAurasSaved.ArenaPointsTrackerDB
E.ledger.debug=nil -- Remove obsolete debug history.
E.cfg.apCap = 10000 -- Change if your realm uses a different cap.
E.cfg.accountX = 5
E.cfg.accountY = -4
E.cfg.accountWidth = 245
E.cfg.maxAgeDays = 7
E.cfg.flushWeekdayUTC = 4 -- 1=Sunday, 4=Wednesday
E.cfg.flushHourUTC = 4 -- Forum-based default, not officially confirmed for 2026.
E.cfg.flushMinuteUTC = 0

function E.FlushCycle(stamp)
    -- 1970-01-01 was Thursday; arithmetic stays independent of local DST.
    local anchor=((E.cfg.flushWeekdayUTC-5)%7)*86400
    +E.cfg.flushHourUTC*3600+E.cfg.flushMinuteUTC*60
    return math.floor((stamp-anchor)/604800)
end
function E.CheckFlush()
    local cycle=E.FlushCycle(time())
    if E.seenCycle~=nil and E.seenCycle~=cycle then
        -- Do not relabel a cached pre-flush value as fresh merely because
        -- the PvP panel is open or a currency/modifier event fires.
        E.accountReady=false
    end
    E.seenCycle=cycle
end
E.CheckFlush()
-- On a new session, the first server arena event or opening the panel
-- may capture data. A session crossing the boundary needs an arena update.
E.dataCycle=E.dataCycle or E.seenCycle
E.flushClock=E.flushClock or CreateFrame("Frame")
E.flushClock.elapsed=0
E.flushClock:SetScript("OnUpdate",function(self,elapsed)
        if not E.active then return end
        self.elapsed=self.elapsed+elapsed
        if self.elapsed<30 then return end
        self.elapsed=0
        local old=E.seenCycle
        E.CheckFlush()
        if old~=E.seenCycle then E.Queue() end
end)

function E.AccountKey()
    return GetRealmName()..":"..UnitName("player")
end
function E.AccountEpoch(realm)
    return E.ledger.epochs[realm] or 0
end
function E.CapInfo(bank, reward)
    local lost=math.max(0, reward-math.max(0,E.cfg.apCap-bank))
    return reward-lost,lost
end
function E.MarkCap(d)
    if not d or not d.points then return end
    local bank=GetArenaCurrency()
    if type(bank)=="number" then
        d.bank=bank
        d.net,d.loss=E.CapInfo(bank,d.points)
    end
end
function E.ClassToken(class)
    if not class then return end
    if RAID_CLASS_COLORS[class] then return class end
    for token,label in pairs(LOCALIZED_CLASS_NAMES_MALE or {}) do
        if label==class then return token end
    end
    for token,label in pairs(LOCALIZED_CLASS_NAMES_FEMALE or {}) do
        if label==class then return token end
    end
end
function E.ClassText(text,token)
    local c=token and RAID_CLASS_COLORS[token]
    if not c then return text end
    return string.format("|cff%02x%02x%02x%s|r",math.floor(c.r*255+0.5),
        math.floor(c.g*255+0.5),math.floor(c.b*255+0.5),text)
end
function E.FetchRoster(t)
    if t.size~=2 and t.size~=3 then return end
    local n=GetNumArenaTeamMembers(t.slot,1)
    if not n or n<1 then return end
    local members,foundSelf={},false
    for i=1,n do
        local name,_,_,class,_,played,_,_,_,rating=GetArenaTeamRosterInfo(t.slot,i)
        if not name or type(played)~="number" or type(rating)~="number" then return end
        local d=E.Calculate(t,played,rating,name)
        if not d.points then return end
        members[#members+1]={name=name,class=E.ClassToken(class),played=played,
        personal=rating,eligible=d.eligible,more=d.more,points=d.points}
        if name:match("^[^-]+") == UnitName("player") then
            if played~=t.played or rating~=t.personal then return end
            foundSelf=true
        end
    end
    if not foundSelf then return end
    table.sort(members,function(a,b) return a.name<b.name end)
    return members
end
function E.MatesFor(members,subject)
    local mates={}
    for _,m in ipairs(members) do
        if m.name:match("^[^-]+")~=subject then
            -- Copy so each subject owns its own stored teammate records.
            mates[#mates+1]={name=m.name,class=m.class,played=m.played,
            personal=m.personal,eligible=m.eligible,more=m.more,points=m.points}
        end
    end
    return mates
end
function E.RosterKey(name,realm)
    local short,suffix=name:match("^(.-)%-(.+)$")
    if suffix then
        if suffix:gsub("%s",""):lower()~=realm:gsub("%s",""):lower() then return end
    else short=name end
    return realm..":"..short
end
function E.TeamFresh(c,t)
    local stamp=t.updated or c.updated
    local epoch=t.epoch
    if epoch==nil then epoch=c.epoch end
    return not (c.pending and not t.updated)
    and E.FlushCycle(stamp)==E.FlushCycle(time())
    and epoch==E.AccountEpoch(c.realm)
    and time()-stamp<=E.cfg.maxAgeDays*86400
end
function E.SyncSharedTeam(t,members,stamp)
    local realm=GetRealmName()
    for _,m in ipairs(members) do
        local key=E.RosterKey(m.name,realm)
        local c=key and E.ledger.chars[key]
        if c and key~=E.AccountKey() and c.realm==realm then
            for i,previous in ipairs(c.teams) do
                if previous.bracket==t.bracket and previous.teamName==t.name then
                    -- Preserve the estimate from the old week BEFORE replacing
                    -- its team records. The actual currency/login time stays intact.
                    E.ProjectBalance(c)
                    c.teams[i]={bracket=t.bracket,teamName=t.name,rating=t.rating,
                        personal=m.personal,games=t.games,played=m.played,
                        points=m.points,eligible=m.eligible,more=m.more,
                        teamPoints=E.Calculate(t,m.played,t.rating).points,
                        mates=E.MatesFor(members,c.name),rosterUpdated=stamp,
                        updated=stamp,cycle=E.FlushCycle(stamp),epoch=E.AccountEpoch(realm),
                        syncedBy=UnitName("player")}
                    c.class=c.class or m.class
                    break
                end
            end
        end
    end
end
function E.ReadRoster(t)
    local cached=E.rosterCache and E.rosterCache[t.slot]
    if cached and cached.teamName==t.name and cached.rating==t.rating
    and cached.games==t.games and cached.epoch==E.AccountEpoch(GetRealmName())
    and E.FlushCycle(cached.updated)==E.FlushCycle(time()) then
        return cached.members,cached.updated
    end
end
function E.SendNextRoster()
    if E.rosterPending or E.loggingOut then return end
    local slot=table.remove(E.rosterQueue or {},1)
    if not slot then return end
    E.rosterQueued[slot]=nil
    local t=E.Team(slot)
    if not t or (t.size~=2 and t.size~=3) then E.SendNextRoster();return end
    E.rosterRequests[slot]=GetTime()
    E.rosterPending={slot=slot,name=t.name,sent=GetTime(),
    serial=E.rosterReplySerial or 0}
    ArenaTeamRoster(slot)
end
function E.ReceiveRoster()
    local pending=E.rosterPending
    if not pending then return end
    if (E.rosterReplySerial or 0)>pending.serial then
        local t=E.Team(pending.slot)
        local members=t and t.name==pending.name and E.FetchRoster(t)
        if members then
            E.rosterCache=E.rosterCache or {}
            E.rosterCache[pending.slot]={teamName=t.name,rating=t.rating,
                games=t.games,members=members,updated=time(),
                epoch=E.AccountEpoch(GetRealmName())}
        end
        E.rosterPending=nil
        E.SendNextRoster()
    elseif GetTime()-pending.sent>10 then
        E.rosterPending=nil
        E.SendNextRoster()
    end
end
function E.RequestMates(teams)
    -- One in-flight request avoids mixing 2v2 and 3v3 replies. No polling.
    E.rosterRequests=E.rosterRequests or {}
    E.rosterQueue=E.rosterQueue or {}
    E.rosterQueued=E.rosterQueued or {}
    for slot=1,3 do
        local t=teams[slot]
        if t and (t.size==2 or t.size==3) and not E.rosterQueued[slot]
        and not (E.rosterPending and E.rosterPending.slot==slot)
        and GetTime()-(E.rosterRequests[slot] or -100)>15 then
            E.rosterQueue[#E.rosterQueue+1]=slot
            E.rosterQueued[slot]=true
        end
    end
    E.SendNextRoster()
end
function E.ConfirmTeamRemoval(old,list)
    if not old or #old.teams==0 then return true end
    local present={}
    local signature={E.AccountKey()}
    for _,t in ipairs(list) do
        local id=t.bracket..":"..(t.teamName or "")
        present[id]=true
        signature[#signature+1]=id
    end
    local removed=false
    for _,t in ipairs(old.teams) do
        if not present[t.bracket..":"..(t.teamName or "")] then removed=true end
    end
    if not removed then
        E.membershipCandidate=nil
        if E.membershipWorker then E.membershipWorker:Hide() end
        return true
    end
    -- Re-read a missing membership after a short stable interval. This
    -- accepts actual leave events while protecting against empty login caches.
    local now=GetTime()
    local key=table.concat(signature,"|")
    local candidate=E.membershipCandidate
    if not candidate or candidate.key~=key then
        candidate={key=key,due=math.max(now+0.6,(E.enteredAt or now-2)+2)}
        E.membershipCandidate=candidate
        E.membershipWorker=E.membershipWorker or CreateFrame("Frame")
        E.membershipWorker:SetScript("OnUpdate",function(self)
                if E.loggingOut or not E.active then self:Hide();return end
                local pending=E.membershipCandidate
                if not pending or GetTime()>=pending.due then
                    self:Hide()
                    E.Queue()
                end
        end)
        E.membershipWorker:Show()
        return false
    end
    local visible=PVPFrame and PVPFrame:IsVisible()
    if now<candidate.due or not (E.teamDataReady or visible) then return false end
    E.membershipCandidate=nil
    E.membershipWorker:Hide()
    return true
end
function E.SaveCharacter(own)
    -- A server update or opening the PvP frame confirms that no-team data
    -- is meaningful. Do not overwrite saved data with empty login caches.
    if E.loggingOut then return end
    E.CheckFlush()
    if not E.accountReady or E.dataCycle~=E.FlushCycle(time()) then return end
    local bank=GetArenaCurrency()
    if type(bank)~="number" then return end
    for _,d in pairs(own) do if not d.points then return end end
    local realm=GetRealmName()
    local key=E.AccountKey()
    local old=E.ledger.chars[key]
    local list={}
    for slot=1,3 do
        local d=own[slot]
        if d then
            local members,rosterUpdated=E.ReadRoster(d.team)
            local mates=members and E.MatesFor(members,UnitName("player")) or nil
            if members then E.SyncSharedTeam(d.team,members,rosterUpdated) end
            if not mates and old then
                for _,previous in ipairs(old.teams) do
                    if previous.bracket==d.team.bracket and previous.teamName==d.team.name then
                        mates=previous.mates
                        rosterUpdated=previous.rosterUpdated
                    end
                end
            end
            list[#list+1]={bracket=d.team.bracket,teamName=d.team.name,rating=d.team.rating,points=d.points,
                eligible=d.eligible,more=d.more,played=d.played,
                personal=d.personal,games=d.team.games,
                updated=time(),cycle=E.FlushCycle(time()),epoch=E.AccountEpoch(realm),
                teamPoints=E.Calculate(d.team,d.played,d.team.rating).points,
            mates=mates,rosterUpdated=rosterUpdated}
        end
    end
    if not E.ConfirmTeamRemoval(old,list) then
        if old then old.pending=true end
        return
    end
    local className,classToken=UnitClass("player")
    local fresh={name=UnitName("player"),realm=realm,className=className,class=classToken,
        bank=bank,teams=list,updated=time(),cycle=E.FlushCycle(time()),epoch=E.AccountEpoch(realm)}
    E.ledger.chars[key]=fresh
end
function E.ProjectBalance(c)
    local bankCycle=E.FlushCycle(c.updated)
    local crossed=E.FlushCycle(time())>bankCycle
    if not crossed then return c.bank,false,0 end
    -- Cache the old week's expected payout once, before cross-character
    -- team updates can replace those old records with new-week data.
    if c.projectedAward==nil then
        local reward=0
        if not c.pending and c.epoch==E.AccountEpoch(c.realm) then
            for _,t in ipairs(c.teams) do
                if E.FlushCycle(t.updated or c.updated)==bankCycle and t.eligible then
                    reward=math.max(reward,t.points or 0)
                end
            end
        end
        c.projectedAward=E.CapInfo(c.bank,reward)
    end
    return c.bank+c.projectedAward,true,c.projectedAward
end
function E.AccountSummary(c)
    local best,closest=0,nil
    local labels={}
    local freshCount,unknownCount=0,0
    for _,t in ipairs(c.teams) do
        if E.TeamFresh(c,t) then
            freshCount=freshCount+1
            if t.eligible then
                if t.points>best then best=t.points; labels={t.bracket}
                elseif t.points==best then labels[#labels+1]=t.bracket end
            elseif not closest or t.more<closest.more
            or (t.more==closest.more and t.points>closest.points) then closest=t end
        else unknownCount=unknownCount+1 end
    end
    local emptyFresh=#c.teams==0 and not c.pending
    and E.FlushCycle(c.updated)==E.FlushCycle(time())
    and c.epoch==E.AccountEpoch(c.realm)
    local stale=freshCount==0 and not emptyFresh
    local bank,bankEstimated,estimatedAward=E.ProjectBalance(c)
    local net,loss=E.CapInfo(bank,best)
    return {char=c,stale=stale,partial=freshCount>0 and unknownCount>0,
        gross=best,net=net,loss=loss,bank=bank,bankEstimated=bankEstimated,
        estimatedAward=estimatedAward,best=table.concat(labels,"/"),closest=closest}
end
function E.AccountRows()
    local rows={}
    local totals={bank=0,net=0,gross=0,loss=0,ready=0,stale=0,count=0,estimated=0,partial=0}
    for key,c in pairs(E.ledger.chars) do
        local d=E.AccountSummary(c)
        rows[#rows+1]=d
        totals.count=totals.count+1
        totals.bank=totals.bank+d.bank
        if d.bankEstimated then totals.estimated=totals.estimated+1 end
        if d.partial then totals.partial=totals.partial+1 end
        if d.stale then totals.stale=totals.stale+1
        else
            totals.net=totals.net+d.net
            totals.gross=totals.gross+d.gross
            totals.loss=totals.loss+d.loss
            if d.gross>0 then totals.ready=totals.ready+1 end
        end
    end
    table.sort(rows,function(a,b)
            if a.char.realm~=b.char.realm then return a.char.realm<b.char.realm end
            return a.char.name<b.char.name
    end)
    return rows,totals
end
-- MMR is a separate history, independent of AP snapshots and team sync.
E.ledger.mmr=E.ledger.mmr or {}
function E.MMRBracket(size,teamName)
    -- Warmane SoloQ occupies the 5v5 slot even though matches are 3v3.
    if size==2 then return "2v2" end
    if size==5 then return "SoloQ" end
    local matches={}
    local normal3,solo
    for slot=1,3 do
        local t=E.Team(slot)
        if t then
            if t.size==3 then normal3=t end
            if t.size==5 then solo=t end
            local compatible=not size or size==3 and (t.size==3 or t.size==5)
            if compatible and teamName and teamName~="" and t.name==teamName then
                matches[#matches+1]=t.bracket
            end
        end
    end
    if #matches==1 then return matches[1] end
    if size==3 then
        if normal3 and not solo then return "3v3" end
        if solo and not normal3 then return "SoloQ" end
    end
    -- Never silently mix SoloQ and normal 3v3 when the metadata is ambiguous.
end
function E.MMRIsPlayer(name)
    if type(name)~="string" then return false end
    if name==UnitName("player") then return true end
    local short,realm=name:match("^(.-)%-(.+)$")
    if short~=UnitName("player") then return false end
    local function normalized(r)
        return r:gsub("%s*%[.-%]",""):gsub("%s",""):lower()
    end
    return realm and normalized(realm)==normalized(GetRealmName())
end
function E.RecordMatchMMR(event)
    local relevant=event=="PLAYER_ENTERING_WORLD" or event=="ZONE_CHANGED_NEW_AREA"
    or event=="UPDATE_BATTLEFIELD_STATUS" or event=="UPDATE_BATTLEFIELD_SCORE"
    if not relevant or E.loggingOut then return end
    if type(IsActiveBattlefieldArena)~="function" then return end
    local arena,rated=IsActiveBattlefieldArena()
    if not arena or arena==0 or not rated or rated==0 then
        E.mmrSession=nil
        return
    end
    E.mmrSession=E.mmrSession or {entered=time()}
    local session=E.mmrSession
    for i=1,(MAX_BATTLEFIELD_QUEUES or 3) do
        local status,_,_,_,_,size,registered=GetBattlefieldStatus(i)
        if status=="active" and registered and registered~=0
        and (size==2 or size==3 or size==5) then
            session.size=size
            break
        end
    end
    if event~="UPDATE_BATTLEFIELD_SCORE" or session.recorded then return end
    if GetBattlefieldWinner()==nil then return end -- Only a completed match.
    local side
    for i=1,GetNumBattlefieldScores() do
        local name,_,_,_,_,faction=GetBattlefieldScore(i)
        if E.MMRIsPlayer(name) and (faction==0 or faction==1) then
            side=faction
            break
        end
    end
    if side==nil then return end
    local teamName,_,_,mmr=GetBattlefieldTeamInfo(side)
    if type(mmr)~="number" or mmr<=0 or mmr~=math.floor(mmr) then return end
    local bracket=E.MMRBracket(session.size,teamName)
    if not bracket then return end
    local _,_,_,opponentMMR=GetBattlefieldTeamInfo(1-side)
    if type(opponentMMR)~="number" or opponentMMR<=0 then opponentMMR=nil end
    local key=E.AccountKey()
    E.ledger.mmr[key]=E.ledger.mmr[key] or {}
    E.ledger.mmr[key][bracket]={value=mmr,opponent=opponentMMR,
        teamName=teamName,updated=time(),source="scoreboard-team"}
    session.recorded=true
end
function E.MMRLines(c)
    local history=E.ledger.mmr[c.realm..":"..c.name] or {}
    for _,bracket in ipairs({"2v2","3v3","SoloQ"}) do
        local entry=history[bracket]
        if entry then
            GameTooltip:AddLine("    "..bracket.." | last team MMR: "..entry.value..
                " | "..date("%d.%m. %H:%M",entry.updated),0.75,0.85,1,true)
        else
            GameTooltip:AddLine("    "..bracket.." | MMR: not recorded",0.55,0.55,0.55)
        end
    end
end
function E.AccountTooltip(card)
    local rows,total=E.AccountRows()
    GameTooltip:SetOwner(card,"ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine("Account arena points",1,0.82,0)
    GameTooltip:AddLine(total.ready.." / "..total.count.." characters eligible",0.8,0.8,0.8)
    GameTooltip:AddDoubleLine("Account balance",total.bank..(total.estimated>0 and "*" or "").." AP",1,1,1,1,1,1)
    GameTooltip:AddDoubleLine("Next flush (after cap)","+"..total.net.." AP",1,1,1,0.2,1,0.2)
    if total.loss>0 then GameTooltip:AddLine("! "..total.loss.." AP would be lost to caps",1,0.35,0.1) end
    local anchor=((E.cfg.flushWeekdayUTC-5)%7)*86400
    +E.cfg.flushHourUTC*3600+E.cfg.flushMinuteUTC*60
    local nextFlush=anchor+(E.FlushCycle(time())+1)*604800
    GameTooltip:AddLine("Next scheduled flush: "..date("%d.%m.%Y %H:%M",nextFlush).." (local)",0.65,0.65,0.65)
    local realm
    for _,d in ipairs(rows) do
        local c=d.char
        if c.realm~=realm then
            realm=c.realm
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(realm,0.7,0.7,0.7)
        end
        local r,g,b=1,1,1
        local right
        if d.stale then
            r,g,b=0.6,0.6,0.6
            right="Log in to refresh"
        elseif d.gross>0 then
            right="+"..d.net.." AP  |cff33ff33"..d.best.."|r"
            if d.loss>0 then right=right.." |cffff5522! -"..d.loss.."|r" end
        else
            r,g,b=1,0.2,0.2
            right=d.closest and (d.closest.bracket..": +"..d.closest.more.." games") or "No arena team"
        end
        if d.partial then right=right.." |cff999999(?)|r" end
        local mark=E.AccountKey()==c.realm..":"..c.name and " (you)" or ""
        local label=c.name..mark
        if c.class then
            local className=(LOCALIZED_CLASS_NAMES_MALE or {})[c.class] or c.className or c.class
            label=label.." - "..E.ClassText(className,c.class)
        end
        GameTooltip:AddDoubleLine(label,right,r,g,b,r,g,b)
        if IsShiftKeyDown() then
            GameTooltip:AddDoubleLine("  "..d.bank..(d.bankEstimated and "*" or "").." AP "..
                (d.bankEstimated and "estimated" or "saved"),
                date("%d.%m. %H:%M",c.updated),0.55,0.55,0.55,0.55,0.55,0.55)
        end
        if IsAltKeyDown() then E.MMRLines(c) end
        if IsControlKeyDown() then
            for _,t in ipairs(c.teams) do
                if t.bracket=="2v2" or t.bracket=="3v3" then
                    local names={}
                    local rosterStale=not E.TeamFresh(c,t) or not t.rosterUpdated
                    or E.FlushCycle(t.rosterUpdated)~=E.FlushCycle(time())
                    for _,m in ipairs(t.mates or {}) do
                        local text=E.ClassText(m.name,m.class)
                        if rosterStale then text=text.." |cff999999(?)|r"
                        elseif m.eligible==false then text=text.." |cffff3333(+"..m.more.."g)|r"
                        elseif m.eligible==nil then text=text.." |cff999999(?)|r" end
                        if not rosterStale and m.eligible~=nil and m.points then
                            -- Potential reward at personal/effective rating, before cap.
                            -- Compare to full team-rating reward, not eligible payout.
                            local reward=m.points
                            local teamReward=t.teamPoints
                            if not teamReward and t.rating then
                                local base=t.rating<=1500 and 344 or
                                1511.26/(1+1639.28*math.exp(-0.00412*t.rating))
                                local raw=base*(t.bracket=="3v3" and 0.88 or 0.76)
                                teamReward=E.cfg.rounding=="before" and math.floor(raw)*E.cfg.multiplier
                                or math.floor(raw*E.cfg.multiplier)
                            end
                            if not teamReward or reward~=teamReward then
                                local color=m.eligible and "|cffcccccc" or "|cffff3333"
                                text=text.." "..color.."["..reward.." AP]|r"
                            end
                        end
                        names[#names+1]=text
                    end
                    local info=not t.mates and "Open this character's PvP panel to load roster"
                    or (#names==0 and "No teammates" or table.concat(names,", "))
                    GameTooltip:AddLine("    "..t.bracket..": "..info,0.8,0.8,0.8,true)
                end
            end
        end
        if IsShiftKeyDown() then
            for _,t in ipairs(c.teams) do
                local text=t.bracket.." | "..(t.rating or "?").." rating | "..t.points.." AP"
                local tr,tg,tb=1,1,1
                if not E.TeamFresh(c,t) then
                    text=text.." | last saved; weekly (?)"
                    tr,tg,tb=0.6,0.6,0.6
                elseif not t.eligible then
                    text=text.." | +"..t.more.." games";tr,tg,tb=1,0.2,0.2
                elseif t.points==d.gross then tr,tg,tb=0.2,1,0.2 end
                if t.syncedBy then
                    text=text.." | via "..t.syncedBy
                end
                GameTooltip:AddLine("    "..text,tr,tg,tb)
            end
        end
    end
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("Shared teams update known alts; balances require that character's login.",0.7,0.7,0.7,true)
    if total.partial>0 then
        GameTooltip:AddLine("(?) Some other teams are outdated; next-flush total includes known eligible teams only.",1,0.75,0.3,true)
    end
    if total.estimated>0 then
        GameTooltip:AddLine("* Estimated balance after flush; log in to confirm. Only the last known week's payout is added.",1,0.75,0.3,true)
    end
    GameTooltip:AddLine("Games: shortest route, playing every next match.",0.7,0.7,0.7,true)
    GameTooltip:AddLine("Hold Shift: all teams. Shift-click: manual invalidation (this realm).",0.7,0.7,0.7,true)
    GameTooltip:AddLine("Hold Ctrl: teammates. (+Ng): games needed; [AP]: potential reward differs from team rating; (?): unknown/outdated.",0.7,0.7,0.7,true)
    GameTooltip:AddLine("Hold Alt: last recorded team MMR, not personal hidden MMR.",0.7,0.7,0.7,true)
    if total.stale>0 then GameTooltip:AddLine(total.stale.." outdated characters excluded from flush total.",1,0.6,0.2,true) end
    GameTooltip:Show()
end
function E.ShowAccount()
    local c=E.Card("account",PVPFrame,34,0,0)
    c:SetWidth(E.cfg.accountWidth)
    c:ClearAllPoints()
    c:SetPoint("TOPLEFT",PVPFrame,"TOPRIGHT",E.cfg.accountX,E.cfg.accountY)
    c:SetFrameStrata("DIALOG")
    c.text:SetTextColor(1,1,1)
    c:SetBackdropBorderColor(0.6,0.6,0.6,1)
    c:SetScript("OnEnter",function(self) E.AccountTooltip(self) end)
    c:SetScript("OnMouseUp",function(self,button)
            if button=="LeftButton" and IsShiftKeyDown() then
                local realm=GetRealmName()
                E.ledger.epochs[realm]=(E.ledger.epochs[realm] or 0)+1
                E.Queue()
            end
    end)
    local _,t=E.AccountRows()
    c.text:SetText("Account AP: "..t.bank..(t.estimated>0 and "*" or "").."\nNext flush: +"..t.net..
        (t.partial>0 and " (?)" or "")..
        (t.loss>0 and " |cffff5522!|r" or "")..
        (t.stale>0 and " | "..t.stale.." outdated" or ""))
    c:Show()
    if GameTooltip:IsOwned(c) then E.AccountTooltip(c) end
end

function E.Paint(c,d)
    c.data = d
    local r,g,b = 0.6,0.6,0.6
    if d.points then
        if not d.eligible then r,g,b=1,0.2,0.2
        elseif d.best then r,g,b=0.2,1,0.2
        else r,g,b=1,1,1 end
    end
    c.text:SetText(d.points and (d.points.." AP"..((d.loss or 0)>0 and " |cffff5522!|r" or "")) or "...")
    c.text:SetTextColor(r,g,b)
    c:SetBackdropBorderColor(r,g,b,1)
    c:Show()
    if GameTooltip:IsOwned(c) then E.Tooltip(c) end
end

function E.Refresh()
    if E.loggingOut then return end
    for key,c in pairs(E.cards) do if key~="account" then c:Hide() end end
    if not E.active then
        if E.cards.account then E.cards.account:Hide() end
        return
    end
    local visible=PVPFrame and PVPFrame:IsVisible()
    E.CheckFlush()
    if visible and E.dataCycle==E.FlushCycle(time()) then E.accountReady=true end
    local teams, own, best = {}, {}, nil
    for slot=1,3 do
        local t=E.Team(slot)
        teams[slot]=t
        if t then
            local d=E.Calculate(t,t.played,t.personal,UnitName("player"))
            own[slot]=d
            if d.eligible and (not best or d.points>best) then best=d.points end
        end
    end
    for _,d in pairs(own) do
        d.best=d.eligible and d.points==best
        E.MarkCap(d)
    end
    E.ReceiveRoster()
    if visible then E.RequestMates(teams) end
    E.SaveCharacter(own)
    if not visible then
        if E.cards.account then E.cards.account:Hide() end
        return
    end
    E.ShowAccount()
    if PVPTeamDetails and PVPTeamDetails:IsVisible() then
        local t=teams[PVPTeamDetails.team]
        if not t then return end
        for row=1,(MAX_ARENA_TEAM_MEMBERS or 10) do
            local button=_G["PVPTeamDetailsButton"..row]
            if button and button:IsVisible() and button.teamIndex then
                local name,_,_,_,_,played,_,_,_,personal=GetArenaTeamRosterInfo(t.slot,button.teamIndex)
                if name then
                    local short=name:match("^[^-]+")
                    local isPlayer=short==UnitName("player")
                    if t.size == 5 then
                        -- SoloQ roster games are season totals on Warmane.
                        -- GetArenaTeam return #8 is the main-panel weekly Played.
                        if isPlayer then
                            played=t.played
                        else
                            played=nil -- No reliable weekly data for other players.
                        end
                    end
                    local d=E.Calculate(t,played,personal,name)
                    d.roster=not isPlayer
                    if isPlayer then E.MarkCap(d) end
                    d.best=isPlayer and d.eligible and d.points==best
                    E.Paint(E.Card("r"..row,button,20,E.cfg.rosterX,0),d)
                end
            end
        end
    else
        for row=1,3 do
            local button=_G["PVPTeam"..row]
            if button and button:IsVisible() then
                local d=own[button:GetID()]
                if d then E.Paint(E.Card("t"..row,button,32,E.cfg.overviewX,E.cfg.overviewY),d) end
            end
        end
    end
end

-- Coalesce UI updates into a single refresh on the next frame.
-- No permanent every-frame loop and no extra roster requests.
E.worker=E.worker or CreateFrame("Frame")
E.worker:Hide()
E.worker:SetScript("OnUpdate",function(self)
        self:Hide()
        E.Refresh()
end)
function E.Queue()
    if E.active and not E.loggingOut then E.worker:Show() end
end
function E.InstallHooks()
    for _,name in ipairs({"PVPTeam_Update","PVPTeamDetails_Update"}) do
        if type(_G[name])=="function" and not E.hooked[name] then
            hooksecurefunc(name,function() E.Queue() end)
            E.hooked[name]=true
        end
    end
    for _,name in ipairs({"PVPFrame","PVPTeamDetails"}) do
        local f=_G[name]
        if f and not E.hooked[name] then
            f:HookScript("OnShow",function() E.Queue() end)
            f:HookScript("OnHide",function() E.Queue() end)
            E.hooked[name]=true
        end
    end
end
E.InstallHooks()
E.Queue()