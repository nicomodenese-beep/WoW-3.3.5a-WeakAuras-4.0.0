# Projektregeln

Ziel ist WoW 3.3.5a Build 12340 mit Lua 5.1 und Bunny68 WeakAuras 4.0.0. Die offene Quellzuordnung in api/SOURCES.md berücksichtigen. Signaturen mit historischen Aufrufstellen und dem Zielbuild prüfen. Retail-APIs erfordern einen ausdrücklichen Auftrag. AwesomeWotLK separat kennzeichnen, Verfügbarkeit prüfen und einen Standardpfad erhalten.

Eine Änderung auf die betroffene Aura begrenzen. Altes Verhalten und unbekannte Metadaten erhalten. Gemeinsame Logik nur zentralisieren, wenn die Auslieferung im Spiel sichergestellt ist. Keine impliziten Globals. Events vor Every-Frame wählen, Combat-Log-Unterereignis und GUID früh filtern, Zeitbasis und Argumentfolge prüfen. Im häufigen Pfad Tabellen und Strings wiederverwenden. Timer beenden und ScanEvents-Schleifen vermeiden.

TSU nutzt stabile Clone-Schlüssel. Nur geänderte States melden, Entfernen und erneutes Anzeigen testen. Custom Variables mit State-Typen und Conditions abgleichen. Bei dynamischen Gruppen Sortierung, leere Gruppe und mehrere gleichzeitige Clones prüfen.

Originalexport sichern, fremden Code niemals bei Import oder Tests ausführen, Größenlimits beibehalten. Unbekannte API als offen dokumentieren. Vor einem PR den Workflow in docs/development.md ausführen. Lua-Mocks prüfen Logik. Die Endabnahme erfolgt im Zielclient.
