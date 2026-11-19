"""Original export is authoritative; deterministic field paths bind editable snippets."""

import hashlib
import json
from pathlib import Path

from codec import LIMIT, decode, encode

FIELDS = set(
    "custom customVariables customDuration customText customName customIcon customTexture customStacks customTriggerLogic customGrow customSort customAnchor customFunction".split()
)


def read(path, limit=LIMIT):
    with path.open("rb") as file:
        raw = file.read(limit + 1)
    if len(raw) > limit:
        raise ValueError(f"Datei zu groß: {path}")
    return raw.decode("utf8")


def snippets(table, path=()):
    for key, value in table.items():
        address = (*path, key)
        if isinstance(value, dict):
            yield from snippets(value, address)
        elif key in FIELDS and isinstance(value, str) and value:
            digest = hashlib.sha256(json.dumps(address).encode()).hexdigest()[:24]
            yield digest + ".lua", address, table


def unpack(source, target):
    from tempfile import TemporaryDirectory

    original = read(source)
    root = decode(original.strip())
    if target.exists():
        raise ValueError("Ziel existiert bereits")
    target.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(dir=target.parent) as tmp:
        stage = Path(tmp) / "aura"
        stage.mkdir()
        (stage / "original.txt").write_bytes(original.encode())
        index = {}
        for name, path, parent in snippets(root):
            (stage / name).write_bytes(parent[path[-1]].encode())
            index[name] = path
        (stage / "fields.json").write_text(
            json.dumps(index, indent=2, ensure_ascii=False), encoding="utf8"
        )
        stage.rename(target)


def pack(folder):
    original = read(folder / "original.txt").strip()
    root = decode(original)
    changed = False
    total = 0
    names = set()
    for name, path, parent in snippets(root):
        names.add(name)
        value = read(folder / name, LIMIT - total)
        total += len(value.encode())
        changed |= value != parent[path[-1]]
        parent[path[-1]] = value
    if names != {p.name for p in folder.glob("*.lua")}:
        raise ValueError("Unzugeordnete Lua-Datei")
    return encode(root) if changed else original
