from pathlib import Path

from lupa.lua51 import LuaRuntime
from project import pack, read, snippets
from codec import decode

ROOT = Path(__file__).resolve().parents[1]


def validate():
    compile_only = LuaRuntime().eval(
        "function(s) local f,e=loadstring(s); return f ~= nil,e end"
    )
    for path in (ROOT / "api").rglob("*.lua"):
        ok, error = compile_only(read(path))
        if not ok:
            raise ValueError(f"{path}: {error}")
    for folder in sorted((ROOT / "auras").iterdir()):
        if folder.is_dir():
            result = decode(pack(folder))
            for name, path, parent in snippets(result):
                code = parent[path[-1]]
                body = path[-1] == "custom" and (
                    "actions" in path or "conditions" in path
                )
                ok, error = compile_only(code if body else "return " + code)
                if not ok:
                    raise ValueError(f"{folder / name}: {error}")


if __name__ == "__main__":
    validate()
