# WeakAuras-Interna

Die folgenden Beobachtungen betreffen den in SOURCES.md festgehaltenen Vergleichstag. Zum Nachweis für Bunny68 werden die installierten Quellen oder deren eindeutige Herkunft benötigt.

## Trigger und Zustände

GenericTrigger.lua übersetzt die Konfiguration eines Custom-Triggers in verschiedene Funktionen. Event und Status verwenden den Trigger als Prädikat. Ein eigener Untrigger steuert bei entsprechender Konfiguration das Ausblenden. Dauer, Icon, Name und Stapel können eigene Rückruffunktionen haben. Der Zweig stateupdate behandelt diese Felder anders. Ein TSU erhält die Zustandstabelle vor dem Eventnamen und aktualisiert einen Eintrag pro Clone-ID. Für eine einzelne Instanz eignet sich der leere String.

Bei einer tatsächlichen Änderung show und changed setzen, Änderungen am selben Clone im bestehenden State zusammenführen und true zurückgeben. Zum Ausblenden show=false und changed=true melden. Bei zeitlichem Fortschritt duration und expirationTime in Sekunden der GetTime-Zeitbasis angeben. Bei statischem Fortschritt value und total pflegen. stacks ist ein Anzeigewert. autoHide begleitet zeitliche Zustände. Beim Wechsel des Fortschrittstyps veraltete Werte entfernen.

Custom Variables werden im stateupdate-Zweig als zurückzugebender Ausdruck eingebettet. Sie beschreiben für Conditions auswählbare State-Felder. Typ und Schlüssel müssen zum erzeugten State passen. Trigger State, Custom-Variables-Deklaration und Condition getrennt testen.

## Anzeige und Lebenszyklus

AuraEnvironment.lua setzt beim Aktivieren des Kontextes unter anderem state und states. Flüchtige Daten in aura_env führen. Init-, Start- und Finish-Actions haben unterschiedliche Lebenszyklen. Start und Finish können wiederholt laufen. Ressourcen beim Ausblenden freigeben. Dynamische Gruppen ordnen die sichtbaren Kindregionen. Stabile Clone-IDs erhalten die Zuordnung bei neuer Sortierung. Eigene Sortier- und Wachstumsfunktionen dürfen keine Ereignisschleifen erzeugen.

WeakAurasOptions bearbeitet die Konfigurationsdaten. Für die Laufzeitanzeige sind die registrierten RegionTypes zuständig. Options-Code und regionspezifische Frame-Methoden gehören nicht zum portablen Custom-Code-Vertrag.

## Zugriff aus Custom-Code

AuraEnvironment stellt WA_IterateGroupMembers und WA_ClassColorName ausdrücklich bereit. ScanEvents verteilt eigene Events an registrierte Trigger. Namen projektspezifisch wählen und rekursive Wiederauslösung vermeiden. GetRegion(id, cloneId) kann bei angegebener Clone-ID im Vergleichsstand EnsureClone aufrufen. Abfragen haben damit möglicherweise Seiteneffekte.

Das sichtbare WeakAuras-Objekt wird über FakeWeakAuras vermittelt. Erreichbare Implementierungsdetails wie Regionstabellen sind versionsabhängig. Private.GetRegionByUID, Clone-Verwaltung, interne Eventverteiler und Options-Editor sind Add-on-Interna. Für Funktionen aus aktuellen Retail-Anleitungen ist eine konkrete Fundstelle im Zielbuild erforderlich. Eine vollständige Negativliste neuerer APIs ist offen.

## Transport

Transmission.lua serialisiert den Display-Umschlag mit LibSerialize, komprimiert mit LibDeflate und verwendet für Text EncodeForPrint mit Präfix !WA:2!. Die ältere Empfangslogik im Add-on umfasst weitere Versionen. Das Projekt unterstützt den in docs/aura-format.md beschriebenen Ausschnitt. Die Fixture enthält synthetische Daten, die mit beiden Originalbibliotheken des Vergleichstags erzeugt wurden.
