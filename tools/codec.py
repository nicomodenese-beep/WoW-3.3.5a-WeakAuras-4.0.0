"""Bounded reader for the LibSerialize v1 tree subset and LibDeflate print encoding."""

import math
import struct
import zlib

LIMIT = 4 * 1024 * 1024
ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789()"


def bits(values, width, target):
    pending = count = 0
    for value in values:
        pending |= value << count
        count += width
        while count >= target:
            yield pending & ((1 << target) - 1)
            pending >>= target
            count -= target
    if width > target and count:
        yield pending
    elif pending:
        raise ValueError("Ungültige Endbits")


class Reader:
    def __init__(self, raw):
        self.raw = raw
        self.pos = self.nodes = self.expanded = 0
        self.strings = []

    def take(self, n):
        end = self.pos + n
        if end > len(self.raw):
            raise ValueError("Abgeschnittene Daten")
        data = self.raw[self.pos : end]
        self.pos = end
        return data

    def integer(self, n):
        return int.from_bytes(self.take(n), "big")

    def string(self, n):
        value = self.take(n).decode("utf8")
        if n > 2:
            self.strings.append(value)
        return value

    def table(self, array, mapping, depth):
        if array + mapping > 100000:
            raise ValueError("Tabelle zu groß")
        result = {i: self.read(depth + 1) for i in range(1, array + 1)}
        for _ in range(mapping):
            key = self.read(depth + 1)
            if type(key) not in (str, int, float) or key in result:
                raise ValueError("Nicht unterstützter Tabellenschlüssel")
            result[key] = self.read(depth + 1)
        return result

    def read(self, depth=0):
        self.nodes += 1
        if depth > 80 or self.nodes > 100000:
            raise ValueError("Strukturlimit überschritten")
        b = self.integer(1)
        if b & 1:
            return b >> 1
        if b % 4 == 2:
            kind, n = (b >> 2) % 4, b >> 4
            if kind == 0:
                return self.string(n)
            if kind == 3:
                return self.table(n % 4 + 1, n // 4 + 1, depth)
            return self.table(n if kind == 2 else 0, n if kind == 1 else 0, depth)
        if b % 8 == 4:
            n = (self.integer(1) << 4) + (b >> 4)
            return -n if b & 8 else n
        kind = b >> 3
        if 1 <= kind <= 8:
            n = self.integer((2, 3, 4, 7)[(kind - 1) // 2])
            return n if kind % 2 else -n
        if kind in (9, 10, 11):
            n = (
                struct.unpack(">d", self.take(8))[0]
                if kind == 9
                else float(self.take(self.integer(1)))
            )
            if not math.isfinite(n):
                raise ValueError("Nichtendliche Zahl")
            return -n if kind == 11 else n
        if kind in (12, 13):
            return kind == 12
        if 14 <= kind <= 28:
            width = (kind - 14) % 3 + 1
            n = self.integer(width)
            if kind <= 16:
                return self.string(n)
            if kind <= 19:
                return self.table(0, n, depth)
            if kind <= 22:
                return self.table(n, 0, depth)
            if kind <= 25:
                return self.table(n, self.integer(width), depth)
            if 1 <= n <= len(self.strings):
                value = self.strings[n - 1]
                self.expanded += len(value.encode())
                if self.expanded <= LIMIT:
                    return value
        raise ValueError("Nicht unterstützte Referenz oder Typkennung")


def decode(text):
    if not text.startswith("!WA:2!") or len(text) > LIMIT:
        raise ValueError("Erwartet wird ein begrenzter !WA:2!-Export")
    payload = text[6:]
    if len(payload) % 4 == 1:
        raise ValueError("Ungültige Print-Länge")
    packed = bytes(bits((ALPHABET.index(c) for c in payload), 6, 8))
    stream = zlib.decompressobj(-15)
    reader = Reader(stream.decompress(packed, LIMIT + 1))
    if (
        len(reader.raw) > LIMIT
        or not stream.eof
        or stream.unused_data
        or reader.take(1) != b"\x01"
    ):
        raise ValueError("DEFLATE-Limit oder Formatfehler")
    value = reader.read()
    if (
        reader.pos != len(reader.raw)
        or not isinstance(value, dict)
        or value.get("m") != "d"
        or not isinstance(value.get("d"), dict)
    ):
        raise ValueError("Ungültiger Aura-Umschlag")
    return value


def encode(value):
    data = bytearray([1])

    def write(v):
        if isinstance(v, dict):
            data.append(19 * 8)
            data.extend(len(v).to_bytes(3, "big"))
            for k, item in v.items():
                write(k)
                write(item)
        elif isinstance(v, str):
            raw = v.encode()
            data.append(16 * 8)
            data.extend(len(raw).to_bytes(3, "big"))
            data.extend(raw)
        elif isinstance(v, bool):
            data.append(96 if v else 104)
        elif isinstance(v, int):
            data.append(56 if v >= 0 else 64)
            data.extend(abs(v).to_bytes(7, "big"))
        else:
            data.append(72)
            data.extend(struct.pack(">d", v))
        if len(data) > LIMIT:
            raise ValueError("Ausgabe zu groß")

    write(value)
    stream = zlib.compressobj(wbits=-15)
    packed = stream.compress(data) + stream.flush()
    result = "!WA:2!" + "".join(ALPHABET[i] for i in bits(packed, 8, 6))
    if len(result) > LIMIT:
        raise ValueError("Export zu groß")
    return result
