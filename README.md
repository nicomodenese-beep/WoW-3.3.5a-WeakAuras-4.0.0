# WeakAuras für WoW 3.3.5a

Arbeitsplatz für mehrere Auren auf Warmane und Rising Gods, Zielclient Build 12340. Die Zuordnung des installierten Bunny68-Builds ist noch offen. Die Formatwerkzeuge sind gegen Bibliotheken des WotLK-Vergleichstags 4.0.0 getestet.

Python 3.12 und uv installieren, den Projektordner in VS Code öffnen und die empfohlene Lua-Erweiterung aktivieren. Im Repository ausführen:

```sh
uv sync --frozen
uv run pytest
uv run ruff check tools tests
uv run python tools/import_aura.py tests/fixtures/group.txt auras/meine-gruppe
uv run python tools/validate_auras.py
uv run python tools/export_aura.py auras/meine-gruppe bearbeitet.txt
```

Das Beispiel ist ein synthetischer Codec-Test. Für eine spielbare Aura die erste Eingabedatei durch einen eigenen Export ersetzen. Die Feldzuordnung steht in `fields.json`. Änderungen über einen eigenen Branch und Pull Request weitergeben.

[Entwicklung](docs/development.md) · [Dateiformat](docs/aura-format.md) · [Kompatibilität](docs/compatibility.md) · [Interna](docs/weakauras-internals.md) · [Quellen](api/SOURCES.md)
