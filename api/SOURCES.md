# Quellen und Prüfstand

| Quelle | Stand und verwendete Dateien | Aussage |
|---|---|---|
| [Bunny67/WeakAuras-WotLK](https://github.com/Bunny67/WeakAuras-WotLK/tree/5b388e15f939006e89221e600c619ce363cad5af) | Tag 4.0.0, Commit 5b388e15f939006e89221e600c619ce363cad5af. WeakAuras.toc, WeakAuras.lua, AuraEnvironment.lua, GenericTrigger.lua, Transmission.lua, Libs/LibSerialize und Libs/LibDeflate | TOC 30300 und Version 4.0.0 bestätigt. Vergleichsstand für WA-Stubs und Codec. master, alpha und beta zeigen auf andere Commits. Release-Metadaten und Zuordnung zu Bunny68 offen. |
| [tekkub/wow-ui-source](https://github.com/tekkub/wow-ui-source/tree/c4e0255fc574598428ee1c25f160ab949798bc98) | Tag 3.3.5, Commit c4e0255fc574598428ee1c25f160ab949798bc98. FrameXML/BuffFrame.lua, MultiCastActionBarFrame.lua, UIParent.lua, AddOns/Blizzard_CombatLog, Blizzard_ArenaUI | Historische Aufrufstellen für Auren, Zauber, Arena und Kampflog. Kein vollständiges Verzeichnis der nativen Engine-Signaturen. |
| [FrostAtom/awesome_wotlk](https://github.com/FrostAtom/awesome_wotlk/blob/3cbae1e3f7dc0a676b9391d7b6c2a09c33e02ef8/docs/api_reference.md) | main, Commit 3cbae1e3f7dc0a676b9391d7b6c2a09c33e02ef8, docs/api_reference.md | Zehn dokumentierte optionale Funktionen, Nameplate-Events und CVars. Installierte Clientvariante separat prüfen. |

Die Standarddefinitionen sind eine Auswahl gebräuchlicher Aufrufe. Die Typen stammen aus beobachteter Verwendung und dokumentieren teilweise nur die für Auren relevanten Rückgaben. Die WA-Definitionen sind bis zum Vergleich mit dem installierten Add-on vorläufig.
