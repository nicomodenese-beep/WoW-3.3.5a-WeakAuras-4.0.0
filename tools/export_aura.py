import argparse
from pathlib import Path
from zlib import error

from project import pack

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Bearbeitete Aura exportieren")
    parser.add_argument("folder", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    try:
        result = pack(args.folder)
        with args.output.open("x", encoding="ascii") as file:
            file.write(result)
    except (ValueError, OSError, error) as exc:
        parser.exit(1, f"Export: {exc}\n")
