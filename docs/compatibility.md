# Kompatibilität

Standardziel ist Lua 5.1 im Client 3.3.5a Build 12340. UnitAura liefert den Rang als zweiten Wert. Für COMBAT_LOG_EVENT_UNFILTERED kommen die Parameter direkt mit dem Event. Die ersten acht sind Zeitstempel, Unterereignis, Quell-GUID, Quellname, Quellflags, Ziel-GUID, Zielname und Zielflags. Die folgenden Werte hängen vom Unterereignis ab. Retail-Beispiele mit CombatLogGetCurrentEventInfo benötigen eine Portierung.

AwesomeWotLK bietet unter anderem C_NamePlate, zusätzliche Unit-Abfragen, Transmog- und Fensterfunktionen. Für das optionale Profil awesomewotlk.code-workspace öffnen. Vor der Verwendung etwa mit `if C_NamePlate and C_NamePlate.GetNamePlateForUnit then ... end` prüfen. Als Fallback die optionale Anzeige auslassen. NAME_PLATE_UNIT_ADDED und NAME_PLATE_UNIT_REMOVED liefern die Unit-ID. Standard-WotLK kennt diese Erweiterungen nicht.

LuaLS liefert Editorhinweise. Weder der Validator noch ein bestandener Roundtrip bestätigen Verfügbarkeit und Verhalten auf einem konkreten Server.
