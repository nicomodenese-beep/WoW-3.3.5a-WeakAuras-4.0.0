from pathlib import Path
import json
import zlib

import pytest
from codec import ALPHABET, LIMIT, bits, decode, encode
from project import pack, unpack

FIXTURE = Path(__file__).parent / "fixtures/group.txt"


def test_edit(tmp_path):
    folder = tmp_path / "group"
    unpack(FIXTURE, folder)
    original = FIXTURE.read_text()
    assert pack(folder) == original
    expected = decode(original)
    child = expected["c"][2]
    assert child["unknown"][4] == "Grüße"
    assert expected["c"][1]["parent"] == "Root"
    assert len(child["triggers"]) == 2
    fields = json.loads((folder / "fields.json").read_text())
    assert len(fields) == 3
    name = next(k for k, v in fields.items() if "actions" in v)
    code = "-- Grüße\nlocal x = 2"
    (folder / name).write_bytes(code.encode())
    child["actions"]["init"]["custom"] = code
    assert decode(pack(folder)) == expected
    with pytest.raises(ValueError):
        unpack(FIXTURE, folder)


@pytest.mark.parametrize("bad", ["!WA:1!test", "!WA:2!a", "!WA:2!%%%%", "!WA:2!abcd"])
def test_invalid(bad):
    with pytest.raises((ValueError, zlib.error)):
        decode(bad)


def test_limit():
    stream = zlib.compressobj(wbits=-15)
    packed = stream.compress(bytes(LIMIT + 1)) + stream.flush()
    with pytest.raises(ValueError):
        decode("!WA:2!" + "".join(ALPHABET[i] for i in bits(packed, 8, 6)))


def test_types():
    root = {"m": "d", "d": {1: False, 2: -123, 3: 0.25, "x": "✓"}}
    assert decode(encode(root)) == root
