alias mv='mv -i -v'
alias rm='rm -i -v'

alias tree='tree -sD --dirsfirst -C -A -h'
alias hd='od -Ax -tx1z -v'
# Keep colors when piping
alias less='less -r'

alias p='_(){ ([[ $# -eq 0 ]] && ping google.com) || ping $1 }; _'

alias irc='mosh weechat@pluggi.fr'

alias gdb='gdb -quiet'

alias sr='ssh -l root'
alias root='sudo su'

alias yt-audio="youtube-dl -f bestaudio"
alias yt-video="youtube-dl -f 'bestvideo+bestaudio/bestvideo+bestaudio'"
