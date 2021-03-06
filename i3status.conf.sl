# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
    colors = true
    interval = 1
    color_good = '#568081'
    color_degraded = '#b58900'
    color_bad = '#B14D4C'
}

order += "disk /"
order += "disk /home"
order += "wireless wlp2s0"
order += "ethernet enp3s0f1"
order += "battery 0"
order += "load"
order += "tztime local"

wireless wlp2s0 {
    format_up = "W: (%quality %essid) %ip"
    format_down = "W: down"
}

ethernet enp3s0f1 {
    # if you use %speed, i3status requires root privileges
    format_up = "E: %ip (%speed)"
    format_down = "E: down"
}

battery 0 {
    format = "%status %percentage %remaining"
}

tztime local {
    format = "%a %d %b %T"
}

load {
    format = "%1min"
}

disk "/" {
    format = "/root: %avail"
}

disk "/home" {
    format = "/home: %avail"
}
