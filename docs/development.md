# Entwicklung

Unter Windows und in der Cloud gelten dieselben uv-Befehle aus der README. Für jede unabhängige Änderung von aktuellem main einen Branch erstellen, etwa mit `git switch -c aura/raidwarnung`. Verschiedene Auren in getrennten Ordnern bearbeiten. Codex-Cloud-Tasks haben isolierte Checkouts.

1. In /wa die oberste Gruppe exportieren und den Text als UTF-8-Datei sichern. Den Versionsstand der drei Zielkomponenten mit der Aura dokumentieren.
2. Import auf einen neuen Unterordner von auras anwenden. In fields.json nach dem Triggerpfad suchen und die zugehörige Lua-Datei bearbeiten.
3. Tests, Ruff und Validator aus der README ausführen. Bei unbekannten Globals die API-Quelle prüfen. Lua-Ausdrücke wie anonyme Funktionen sind im Spiel eingebettete Ausdrücke. Der Validator ergänzt beim Kompilieren den Kontext.
4. Original und Änderungen gemeinsam committen. Im PR erwartetes Verhalten, Events und Tests nennen.
5. Auf dem Heim-PC Branch abrufen und in eine neue Datei exportieren. Vor dem Import die aktuelle Aura im Spiel sichern. In einem Testprofil Import, Reload, Aktivierung, Aktualisierung, Ausblenden und Gruppenwechsel prüfen. Erst danach das reguläre Profil aktualisieren.
