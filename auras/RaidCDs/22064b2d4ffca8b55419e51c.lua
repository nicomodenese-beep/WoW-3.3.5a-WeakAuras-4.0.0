---- Lua optimization ---
local RaidCDs = aura_env
local type, pairs, ipairs, tostring, tconcat, strsplit, select, GetTalentInfo =
type, pairs, ipairs, tostring, table.concat, strsplit, select, GetTalentInfo
local UnitIsUnit, GetActiveTalentGroup, GetTalentTabInfo, GetNumGlyphSockets =
UnitIsUnit, GetActiveTalentGroup, GetTalentTabInfo, GetNumGlyphSockets
local GetGlyphSocketInfo, GetSpellInfo, GetTime, UnitClass, UnitName, unpack =
GetGlyphSocketInfo, GetSpellInfo, GetTime, UnitClass, UnitName, unpack
local UnitIsDeadOrGhost, UnitIsConnected, UnitInRaid, UnitInParty, UnitRace =
UnitIsDeadOrGhost, UnitIsConnected, UnitInRaid, UnitInParty, UnitRace

--------- Debug ---------
RaidCDs.debug = function(group,msg,...)
    return WeakAuras.ScanEvents("DPRINT",group,RaidCDs.id,msg,...)
end

------ Track Spells -----
RaidCDs.CDs = {
    ["DEATHKNIGHT"] = {
        -- Hysteria
        [GetSpellInfo(49016)] = {
            spellID = 49016,
            cd = 180,
            index = 1,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 19,
        },
        -- Icebound Fortitude
        [GetSpellInfo(48792)] = {
            spellID = 48792,
            cd = 120,
            index = 2,
        },
        -- Vampiric Blood
        [GetSpellInfo(55233)] = {
            spellID = 55233,
            cd = 60,
            index = 3,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 23,
        },
        -- Death Pact
        [GetSpellInfo(48743)] = {
            spellID = 48743,
            cd = 120,
            index = 4,
        },
        -- Dancing Rune Weapon
        [GetSpellInfo(49028)] = {
            spellID = 49028,
            cd = 90,
            index = 5,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 28,
        },
        -- Anti-Magic Shell
        [GetSpellInfo(48707)] = {
            spellID = 48707,
            cd = 45,
            index = 6,
        },
        -- Anti-Magic Zone
        [GetSpellInfo(51052)] = {
            spellID = 51052,
            cd = 120,
            index = 7,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 22,
        },
        -- Army of the Dead
        [GetSpellInfo(42650)] = {
            spellID = 42650,
            cd = 600,
            index = 8,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 13,
            cdMinusPerPoint = 120,
        },
        -- Summon Gargoyle
        [GetSpellInfo(49206)] = {
            spellID = 49206,
            cd = 180,
            index = 9,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 31,
        },
        -- Death Grip
        [GetSpellInfo(49576)] = {
            spellID = 49576,
            cd = 35,
            index = 10,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 6,
            cdMinusPerPoint = 5,
        },
        -- Mind Freeze
        [GetSpellInfo(47528)] = {
            spellID = 47528,
            cd = 10,
            index = 11,
        },
        -- Gnaw (Ghoul)
        [GetSpellInfo(47481)] = {
            spellID = 47481,
            cd = 60,
            index = 12,
        },
    },
    ["DRUID"] = {
        -- Innervate
        [GetSpellInfo(29166)] = {
            spellID = 29166,
            cd = 180,
            index = 1,
        },
        -- Tranquility
        [GetSpellInfo(48447)] = {
            spellID = 48447,
            cd = 480,
            index = 2,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 14,
            cdMinusPerPoint = 144,
        },
        -- Rebirth
        [GetSpellInfo(48477)] = {
            spellID = 48477,
            cd = 600,
            index = 3,
        },
        -- Typhoon
        [GetSpellInfo(61384)] = {
            spellID = 61384,
            cd = 20,
            index = 4,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 24,
            cdMinusGlyph = true,
            glyphId = 63056, -- Glyph of Monsoon
            cdMinusGlyphTime = 3,
        },
        -- Frenzied Regeneration
        [GetSpellInfo(22842)] = {
            spellID = 22842,
            cd = 180,
            index = 5,
        },
        -- Survival Instincts
        [GetSpellInfo(61336)] = {
            spellID = 61336,
            cd = 180,
            index = 6,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 8,
        },
        -- Barkskin
        [GetSpellInfo(22812)] = {
            spellID = 22812,
            cd = 60,
            index = 7,
        },
        -- Berserk
        [GetSpellInfo(50334)] = {
            spellID = 50334,
            cd = 180,
            index = 8,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 30,
        },
        -- Bash
        [GetSpellInfo(8983)] = {
            spellID = 8983,
            cd = 60,
            index = 9,
        },
    },
    ["HUNTER"] = {
        -- Misdirection (prebuff: 34477, threat: 35079)
        [GetSpellInfo(34477)] = {
            spellID = 34477,
            cd = 30,
            index = 1,
        },
        -- Readiness
        [GetSpellInfo(23989)] = {
            spellID = 23989,
            cd = 180,
            index = 2,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 14,
        },
        -- Deterrence
        [GetSpellInfo(19263)] = {
            spellID = 19263,
            cd = 90,
            index = 3,
            cdMinusGlyph = true,
            glyphId = 56850, -- Glyph of Deterrence
            cdMinusGlyphTime = 10,
        },
        -- Silencing Shot
        [GetSpellInfo(34490)] = {
            spellID = 34490,
            cd = 20,
            index = 4,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 24,
        },
        -- Feign Death -> track on aura fade
        [GetSpellInfo(5384)] = {
            spellID = 5384,
            cd = 30,
            index = 5,
            cdMinusGlyph = true,
            glyphId = 57903, -- Glyph of Feign Death
            cdMinusGlyphTime = 5,
        },
        -- Bestial Wrath
        [GetSpellInfo(19574)] = {
            spellID = 19574,
            cd = 120,
            index = 6,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 18,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 22,
            cdMinusPerPoint = 12,
        },
    },
    ["MAGE"] = {
        -- Ice Block
        [GetSpellInfo(45438)] = {
            spellID = 45438,
            cd = 300,
            index = 1,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 3,
            cdMinusPerPoint = 20,
        },
        -- Mirror Image
        [GetSpellInfo(55342)] = {
            spellID = 55342,
            cd = 180,
            index = 2,
        },
        -- Invisibility
        [GetSpellInfo(66)] = {
            spellID = 66,
            cd = 180,
            index = 3,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 24,
            cdMinusPerPoint = 27,
        },
        -- Evocation
        [GetSpellInfo(12051)] = {
            spellID = 12051,
            cd = 240,
            index = 4,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 24,
            cdMinusPerPoint = 60,
        },
        -- Blink
        [GetSpellInfo(1953)] = {
            spellID = 1953,
            cd = 15,
            index = 5,
        },
        -- Cold Snap
        [GetSpellInfo(11958)] = {
            spellID = 11958,
            cd = 480,
            index = 6,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 14,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 17,
            cdMinusPerPoint = 48,
        },
        -- Counterspell
        [GetSpellInfo(2139)] = {
            spellID = 2139,
            cd = 24,
            index = 7,
        },
    },
    ["PALADIN"] = {
        -- Aura Mastery
        [GetSpellInfo(31821)] = {
            spellID = 31821,
            cd = 120,
            index = 1,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 6,
        },
        -- Divine Sacrifice
        [GetSpellInfo(64205)] = {
            spellID = 64205,
            cd = 120,
            index = 2,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 6,
        },
        -- Hand of Sacrifice
        [GetSpellInfo(6940)] = {
            spellID = 6940,
            cd = 120,
            index = 3,
        },
        -- Hand of Protection
        [GetSpellInfo(10278)] = {
            spellID = 10278,
            cd = 300,
            index = 4,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 4,
            cdMinusPerPoint = 60,
        },
        -- Hand of Salvation
        [GetSpellInfo(1038)] = {
            spellID = 1038,
            cd = 120,
            index = 5,
        },
        -- Hand of Freedom
        [GetSpellInfo(1044)] = {
            spellID = 1044,
            cd = 25,
            index = 6,
        },
        -- Lay on Hands
        [GetSpellInfo(48788)] = {
            spellID = 48788,
            cd = 1200,
            index = 7,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 8,
            cdMinusPerPoint = 120,
            cdMinusGlyph = true,
            glyphId = 57955, -- Glyph of Lay on Hands
            cdMinusGlyphTime = 300,
        },
        -- Divine Illumination
        [GetSpellInfo(31842)] = {
            spellID = 31842,
            cd = 180,
            index = 8,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 22,
        },
        -- Holy Wrath
        [GetSpellInfo(48817)] = {
            spellID = 48817,
            cd = 30,
            index = 9,
            cdMinusGlyph = true,
            glyphId = 56420, -- Glyph of Holy Wrath
            cdMinusGlyphTime = 15,
        },
        -- Divine Protection
        [GetSpellInfo(498)] = {
            spellID = 498,
            cd = 180,
            index = 10,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 14,
            cdMinusPerPoint = 30,
        },
        -- Ardent Defender
        [GetSpellInfo(66233)] = {
            spellID = 66233,
            cd = 120,
            index = 11,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 18,
        },
        -- Divine Shield
        [GetSpellInfo(642)] = {
            spellID = 642,
            cd = 300,
            index = 12,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 14,
            cdMinusPerPoint = 30,
        },
        -- Avenging Wrath
        [GetSpellInfo(31884)] = {
            spellID = 31884,
            cd = 180,
            index = 13,
        },
        -- Divine Plea
        [GetSpellInfo(54428)] = {
            spellID = 54428,
            cd = 60,
            index = 14,
        },
        -- Hammer of Justice
        [GetSpellInfo(10308)] = {
            spellID = 10308,
            cd = 60,
            index = 15,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 10,
            cdMinusPerPoint = 10,
            cdMinus2 = true,
            cdTabIndex2 = 2,
            cdTalentIndex2 = 25,
            cdMinusPerPoint2 = 5,
        },
        -- Repentance
        [GetSpellInfo(20066)] = {
            spellID = 20066,
            cd = 60,
            index = 16,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 18,
        },
    },
    ["PRIEST"] = {
        -- Divine Hymn
        [GetSpellInfo(64843)] = {
            spellID = 64843,
            cd = 480,
            index = 1,
        },
        -- Hymn of Hope
        [GetSpellInfo(64901)] = {
            spellID = 64901,
            cd = 360,
            index = 2,
        },
        -- Pain Suppression
        [GetSpellInfo(33206)] = {
            spellID = 33206,
            cd = 180,
            index = 3,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 25,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 23,
            cdMinusPerPoint = 18,
        },
        -- Power Infusion
        [GetSpellInfo(10060)] = {
            spellID = 10060,
            cd = 120,
            index = 4,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 19,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 23,
            cdMinusPerPoint = 12,
        },
        -- Guardian Spirit
        [GetSpellInfo(47788)] = {
            spellID = 47788,
            cd = 180,
            index = 5,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 27,
            cdMinusGlyph = true,
            glyphId = 63231, -- Glyph of Guardian Spirit
            cdMinusGlyphTime = 120,
        },
        -- Lightwell
        [GetSpellInfo(48087)] = {
            spellID = 48087,
            cd = 180,
            index = 6,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 18,
        },
        -- Fear Ward
        [GetSpellInfo(6346)] = {
            spellID = 6346,
            cd = 180,
            index = 7,
            cdMinusGlyph = true,
            glyphId = 55678, -- Glyph of Fear Ward
            cdMinusGlyphTime = 60,
        },
        -- Dispersion
        [GetSpellInfo(47585)] = {
            spellID = 47585,
            cd = 120,
            index = 8,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 27,
            cdMinusGlyph = true,
            glyphId = 63229, -- Glyph of Dispersion
            cdMinusGlyphTime = 45,
        },
        -- Shadowfiend
        [GetSpellInfo(34433)] = {
            spellID = 34433,
            cd = 300,
            index = 9,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 10,
            cdMinusPerPoint = 60,
        },
    },
    ["ROGUE"] = {
        -- Tricks of the Trade (prebuff: 57934, threat: 59628, dmg buff: 57933)
        [GetSpellInfo(57934)] = {
            spellID = 57934,
            cd = 30,
            index = 1,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 26,
            cdMinusPerPoint = 5,
        },
        -- Vanish
        [GetSpellInfo(26889)] = {
            spellID = 26889,
            cd = 180,
            index = 2,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 7,
            cdMinusPerPoint = 30,
        },
        -- Blade Flurry
        [GetSpellInfo(13877)] = {
            spellID = 13877,
            cd = 120,
            index = 3,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 15,
        },
        -- Adrenaline Rush
        [GetSpellInfo(13750)] = {
            spellID = 13750,
            cd = 180,
            index = 4,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 20,
        },
        -- Killing Spree
        [GetSpellInfo(51690)] = {
            spellID = 51690,
            cd = 120,
            index = 5,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 28,
            cdMinusGlyph = true,
            glyphId = 63252, -- Glyph of Killing Spree
            cdMinusGlyphTime = 45,
        },
        -- Evasion
        [GetSpellInfo(26669)] = {
            spellID = 26669,
            cd = 180,
            index = 6,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 7,
            cdMinusPerPoint = 30,
        },
        -- Cloak of Shadows
        [GetSpellInfo(31224)] = {
            spellID = 31224,
            cd = 90,
            index = 7,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 7,
            cdMinusPerPoint = 15,
        },
        -- Kick
        [GetSpellInfo(1766)] = {
            spellID = 1766,
            cd = 10,
            index = 8,
        },
        -- Preparation
        [GetSpellInfo(14185)] = {
            spellID = 14185,
            cd = 480,
            index = 9,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 14,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 26,
            cdMinusPerPoint = 90,
        },
        -- Sprint
        [GetSpellInfo(11305)] = {
            spellID = 11305,
            cd = 180,
            index = 10,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 7,
            cdMinusPerPoint = 30,
        },
        -- Kidney Shot
        [GetSpellInfo(8643)] = {
            spellID = 8643,
            cd = 20,
            index = 11,
        },
    },
    ["SHAMAN"] = {
        -- Mana Tide Totem
        [GetSpellInfo(16190)] = {
            spellID = 16190,
            cd = 300,
            index = 1,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 17,
        },
        -- Reincarnation
        [GetSpellInfo(21169)] = {
            spellID = 21169,
            cd = 1800,
            index = 2,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 3,
            cdMinusPerPoint = 450,
        },
        -- Earth Elemental Totem
        [GetSpellInfo(2062)] = {
            spellID = 2062,
            cd = 600,
            index = 3,
        },
        -- Fire Elemental Totem
        [GetSpellInfo(2894)] = {
            spellID = 2894,
            cd = 600,
            index = 4,
            cdMinusGlyph = true,
            glyphId = 55455, -- Glyph of Fire Elemental Totem
            cdMinusGlyphTime = 300,
        },
        -- Feral Spirit
        [GetSpellInfo(51533)] = {
            spellID = 51533,
            cd = 180,
            index = 5,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 29,
        },
        -- Bloodlust
        [GetSpellInfo(2825)] = {
            spellID = 2825,
            cd = 300,
            index = 6,
        },
        -- Heroism
        [GetSpellInfo(32182)] = {
            spellID = 32182,
            cd = 300,
            index = 6,
        },
        -- Wind Shear
        [GetSpellInfo(57994)] = {
            spellID = 57994,
            cd = 6,
            index = 7,
            cdMinus = true,
            cdTabIndex = 1,
            cdTalentIndex = 6,
            cdMinusPerPoint = 0.2,
        },
        -- Thunderstorm
        [GetSpellInfo(59159)] = {
            spellID = 59159,
            cd = 45,
            index = 8,
            talentReq = true,
            tabIndex = 1,
            talentIndex = 25,
        },
    },
    ["WARLOCK"] = {
        -- Soulstone Resurrection
        [GetSpellInfo(47883)] = {
            spellID = 47883,
            cd = 900,
            index = 1,
        },
        -- Soulshatter
        [GetSpellInfo(29858)] = {
            spellID = 29858,
            cd = 180,
            index = 2,
        },
        -- Metamorphosis
        [GetSpellInfo(47241)] = {
            spellID = 47241,
            cd = 180,
            index = 3,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 27,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 25,
            cdMinusPerPoint = 18,
        },
        -- Shadowfury
        [GetSpellInfo(47847)] = {
            spellID = 47847,
            cd = 20,
            index = 4,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 23,
        },
        -- Demonic Circle: Teleport
        [GetSpellInfo(48020)] = {
            spellID = 48020,
            cd = 30,
            index = 5,
            cdMinusGlyph = true,
            glyphId = 63309, -- Glyph of Demonic Circle
            cdMinusGlyphTime = 4,
        },
        -- Spell Lock
        [GetSpellInfo(19647)] = {
            spellID = 19647,
            cd = 24,
            index = 6,
            petReq = true,
            petType = "Felhunter",
        },
    },
    ["WARRIOR"] = {
        -- Death Wish
        [GetSpellInfo(12292)] = {
            spellID = 12292,
            cd = 180,
            index = 1,
            talentReq = true,
            tabIndex = 2,
            talentIndex = 14,
            cdMinus = true,
            cdTabIndex = 2,
            cdTalentIndex = 18,
            cdMinusPerPoint = 20,
        },
        -- Shattering Throw
        [GetSpellInfo(64382)] = {
            spellID = 64382,
            cd = 300,
            index = 2,
        },
        -- Enraged Regeneration
        [GetSpellInfo(55694)] = {
            spellID = 55694,
            cd = 180,
            index = 3,
        },
        -- Last Stand
        [GetSpellInfo(12975)] = {
            spellID = 12975,
            cd = 180,
            index = 4,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 6,
            cdMinusGlyph = true,
            glyphId = 58376, -- Glyph of Last Stand
            cdMinusGlyphTime = 60,
        },
        -- Shield Wall
        [GetSpellInfo(871)] = {
            spellID = 871,
            cd = 300,
            index = 5,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 13,
            cdMinusPerPoint = 30,
            cdMinusGlyph = true,
            glyphId = 63329, -- Glyph of Shield Wall
            cdMinusGlyphTime = 120,
        },
        -- Shield Block
        [GetSpellInfo(2565)] = {
            spellID = 2565,
            cd = 60,
            index = 6,
            cdMinus = true,
            cdTabIndex = 3,
            cdTalentIndex = 8,
            cdMinusPerPoint = 10,
        },
        -- Intervene
        [GetSpellInfo(3411)] = {
            spellID = 3411,
            cd = 30,
            index = 7,
        },
        -- Pummel
        [GetSpellInfo(6552)] = {
            spellID = 6552,
            cd = 10,
            index = 8,
        },
        -- Shield Bash
        [GetSpellInfo(72)] = {
            spellID = 72,
            cd = 10,
            index = 9,
        },
        -- Concussion Blow
        [GetSpellInfo(12809)] = {
            spellID = 12809,
            cd = 30,
            index = 10,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 14,
        },
        -- Shockwave
        [GetSpellInfo(46968)] = {
            spellID = 46968,
            cd = 20,
            index = 11,
            talentReq = true,
            tabIndex = 3,
            talentIndex = 27,
        },
        -- Charge
        [GetSpellInfo(7922)] = {
            spellID = 7922,
            cd = 15,
            index = 12,
        },
        -- Intercept
        [GetSpellInfo(20253)] = {
            spellID = 20253,
            cd = 30,
            index = 13,
        },
    },
    ["ALL"] = {
        -- Every Man for Himself
        [GetSpellInfo(59752)] = {
            spellID = 59752,
            cd = 120,
            index = 1,
        },
        -- Forbearance
        [GetSpellInfo(25771)] = {
            spellID = 25771,
            cd = 120,
            index = 2,
        },
    },
}


---------- Init ---------
RaidCDs.roster = {} -- active group/raid roster with their respective information
--[[
RaidCDs.roster = {
    ["Draintrain"] = {
        ["class"] = "WARLOCK",
        ["dead"] = true / false,
        ["connected"] = true / false,
        ["spells"] = {
            [GetSpellInfo(32523)] = {
                expTime = 26234982,
                dstName = nil / "Waklj",
                spellID = 32523,
            },
        },
        ["talents"] = {
            [1] = {
                [13] = 3,
            },
        },
        ["spec"] = "Affliction",
        ["glyphs"] = {
            [1] = 28952,
        },
        ["role"] = RDps,
        ["pet"] = {
            ["name"] = "Felhunt",
            ["type"] = "Felhunter",
        },
    },
}
]]
RaidCDs.getPetOwner = {} -- map pet name to owner name for pet spell tracking
RaidCDs.inactiveRoster = {} -- move tracked members to inactive members on group leave
RaidCDs.CDListeners = {} -- send updates to external weakauras if requested
RaidCDs.BLTGlyphLookUpTable = {
    -- enUS / enGB
    ["Glyph of Monsoon"] = 63056,
    ["Glyph of Deterrence"] = 56850,
    ["Glyph of Feign Death"] = 57903,
    ["Glyph of Lay on Hands"] = 57955,
    ["Glyph of Holy Wrath"] = 56420,
    ["Glyph of Fear Ward"] = 55678,
    ["Glyph of Guardian Spirit"] = 63231,
    ["Glyph of Dispersion"] = 63229,
    ["Glyph of Killing Spree"] = 63252,
    ["Glyph of Fire Elemental Totem"] = 55455,
    ["Glyph of Demonic Circle"] = 63309,
    ["Glyph of Last Stand"] = 58376,
    ["Glyph of Shield Wall"] = 63329,
    -- deDE
    ["Glyphe 'Monsun'"] = 63056,
    ["Glyphe 'Abschreckung'"] = 56850,
    ["Glyphe 'Totstellen'"] = 57903,
    ["Glyphe 'Handauflegung'"] = 57955,
    ["Glyphe 'Heiliger Zorn'"] = 56420,
    ["Glyphe 'Furchtzauberschutz'"] = 55678,
    ["Glyphe 'Schutzgeist'"] = 63231,
    ["Glyphe 'Dispersion'"] = 63229,
    ["Glyphe 'Mordlust'"] = 63252,
    ["Glyphe 'Totem des Feuerelementars'"] = 55455,
    ["Glyphe 'Dämonischer Zirkel'"] = 63309,
    ["Glyphe 'Letztes Gefecht'"] = 58376,
    ["Glyphe 'Schildwall'"] = 63329,
}
RaidCDs.roleBySpec = {
    ["DEATHKNIGHT"] = {
        [1] = "Tank", [2] = "MDps", [3] = "MDps",
    },
    ["DRUID"] = {
        [1] = "RDps", [2] = "MDps", [3] = "Heal",
    },
    ["HUNTER"] = {
        [1] = "RDps", [2] = "RDps", [3] = "RDps",
    },
    ["MAGE"] = {
        [1] = "RDps", [2] = "RDps", [3] = "RDps",
    },
    ["PALADIN"] = {
        [1] = "Heal", [2] = "Tank", [3] = "MDps",
    },
    ["PRIEST"] = {
        [1] = "Heal", [2] = "Heal", [3] = "RDps",
    },
    ["ROGUE"] = {
        [1] = "MDps", [2] = "MDps", [3] = "MDps",
    },
    ["SHAMAN"] = {
        [1] = "RDps", [2] = "MDps", [3] = "Heal",
    },
    ["WARLOCK"] = {
        [1] = "RDps", [2] = "RDps", [3] = "RDps",
    },
    ["WARRIOR"] = {
        [1] = "MDps", [2] = "MDps", [3] = "Tank",
    },
}

-------- Spell Cache -----
local SPELL_PREPARATION = GetSpellInfo(14185)
local SPELL_READINESS = GetSpellInfo(23989)
local SPELL_COLD_SNAP = GetSpellInfo(11958)
local SPELL_EVASION = GetSpellInfo(26669)
local SPELL_SPRINT = GetSpellInfo(11305)
local SPELL_VANISH = GetSpellInfo(26889)
local SPELL_SHADOWSTEP = GetSpellInfo(36554)
local SPELL_BESTIAL_WRATH = GetSpellInfo(19574)
local SPELL_ICE_BLOCK = GetSpellInfo(45438)
local SPELL_AVENGING_WRATH = GetSpellInfo(31884)
local SPELL_DIVINE_SHIELD = GetSpellInfo(642)
local SPELL_DIVINE_PROTECTION = GetSpellInfo(498)
local SPELL_LAY_ON_HANDS = GetSpellInfo(48788)
local SPELL_HAND_OF_PROTECTION = GetSpellInfo(10278)
local SPELL_FORBEARANCE = GetSpellInfo(25771)

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

local function tcontains(t, i)
    for _, v in pairs(t) do
        if v == i then
            return true
        end
    end
    return false
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
        elseif value ~= t2[key] then
            return false
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

local function safeGet(t, ...)
    local current = t
    for i = 1, select("#", ...) do
        local key = select(i, ...)
        if type(current) ~= "table" then
            return nil
        end
        current = current[key]
        if current == nil then
            return nil
        end
    end
    return current
end

local function serialize(...)
    local obj = { ... }
    for i, v in ipairs(obj) do
        obj[i] = tostring(v)
    end
    return tconcat(obj)
end

local function expMonoToEpoch(tMono)
    if not tMono then return nil end
    -- map WA expirationTime (monotonic) -> epoch timestamp
    return tMono + (time() - GetTime())
end

local function expEpochToMono(tEpoch)
    if not tEpoch then return nil end
    -- map epoch timestamp -> WA expirationTime (monotonic)
    return tEpoch - (time() - GetTime())
end

------- Libraries -------
local TalentQuery = LibStub:GetLibrary("LibTalentQuery-1.0", true)
local function LibInitialize()
    if TalentQuery ~= nil then
        TalentQuery.RegisterCallback(RaidCDs, "TalentQuery_Ready")
        RaidCDs.debug("success", "Inspect Library loaded")
    else
        RaidCDs.debug("fail", "Inspect Library failed to load")
        print("|cff47ffb3WA Raid Cooldowns:|r Couldn't load LibTalentQuery-1.0.")
    end
end

---- Glyph / Talent Sync ----
function RaidCDs.handleGlyphInfo(sender, msg)
    if not RaidCDs.roster[sender] then return end
    local glyphs = {}
    for _, glyph in ipairs({ strsplit(",", msg) }) do
        glyph = glyph:match("^%s*(.-)%s*$")
        local glyphID = RaidCDs.BLTGlyphLookUpTable[glyph]
        if glyphID then
            glyphs[#glyphs + 1] = glyphID
        end
    end
    RaidCDs.roster[sender]["glyphs"] = glyphs           -- reset glyphs
end

function RaidCDs.getSpecificTalents(isOtherPlayer, class, talentGroup)
    -- find all relevant talents for "class"
    if not RaidCDs.CDs[class] then return {} end
    local talents = {}
    for spellName, spellInfo in pairs(RaidCDs.CDs[class]) do
        if spellInfo.talentReq then
            local pointsSpent = select(5, GetTalentInfo(spellInfo.tabIndex, spellInfo.talentIndex, isOtherPlayer, false, talentGroup))
            if pointsSpent > 0 then
                talents[spellInfo.tabIndex] = talents[spellInfo.tabIndex] or {}
                talents[spellInfo.tabIndex][spellInfo.talentIndex] = pointsSpent
            end
        end
        if spellInfo.cdMinus then
            local pointsSpent = select(5, GetTalentInfo(spellInfo.cdTabIndex, spellInfo.cdTalentIndex, isOtherPlayer, false, talentGroup))
            if pointsSpent > 0 then
                talents[spellInfo.cdTabIndex] = talents[spellInfo.cdTabIndex] or {}
                talents[spellInfo.cdTabIndex][spellInfo.cdTalentIndex] = pointsSpent
            end
        end
        if spellInfo.cdMinus2 then
            local pointsSpent = select(5, GetTalentInfo(spellInfo.cdTabIndex2, spellInfo.cdTalentIndex2, isOtherPlayer, false, talentGroup))
            if pointsSpent > 0 then
                talents[spellInfo.cdTabIndex2] = talents[spellInfo.cdTabIndex2] or {}
                talents[spellInfo.cdTabIndex2][spellInfo.cdTalentIndex2] = pointsSpent
            end
        end
    end
    return talents
end

function RaidCDs.TalentQuery(unit)
    TalentQuery:Query(unit)
end

function RaidCDs:TalentQuery_Ready(e, name, realm, unitId)
    local rosterUnit = RaidCDs.roster[name]
    if not rosterUnit then
        return
    end
    
    local isOtherPlayer = not UnitIsUnit("player", name)
    local activeGroup = GetActiveTalentGroup(isOtherPlayer)
    local tree1, _, spent1 = GetTalentTabInfo(1, isOtherPlayer, nil, activeGroup)
    local tree2, _, spent2 = GetTalentTabInfo(2, isOtherPlayer, nil, activeGroup)
    local tree3, _, spent3 = GetTalentTabInfo(3, isOtherPlayer, nil, activeGroup)
    local tree = spent1 > spent2 and spent1 > spent3 and tree1 or spent2 > spent3 and tree2 or tree3
    local _, classToken = UnitClass(name)
    
    if tree and classToken then
        rosterUnit["talents"] = RaidCDs.getSpecificTalents(isOtherPlayer, rosterUnit.class, activeGroup)
        rosterUnit.spec = tree
        -- TODO DPS Blood DK / Feral Tank or DPS
        rosterUnit.role = safeGet(RaidCDs.roleBySpec, classToken, spent1 > spent2 and spent1 > spent3 and 1 or spent2 > spent3 and 2 or 3)
        
        RaidCDs.debug(
            "success",
            "query talents ready",
            "Timestamp",
            date(),
            "unitName",
            name,
            "spec",
            tree .. " (" .. spent1 .. "/" .. spent2 .. "/" .. spent3 .. ")"
        )
        
        -- if player is self -> check glyphs
        if not isOtherPlayer then
            local glyphs = {}
            for i = 1, GetNumGlyphSockets() do
                local glyphSpellID = select(3, GetGlyphSocketInfo(i))
                if glyphSpellID then
                    glyphs[#glyphs + 1] = GetSpellInfo(glyphSpellID)
                end
            end
            RaidCDs.handleGlyphInfo(name, tconcat(glyphs, ", "))
        end
    end
    
    RaidCDs.checkCDListeners()
end

----- Listener Management -----
function RaidCDs.addCDListener(event, tarName, RequestCDFunction, previousReturn, SendWAUpdate, ...)
    local identifier = serialize(event, tarName, ...)
    if not RaidCDs.CDListeners[identifier] then
        local now = GetTime()
        RaidCDs.debug("success", "CD Listener added", "identifier", identifier)
        RaidCDs.CDListeners[identifier] = {
            RequestCDFunction = RequestCDFunction,
            previousReturn = previousReturn,
            SendWAUpdate = SendWAUpdate,
            expirationTime = now + 10000,
        }
    end
end
function RaidCDs.removeCDListener(identifier)
    if RaidCDs.CDListeners[identifier] then
        RaidCDs.CDListeners[identifier] = nil
        RaidCDs.debug("success", "CD Listener removed", "identifier", identifier)
    else
        RaidCDs.debug("fail", "failed to remove CD Listener", "identifier", identifier)
    end
end
function RaidCDs.checkCDListeners()
    local now = GetTime()
    for identifier, listener in pairs(RaidCDs.CDListeners) do
        if listener.expirationTime < now then
            RaidCDs.removeCDListener(identifier)
            RaidCDs.debug("fail", "CD Listener removed due to timeout")
        else
            local newReturn = listener.RequestCDFunction()
            if not compareTables(newReturn, listener.previousReturn) then
                listener.previousReturn = newReturn
                RaidCDs.debug("warning", "Send WA Update", "listenerID", identifier, "data", newReturn)
                listener.SendWAUpdate(newReturn)
            end
        end
    end
end

------ Cooldown Core ------
function RaidCDs.getUnitNameCDsBySpellIDs(unitName, spellIDs)
    local spells = {}
    local unitData = safeGet(RaidCDs.roster, unitName)
    if not unitData then
        return spells
    end
    
    if type(spellIDs) ~= "table" then
        spellIDs = { spellIDs }
    end
    
    local now = GetTime()
    local className = unitData["class"] or ""
    
    for _, spellID in pairs(spellIDs) do
        local spellName = GetSpellInfo(spellID) or spellID
        local spellInfo = safeGet(RaidCDs.CDs, className, spellName) or safeGet(RaidCDs.CDs, "ALL", spellName)
        
        if spellInfo then
            local talentSpecced = safeGet(unitData, "talents", spellInfo.tabIndex, spellInfo.talentIndex)
            local petType = safeGet(unitData, "pet", "type")
            
            if (spellInfo.talentReq and talentSpecced and talentSpecced > 0)
            or (spellInfo.petReq and petType == spellInfo.petType)
            or (not spellInfo.talentReq and not spellInfo.petReq)
            then
                local trackedSpell = safeGet(unitData, "spells", spellName)
                local trackedExpTime = trackedSpell and trackedSpell.expTime or nil
                
                spells[spellName] = {
                    ["expTime"] = trackedExpTime and trackedExpTime > now and trackedExpTime or false,
                    ["spellID"] = spellID,
                    ["dstName"] = trackedSpell and trackedSpell.dstName or nil,
                }
            end
        end
    end
    
    return spells
end

function RaidCDs.updateStatus(unitName, isDead, isConnected)
    local unitData = safeGet(RaidCDs.roster, unitName)
    if not unitData then
        return
    end
    
    if unitData.dead ~= isDead then
        unitData.dead = isDead
        RaidCDs.debug("warning", "UNIT_HEALTH: " .. unitName .. " is " .. (isDead and "dead" or "alive"))
        RaidCDs.checkCDListeners()
    end
    
    if unitData.connected ~= isConnected then
        unitData.connected = isConnected
        RaidCDs.debug("warning", "UNIT_HEALTH: " .. unitName .. (isConnected and " connected" or " disconnected"))
        RaidCDs.checkCDListeners()
    end
end

function RaidCDs.getCD(srcName, srcClass, spellName)
    local unitData = safeGet(RaidCDs.roster, srcName)
    local spellInfo = safeGet(RaidCDs.CDs, srcClass, spellName) or safeGet(RaidCDs.CDs, "ALL", spellName)
    if not unitData or not spellInfo then
        return 0
    end
    
    local talents = unitData.talents
    local glyphs = unitData.glyphs
    -- default cd
    local cd = spellInfo.cd
    -- subtract first talent if exists and skilled
    if spellInfo.cdMinus then
        local points = safeGet(talents, spellInfo.cdTabIndex, spellInfo.cdTalentIndex)
        if points then
            cd = cd - points * spellInfo.cdMinusPerPoint
        end
    end
    -- subtract second talent if exists and skilled
    if spellInfo.cdMinus2 then
        local points = safeGet(talents, spellInfo.cdTabIndex2, spellInfo.cdTalentIndex2)
        if points then
            cd = cd - points * spellInfo.cdMinusPerPoint2
        end
    end
    -- subtract glyph if exists and glyphed
    if spellInfo.cdMinusGlyph and glyphs and tcontains(glyphs, spellInfo.glyphId) then
        cd = cd - spellInfo.cdMinusGlyphTime
    end
    
    return cd
end

function RaidCDs.updateCD(srcName, srcClass, dstName, spellID, spellName, spellCD, unforced)
    --spellCD: optional parameter to handle paladin shared cooldowns
    --unforce: optional parameter to only update CD if no longer CD already tracked
    local unitData = safeGet(RaidCDs.roster, srcName)
    if not unitData then return end
    
    local now = GetTime()
    local currentExpTime = safeGet(unitData, "spells", spellName, "expTime")
    local expTime = now + (spellCD or RaidCDs.getCD(srcName, srcClass, spellName))
    
    if unforced then
        -- check if already longer cd tracked
        expTime = max(expTime, currentExpTime or now)
    end
    
    if not currentExpTime or expTime > currentExpTime then
        unitData["spells"][spellName] = {
            ["expTime"] = expTime,
            ["dstName"] = dstName,
            ["spellID"] = spellID,
        }
        RaidCDs.debug("success", "tracked spell added", "source", srcName, "spell", spellName, "dst", dstName, "CD", expTime - now)
        RaidCDs.checkCDListeners()
    end
    
    -- Conditional updates of other spell cooldowns for special cases
    -- use spellCD to prevent infinite loops for paladin abilities
    if not spellCD then
        -- reset abilities: ROGUE Preparation, HUNTER Readiness, MAGE Cold Snap
        if spellName == SPELL_PREPARATION then
            RaidCDs.updateCD(srcName, srcClass, nil, 26669, SPELL_EVASION, 0)
            RaidCDs.updateCD(srcName, srcClass, nil, 11305, SPELL_SPRINT, 0)
            RaidCDs.updateCD(srcName, srcClass, nil, 26889, SPELL_VANISH, 0)
            --RaidCDs.updateCD(srcName, srcClass, nil, 14177, GetSpellInfo(14177), 0) -- Cold Blood
            RaidCDs.updateCD(srcName, srcClass, nil, 36554, SPELL_SHADOWSTEP, 0)
        elseif spellName == SPELL_READINESS then
            for hunterSpellName in pairs(RaidCDs.CDs["HUNTER"]) do
                if hunterSpellName ~= SPELL_READINESS and hunterSpellName ~= SPELL_BESTIAL_WRATH then
                    local hunterSpellID = safeGet(RaidCDs.CDs, "HUNTER", hunterSpellName, "spellID")
                    if hunterSpellID then
                        RaidCDs.updateCD(srcName, srcClass, nil, hunterSpellID, hunterSpellName, 0)
                    end
                end
            end
        elseif spellName == SPELL_COLD_SNAP then
            -- all frost CDs
            RaidCDs.updateCD(srcName, srcClass, nil, 45438, SPELL_ICE_BLOCK, 0)
        end
        
        -- special case paladin shared cooldowns WITHOUT forbearance
        -- Avenging Wrath 31884 -> 30 sec DS, DP, (SelfLOH), BOPthistar
        -- Divine Shield 642 -> 2 min forbearance + 30 sec Wings
        -- Divine Protection 498 -> 2 min forbearance + 30 sec Wings
        -- Lay on Hands 48788 -> 2 min forbearance(SelfLOH) + 30 sec Wings(SelfLOH)
        -- Hand of Protection 10278 -> 2 min forbearance on target + 30 sec Wings on target
        if spellName == SPELL_AVENGING_WRATH then
            RaidCDs.updateCD(srcName, srcClass, nil, 25771, SPELL_FORBEARANCE, 30, true) -- fake forbearance since no real debuff
        elseif spellName == SPELL_DIVINE_SHIELD then
            RaidCDs.updateCD(srcName, srcClass, nil, 31884, SPELL_AVENGING_WRATH, 30, true)
        elseif spellName == SPELL_DIVINE_PROTECTION then
            RaidCDs.updateCD(srcName, srcClass, nil, 31884, SPELL_AVENGING_WRATH, 30, true)
        elseif spellName == SPELL_LAY_ON_HANDS and srcName == dstName then -- SelfLOH
            RaidCDs.updateCD(srcName, srcClass, nil, 31884, SPELL_AVENGING_WRATH, 30, true)
        elseif spellName == SPELL_HAND_OF_PROTECTION and select(2, UnitClass(dstName)) == "PALADIN" then
            RaidCDs.updateCD(dstName, "PALADIN", nil, 31884, SPELL_AVENGING_WRATH, 30, true) -- Wings on target Paladin
        end
    end
end

------ Roster Management ------
function RaidCDs.addMember(unit)
    RaidCDs.roster = RaidCDs.roster or {}
    
    local _, unitClass = UnitClass(unit)
    local unitName = UnitName(unit)
    -- Only add the member if they have a name and aren't already in the roster
    if not unitName or RaidCDs.roster[unitName] then
        return
    end
    -- Check if the member is in the inactive roster
    local inactiveUnit = safeGet(RaidCDs.inactiveRoster, unitName)
    if inactiveUnit then
        -- Move the member from the inactive roster to the active roster
        RaidCDs.roster[unitName] = inactiveUnit
        RaidCDs.inactiveRoster[unitName] = nil
        RaidCDs.roster[unitName].dead = UnitIsDeadOrGhost(unit) or false
        RaidCDs.roster[unitName].connected = UnitIsConnected(unit) and true or false
        RaidCDs.debug("success", "add member (from inactive)", "member", unitName)
    else
        -- Create new player for the active roster from scratch
        RaidCDs.roster[unitName] = {
            ["class"] = unitClass,
            ["dead"] = UnitIsDeadOrGhost(unit) or false,
            ["connected"] = UnitIsConnected(unit) and true or false,
            ["spells"] = {},
        }
        RaidCDs.debug("success", "add member (new)", "member", unitName)
    end
    
    RaidCDs.debug("notification1", "query talents", "Timestamp", date(), "unit", unit)
    RaidCDs.TalentQuery(unit)
end

function RaidCDs.updateRoster()
    local now = GetTime()
    
    -- remove old members not in current roster
    for unitName, unitData in pairs(RaidCDs.roster) do
        if unitName ~= UnitName("player") and not UnitInParty(unitName) and not UnitInRaid(unitName) then
            -- move player to inactive roster if still has cds active
            local cdRunning = false
            for spellName, spellData in pairs(unitData.spells) do
                if spellData.expTime and spellData.expTime > now then
                    cdRunning = true
                    break
                end
            end
            
            if cdRunning then
                RaidCDs.inactiveRoster[unitName] = deepCopy(unitData)
                RaidCDs.debug("success", "remove old member (to inactive)", "member", unitName)
            else
                RaidCDs.debug("success", "remove old member", "member", unitName)
            end
            
            RaidCDs.roster[unitName] = nil
        end
    end
    -- add all missing roster members
    for unit in WA_IterateGroupMembers() do
        local unitName = UnitName(unit)
        -- If a player is Unknown then check back in 5 seconds
        if unitName == UNKNOWN and RaidCDs.UnknownTimer == nil then
            RaidCDs.UnknownTimer = C_Timer.NewTimer(5, function()
                    RaidCDs.debug("fail", "unknown player in roster", "unit", unit)
                    WeakAuras.ScanEvents("RAID_COOLDOWNS", "UPDATE_ROSTER")
            end)
        elseif unitName ~= UNKNOWN and not safeGet(RaidCDs.roster, unitName) then
            RaidCDs.addMember(unit)
            RaidCDs.updateRosterPet(unit)
        end
    end
    --RaidCDs.debug("notification1", "updated roster", "Timestamp", date(), "RaidCDs.roster", RaidCDs.roster)
end

function RaidCDs.updateRosterPet(unit)
    if not unit then return end
    local unitName = UnitName(unit)
    if not safeGet(RaidCDs.roster, unitName) then
        return
    end
    
    local petUnit = unit .. "pet"
    local petName = UnitName(petUnit)
    -- reupdate if unknown pet name
    if petName == UNKNOWN then
        C_Timer.After(1, function()
                WeakAuras.ScanEvents("RAID_COOLDOWNS", "UPDATE_ROSTER_PET", unit)
        end)
        return
    end
    
    local petType = UnitCreatureFamily(petUnit)
    if petName and petType and not UnitIsDeadOrGhost(petUnit) then
        RaidCDs.roster[unitName]["pet"] = {
            ["name"] = petName,
            ["type"] = petType,
        }
        RaidCDs.getPetOwner[petName] = unitName
        RaidCDs.checkCDListeners()
        RaidCDs.debug("success", "update pet info", "member", unitName, "petName", petName, "petType", petType)
    elseif safeGet(RaidCDs.roster, unitName, "pet") then
        RaidCDs.roster[unitName]["pet"] = nil
        RaidCDs.checkCDListeners()
        RaidCDs.debug("success", "remove pet info", "member", unitName)
    end
end

------ Persistence ------
function RaidCDs.pruneRosterCDs(roster, hardRemove)
    -- use conveyed roster or main roster as fallback
    roster = roster or RaidCDs.roster
    if not roster then return false end
    
    local now = GetTime()
    for unitName, unitData in pairs(roster) do
        local spells = unitData.spells or {}
        for spellName, spellData in pairs(spells) do
            if spellData.expTime and spellData.expTime <= now then
                -- remove expired raid cds
                spells[spellName] = nil
            end
        end
        -- hard remove whole players if flag set and spell list empty
        if hardRemove and next(spells) == nil then
            roster[unitName] = nil
        end
    end
    
    return roster
end

-- Turn in-memory roster (with expTime) into a persistent copy (with expEpoch)
function RaidCDs.toPersistent(roster)
    local src = roster or RaidCDs.roster or {}
    local out = deepCopy(src)
    local now = GetTime()
    
    for unitName, unitData in pairs(out) do
        local spells = unitData.spells
        if spells then
            for spellName, spellData in pairs(spells) do
                local exp = spellData.expTime
                -- prune already expired before saving
                if not exp or exp <= now then
                    spells[spellName] = nil
                else
                    spellData.expEpoch = expMonoToEpoch(exp)
                    spellData.expTime = nil
                end
            end
        end
    end
    
    return out
end

-- Turn persistent roster (with expEpoch) back into in-memory (with expTime)
function RaidCDs.fromPersistent(saved, hardRemove)
    local out = deepCopy(saved or {})
    local nowEpoch = time()
    
    for unitName, unitData in pairs(out) do
        local spells = unitData.spells
        if spells then
            for spellName, spellData in pairs(spells) do
                local expEpoch = spellData.expEpoch
                if not expEpoch or expEpoch <= nowEpoch then
                    -- already expired while we were offline -> drop
                    spells[spellName] = nil
                else
                    spellData.expTime = expEpochToMono(expEpoch)
                    spellData.expEpoch = nil
                end
            end
        end
        if hardRemove and (not spells or next(spells) == nil) then
            out[unitName] = nil
        end
    end
    
    return out
end

-------- WA Comms -------
function RaidCDs.getRaidRoles(event, tarName)
    local data = {}
    
    if type(tarName) == "table" then
        for _, unitName in ipairs(tarName) do
            local role = safeGet(RaidCDs.roster, unitName, "role")
            if role then
                data[unitName] = role
            end
        end
    elseif tarName == "ALL" then
        for unitName, unitData in pairs(RaidCDs.roster) do
            if unitData.role then
                data[unitName] = unitData.role
            end
        end
    end
    
    return data
end

function RaidCDs.getIcehowlTrinket(event, tarName)
    local tarData = safeGet(RaidCDs.roster, tarName)
    if not tarData then
        return {}
    end
    
    local data = {}
    local spellIDs = {}
    if select(2, UnitRace(tarName)) == "Human" and not tarData.dead and tarData.connected then
        spellIDs[#spellIDs + 1] = 59752     -- Every Man for Himself
    end
    if tarData.class == "MAGE" and not tarData.dead and tarData.connected then
        spellIDs[#spellIDs + 1] = 1953      -- Blink
    end
    
    data[tarName] = {
        ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(tarName, spellIDs),
    }
    return data
end

function RaidCDs.getExternals(event)
    local data = {}
    for unitName, unitData in pairs(RaidCDs.roster) do
        if not unitData.dead and unitData.connected and not UnitInVehicle(unitName) then
            if unitData.class == "ROGUE" then
                data[unitName] = {
                    ["class"] = "ROGUE",
                    ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, 57934),
                }
            elseif unitData.class == "PRIEST" and safeGet(unitData, "talents", 1, 19) then
                data[unitName] = {
                    ["class"] = "PRIEST",
                    ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, 10060),
                }
            elseif unitData.class == "DEATHKNIGHT" and safeGet(unitData, "talents", 1, 19) then
                data[unitName] = {
                    ["class"] = "DEATHKNIGHT",
                    ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, 49016),
                }
            end
        end
    end
    return data
end

-- Interrupts
function RaidCDs.getInterrupts(event)
    local data = {}
    
    for unitName, unitData in pairs(RaidCDs.roster) do
        if not unitData.dead and unitData.connected and not UnitInVehicle(unitName) then
            local spellIDs = {}
            
            if unitData.class == "WARRIOR" then
                spellIDs[#spellIDs + 1] = 6552    -- Pummel
                spellIDs[#spellIDs + 1] = 72      -- Shield Bash
            elseif unitData.class == "DEATHKNIGHT" then
                spellIDs[#spellIDs + 1] = 47528   -- Mind Freeze
            elseif unitData.class == "ROGUE" then
                spellIDs[#spellIDs + 1] = 1766    -- Kick
            elseif unitData.class == "SHAMAN" then
                spellIDs[#spellIDs + 1] = 57994   -- Wind Shear
            elseif unitData.class == "MAGE" then
                spellIDs[#spellIDs + 1] = 2139    -- Counterspell
            elseif unitData.class == "WARLOCK" then
                spellIDs[#spellIDs + 1] = 19647   -- Spell Lock (Felhunter)
            end
            
            if #spellIDs > 0 then
                data[unitName] = {
                    ["class"] = unitData.class,
                    ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, spellIDs),
                }
            end
        end
    end
    
    return data
end

-- Stuns
function RaidCDs.getStuns(event)
    local data = {}
    
    for unitName, unitData in pairs(RaidCDs.roster) do
        if not unitData.dead and unitData.connected and not UnitInVehicle(unitName) then
            local spellIDs = {}
            
            if unitData.class == "WARRIOR" then
                spellIDs[#spellIDs + 1] = 12809   -- Concussion Blow
                spellIDs[#spellIDs + 1] = 46968   -- Shockwave
                spellIDs[#spellIDs + 1] = 7922    -- Charge Stun
                spellIDs[#spellIDs + 1] = 20253   -- Intercept Stun
            elseif unitData.class == "DEATHKNIGHT" then
                spellIDs[#spellIDs + 1] = 47481   -- Gnaw (Ghoul)
            elseif unitData.class == "ROGUE" then
                spellIDs[#spellIDs + 1] = 8643    -- Kidney Shot
            elseif unitData.class == "PALADIN" then
                spellIDs[#spellIDs + 1] = 10308   -- Hammer of Justice
            elseif unitData.class == "DRUID" then
                spellIDs[#spellIDs + 1] = 8983    -- Bash
                spellIDs[#spellIDs + 1] = 61384   -- Typhoon
            elseif unitData.class == "MAGE" then
                spellIDs[#spellIDs + 1] = 44572   -- Deep Freeze
            elseif unitData.class == "WARLOCK" then
                spellIDs[#spellIDs + 1] = 47847   -- Shadowfury
            elseif unitData.class == "SHAMAN" then
                spellIDs[#spellIDs + 1] = 59159   -- Thunderstorm
            end
            
            if #spellIDs > 0 then
                data[unitName] = {
                    ["class"] = unitData.class,
                    ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, spellIDs),
                }
            end
        end
    end
    
    return data
end

function RaidCDs.getFestergutImmune(event, tarName)
    local data = {}
    -- get target cds
    -- PALADIN: Divine Shield
    -- DEATHKNIGHT: AMS, Icebound
    -- DRUID: Barkskin
    -- WARRIOR: Shield Wall
    -- PRIEST: Dispersion
    -- MAGE: Ice Block
    local tarData = safeGet(RaidCDs.roster, tarName)
    if tarData and not tarData.dead and tarData.connected then
        local spellIDs = {}
        if tarData.class == "PALADIN" then
            spellIDs[1] = 642                   -- Divine Shield
            spellIDs[2] = 25771                    -- Forbearance
        elseif tarData.class == "DEATHKNIGHT" then
            spellIDs[1] = 48707                 -- AMS
            spellIDs[2] = 48792                 -- Icebound
        elseif tarData.class == "DRUID" then
            spellIDs[1] = 22812                 -- Barkskin
        elseif tarData.class == "WARRIOR" then
            spellIDs[1] = 871                   -- Shield Wall
        elseif tarData.class == "PRIEST" then
            spellIDs[1] = 47585                 -- Dispersion
        elseif tarData.class == "MAGE" then
            spellIDs[1] = 45438                 -- Ice Block
        end
        data[tarName] = {
            ["class"] = tarData.class,
            ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(tarName, spellIDs),
        }
    end
    
    return data
end

function RaidCDs.getProfImmune(event, tarName)
    local data = {}
    -- get all BOPs
    for unitName, unitData in pairs(RaidCDs.roster) do
        if unitData.class == "PALADIN" and not unitData.dead and unitData.connected and not UnitInVehicle(unitName) then
            data[unitName] = {
                ["class"] = "PALADIN",
                ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(unitName, 10278),
            }
        end
    end
    -- get target cds
    -- PALADIN: Divine Shield, BOP
    -- HUNTER: Feign Death
    -- ROGUE: Vanish (PROF_VOLATILE) / Cloak of Shadows (PROF_GASEOUS)
    -- PRIEST: Dispersion (PROF_VOLATILE)
    -- MAGE: Ice Block, Blink, Cold Snap - Hypothermia
    -- WARLOCK: Demonic Circle: Teleport (Needs Buff)
    -- ALL: Forbearance
    local tarData = safeGet(RaidCDs.roster, tarName)
    if tarData and not tarData.dead and tarData.connected then
        local spellIDs = {}
        if tarData.class == "PALADIN" then
            spellIDs[1] = 642                   -- Divine Shield
            spellIDs[2] = 10278                 -- BOP
        elseif tarData.class == "HUNTER" then
            spellIDs[1] = 5384                  -- Feign Death
        elseif tarData.class == "ROGUE" then
            if event == "PROF_VOLATILE" then
                spellIDs[1] = 26889             -- Vanish
            elseif event == "PROF_GASEOUS" then
                spellIDs[1] = 31224             -- Cloak of Shadows
            end
        elseif tarData.class == "PRIEST" then
            if event == "PROF_VOLATILE" and safeGet(tarData, "talents", 3, 27) then
                spellIDs[1] = 47585                -- Dispersion
            end
        elseif tarData.class == "MAGE" then
            spellIDs[1] = 45438                 -- Ice Block
            spellIDs[2] = 1953                  -- Blink
        elseif tarData.class == "WARLOCK" then
            spellIDs[1] = 48020                 -- Demonic Circle: Teleport
        end
        spellIDs[#spellIDs + 1] = 25771         -- Forbearance
        data[tarName] = {
            ["class"] = tarData.class,
            ["spells"] = RaidCDs.getUnitNameCDsBySpellIDs(tarName, spellIDs),
        }
    end
    return data
end

function RaidCDs.SendWARequest(event, tarName, ...)
    -- Preserve all trailing arguments exactly as received so they can be
    -- forwarded unchanged both for the initial ScanEvents call and for any
    -- later listener-driven updates.
    local extraArgs = { ... }
    
    -- Map each supported WA request event to the function that generates
    -- the payload for that event.
    --
    -- The function signatures are intentionally normalized here:
    -- - target-dependent getters receive (event, tarName)
    -- - raid-wide getters ignore tarName if they do not need it
    local requestHandlers = {
        ["PROF_VOLATILE"] = function()
            return RaidCDs.getProfImmune(event, tarName)
        end,
        ["PROF_GASEOUS"] = function()
            return RaidCDs.getProfImmune(event, tarName)
        end,
        ["FESTERGUT_VACCINATION"] = function()
            return RaidCDs.getFestergutImmune(event, tarName)
        end,
        ["RAID_INTERRUPTS"] = function()
            return RaidCDs.getInterrupts(event)
        end,
        ["RAID_STUNS"] = function()
            return RaidCDs.getStuns(event)
        end,
        ["RAID_EXTERNALS"] = function()
            return RaidCDs.getExternals(event)
        end,
        ["ICEHOWL_BREATH"] = function()
            return RaidCDs.getIcehowlTrinket(event, tarName)
        end,
        ["RAID_ROLES"] = function()
            return RaidCDs.getRaidRoles(event, tarName)
        end,
    }
    
    -- Events that should stay "live" need a CD listener so WeakAuras gets
    -- updated automatically whenever the underlying return value changes.
    --
    -- Events not listed here are handled as one-shot requests: they produce
    -- one payload now, but do not create an update listener.
    local listenerEvents = {
        ["PROF_VOLATILE"] = true,
        ["PROF_GASEOUS"] = true,
        ["FESTERGUT_VACCINATION"] = true,
        ["RAID_INTERRUPTS"] = true,
        ["RAID_STUNS"] = true,
        ["RAID_EXTERNALS"] = true,
    }
    
    -- Fallback to an empty table for unsupported/unknown events so that
    -- downstream WeakAuras consumers always receive a defined payload type.
    local requestFunction = requestHandlers[event]
    local data = requestFunction and requestFunction() or {}
    
    -- Register a listener only for events whose result can change over time
    -- and therefore should trigger automatic follow-up updates.
    if requestFunction and listenerEvents[event] then
        RaidCDs.addCDListener(
            event,
            tarName,
            requestFunction,
            data,
            function(updatedData)
                -- Re-fire the same WA event with the refreshed payload while
                -- preserving the original trailing arguments.
                WeakAuras.ScanEvents(event, tarName, updatedData, unpack(extraArgs))
            end,
            ...
        )
    end
    
    RaidCDs.debug("warning", "Send WA Request", "event", event, "tarName", tarName, "data", data)
    -- Send data directly as reponse to the initial request
    WeakAuras.ScanEvents(event, tarName, data, ...)
end

function RaidCDs.StopWARequest(event, tarName, ...)
    RaidCDs.removeCDListener(serialize(event, tarName, ...))
end

-------- Caching --------
function RaidCDs.SaveLastSession()
    if RaidCDs.roster then
        local displays = safeGet(WeakAurasSaved, "displays", RaidCDs.id)
        if not displays then
            return
        end
        displays["lastSession"] = RaidCDs.toPersistent(RaidCDs.pruneRosterCDs())
        displays["lastSessionInactive"] = RaidCDs.toPersistent(RaidCDs.pruneRosterCDs(RaidCDs.inactiveRoster, true))
        RaidCDs.debug("success", "saved last session", "Timestamp", date(), "RaidCDs.roster", RaidCDs.roster, "RaidCDs.inactiveRoster", RaidCDs.inactiveRoster)
    end
end

function RaidCDs.LoadLastSession()
    local savedDisplay = safeGet(WeakAurasSaved, "displays", RaidCDs.id)
    if safeGet(savedDisplay, "lastSession") then
        RaidCDs.roster = RaidCDs.fromPersistent(savedDisplay["lastSession"])
        RaidCDs.inactiveRoster = RaidCDs.fromPersistent(savedDisplay["lastSessionInactive"])
        RaidCDs.debug("success", "loaded last session", "Timestamp", date(), "RaidCDs.roster", RaidCDs.roster, "RaidCDs.inactiveRoster", RaidCDs.inactiveRoster)
    end
end

function RaidCDs.ClearSavedSession()
    local savedDisplay = safeGet(WeakAurasSaved, "displays", RaidCDs.id)
    if savedDisplay then
        savedDisplay["lastSession"] = {}
        savedDisplay["lastSessionInactive"] = {}
        RaidCDs.debug("success", "cleared saved last sessions")
    end
end

LibInitialize()
RaidCDs.debug("success", "aura initialized")