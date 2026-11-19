import argparse
from pathlib import Path
from zlib import error

from project import unpack

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Aura in einen neuen Ordner entpacken")
    parser.add_argument("source", type=Path)
    parser.add_argument("target", type=Path)
    args = parser.parse_args()
    try:
        unpack(args.source, args.target)
    except (OSError, ValueError, error) as exc:
        parser.exit(1, f"Import: {exc}\n")
