# Load every configuration files in ~/.zsh
for f in $HOME/.zsh/*.zsh; do
    source $f
done

# Prompt

function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt '%B%F{green}' '%f'

zstyle ':prompt:grml:left:setup' items virtual-env change-root \
                                       user at host colon path percent
zstyle ':prompt:grml:right:setup' items vcs rc sad-smiley

zstyle ':prompt:grml:*:items:user' pre '%b%F{yellow}'
zstyle ':prompt:grml:*:items:at' pre '%F{red}'
zstyle ':prompt:grml:*:items:host' pre '%B%F{cyan}'
zstyle ':prompt:grml:*:items:host' post '%F{normal}'

# Separate host and path by a colon
zstyle ':prompt:grml:*:items:host' token '%m:'

# Use normal colors for user entry
zstyle ':prompt:grml:right:items:percent' post '%F{normal}'

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
export PATH="$PATH:$HOME/.local/bin:$HOME/.bin"

# Make ^W break on those chars
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# History
HISTSIZE=10000
SAVEHIST=10000
