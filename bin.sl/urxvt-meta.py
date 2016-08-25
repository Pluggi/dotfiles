#!/usr/bin/env python3

"""
This script aims at adding keysim for composed keys to work in urxvt

The first argument (if it exists) will be used to write the codes into

Example:
./urxvt-meta.py ~/.Xdefaults
"""

import locale
import sys

locale.setlocale(locale.LC_ALL, "")
encoding = locale.getlocale()[1]


def write_codes(file):
    # ASCII range
    for i in range(32, 128):
        seq = "".join("\\{:o}".format(j)
                      for j in chr(i + (1 << 7)).encode(encoding))
        key = "{:#06X}".format(i)

        print("urxvt*keysym.Meta-{}: {}".format(key, seq), file=file)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        with open(sys.argv[1], "a") as f:
            write_codes(f)
    else:
        write_codes(sys.stdout)
