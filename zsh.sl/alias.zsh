alias l='ls -lh'
alias ls='ls --color=auto'
alias tree='tree -sD --dirsfirst -C -A -h'
alias hd='od -Ax -tx1z -v'
# Keep colors when piping
alias less='less -r'
alias ocaml='rlwrap ocaml'

alias ..='cd ..'
alias ....='cd ../..'

alias p='_(){ ([[ $# -eq 0 ]] && ping google.com) || ping $1 }; _'

alias irc='mosh weechat@pluggi.fr'

alias gdb='gdb -quiet'

alias sr='ssh -l root'
alias root='sudo su'

alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias cdtmp='cd $(mktemp -d)'

alias yt-audio="youtube-dl -f bestaudio"
alias yt-video="youtube-dl -f 'bestvideo+bestaudio/bestvideo+bestaudio'"
