#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import netifaces

from i3pystatus import Status

status = Status()

status.register("clock", format="%a %d %b %T",)

status.register("load", format="{avg1}")

status.register("temp", format="{temp:.0f}°C",)

status.register("battery",
                alert=True,
                alert_percentage=25,
                format="{status} {percentage:.2f}% {consumption:.2f}W "
                       "{remaining:%h:%M:%S}")

for interface in netifaces.interfaces():
    if interface.startswith(("en", "eth", "br")):
        status.register("network", interface=interface,
                        format_down="",
                        format_up="{interface}: {v4cidr}")
    elif interface.startswith("wl"):
        status.register("network", interface=interface,
                        format_down="",
                        format_up="{interface}: {essid} "
                                  "{quality:03.0f}% ({v4cidr})")

for path in ("/home", "/"):
    status.register("disk",
                    path=path,
                    format=path + ": {avail}G")

status.register("pulseaudio",
                format="VOL: {volume}% {volume_bar}")

status.run()
