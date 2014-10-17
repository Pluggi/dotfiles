autoload -U colors
colors

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

PROMPT="%{$fg[$NCOLOR]%}%c ➤ %{$reset_color%}"
RPROMPT="%{$fg[$NCOLOR]%}%p %D{%d %b %H:%M}%{$reset_color%}"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

