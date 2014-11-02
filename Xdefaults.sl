! Hybrid Terminal Colours. Uses the palette from Tomorrow-Night:
! https://github.com/chriskempson/tomorrow-theme/blob/master/vim/colors/Tomorrow-Night.vim
! vim: ft=xdefaults

*background: #1D1F21
*foreground: #C5C8C6
! black
*color0: #282A2E
*color8: #373B41
! red
*color1: #A54242
*color9: #CC6666
! green
*color2: #8C9440
*color10: #B5BD68
! yellow
*color3: #DE935F
*color11: #F0C674
! blue
*color4: #5F819D
*color12: #81A2BE
! magenta
*color5: #85678F
*color13: #B294BB
! cyan
*color6: #5E8D87
*color14: #8ABEB7
! white
*color7: #707880
*color15: #C5C8C6

Xft.dpi: 96
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault

! URxvt settings
URxvt*font: xft:Terminus:8
URxvt*scrollBar:                        false
URxvt*scrollTtyKeypress:                true
URxvt*urgentOnBell:                     true
URxvt*visualBell:                       true
URxvt*mouseWheelScrollPage:             true
URxvt*cursorBlink:                      true
URxvt*internalBorder:                   3
URxvt*tab-bg:                           2
URxvt*tab-fg:                           0
URxvt*tabbar-bg:                        3
URxvt*tabbar-fg:                        0
URxvt*perl-ext-common:                  default,matcher,tabbed,vtwheel,fullscreen,clipboard
URxvt*url-launcher:                     /usr/bin/firefox
URxvt*matcher.button:                   1
URxvt*colorUL:                          #4682B4
URxvt*keysym.F11:                       perl:fullscreen:switch
