# base alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -l"
alias la="ls -a"
alias ll="ls -lah"
alias md="mkdir -p"
alias c='clear'
alias mv="mv -i"
alias rm='rm -i'
alias slink="link -s"
alias duh='du -h -d 1'
alias n='nvidia-smi'

# cli-tools alias
# alias vim='nvim'
# alias s='neofetch'
alias nf='neofetch'
alias ta='tmux a'
alias t='tmux'
alias cs='calcurse'
alias ra='ranger'
alias r='echo $RANGER_LEVEL'
alias lg='lazygit'

# git alias
alias gs="git status"
alias gsm="git summary"
alias ga='git add'
alias gd='git diff'
alias gf='git fetch'
alias grv='git remote -v'
alias grb='git rebase'
alias gbr='git branch'
alias gpl="git pull"
alias gps="git push"
alias gco="git checkout"
alias gl="git log"
alias gc="git commit -m"
alias gm="git merge"

# my-linux-alias
alias chromium-v='chromium --proxy-server="socks5://127.0.0.1:1080"'
alias fs='flameshot full -p ~/Pictures/Screenshots'

# Usage: psfind <keywords> (RegExp supported)
function psfind() {
    ps aux | head -n 1
    ps aux | grep -E $1 | grep -v grep
}

# other cw alias

# alias vb='vi ~/.bashrc'
# alias sb='. ~/.bashrc'
# alias sc='screen'
# alias nvfind='fuser -v /dev/nvidia*'
# alias nving='watch -n 0.1 nvidia-smi'


# alias gc='git config credential.helper store'
# alias gs='git config credential.helper store'
# alias bat='sudo tlp bat'
# alias ac='sudo tlp ac'
# alias gy='git-yolo'
# alias nb='newsboat -r'
# alias dv='deactivate'
# alias ipy='ipython'
# alias ms='mailsync'
# alias mt='neomutt'
# alias pu='python3 -m pudb'
# alias sra='sudo -E ranger'
# alias sudo='sudo -E'
# alias nt="sh -c 'cd $(pwd); st' > /dev/null 2>&1 &"
# alias lo='lsof -p $(fps) +w'
# alias av='source venv/bin/activate'
# alias cdiff='colordiff'
# alias g='onefetch'

# ra() {
	#if [ -z "$RANGER_LEVEL" ]
	#then
		#ranger
	#else
		#exit
	#fi
#}
