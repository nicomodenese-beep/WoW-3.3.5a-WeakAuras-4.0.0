# Bearbeitungsformat

Jeder Ordner enthält original.txt als unveränderte Quelle. fields.json verbindet Dateinamen mit Schlüsselpfaden einschließlich numerischer Lua-Indizes. Aus dem Pfad entsteht ein SHA-256-Präfix. Namen aus importierten Daten werden nie als Pfade verwendet. Beim Export entsteht die Zuordnung erneut aus dem Original. Änderungen an fields.json sind rein redaktionell.

Unterstützt wird der druckbare Umschlag !WA:2!, gefolgt von LibDeflate-Printdaten, rohem DEFLATE und einer LibSerialize-v1-Tabelle mit m="d" und d als Tabelle. Die Kindliste c, numerische Schlüssel, Gruppenverweise, unbekannte Metadaten und Conditions bleiben im Original. Erkannte Codefelder werden rekursiv extrahiert. Weitere Felder bleiben eingebettet. Leere Felder und neue Trigger lassen sich mit dieser Version im Spiel anlegen.

Die Werkzeuge begrenzen Eingabe und entpackte Daten auf 4 MiB, Tiefe auf 80 und gelesene Werte auf 100000. Nicht-UTF-8-Strings, Tabellenreferenzen, besondere Schlüsseltypen, ältere Exportformate und nichtendliche Zahlen fallen außerhalb des unterstützten Bereichs. Import und Export interpretieren Daten, ohne die enthaltenen Skripte zu starten. Der Validator kompiliert Text mit Lua 5.1. Er prüft weder Laufzeitverhalten noch sämtliche Verweise zwischen Auren.
