# Load every configuration files in ~/.zsh
for f in ~/.zsh/*; do source $f; done

# Environment variables
export EDITOR=vim

autoload -U colors
colors

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

PROMPT="%{$fg[$NCOLOR]%}%~ ➤ %{$reset_color%}"
RPROMPT="%{$fg[$NCOLOR]%}%p %D{%d %b %H:%M}%{$reset_color%}"

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

autoload -zU compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

setopt extendedglob
# `correct' turns on spelling correction for all commands
setopt correct
# `correctall' turns on spelling correction for all arguments
setopt correctall

# History

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# `histignoredups' prevents the current line from being saved in the history if
# it is the same as the previous one
setopt histignoredups

# `histignorespace' prevents the current line from being saved if it begins
# with a space
setopt histignorespace

# `noclobber' prevents you from accidentally overwriting an existing file
setopt noclobber
