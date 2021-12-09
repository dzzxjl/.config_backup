# base alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -l"
alias la="ls -a"
alias ll="ls -lah"
alias md="mkdir -p"
alias c='clear'
alias n='nvidia-smi'

# adding flags
alias mv="mv -i"
alias rm='rm -i'
alias slink="ln -s"
alias duh='du -h -d 1'

# linux
alias cb="cd ~/.config_backup"
# deep learning
alias pt="cd ~/project/tutorials/beginner_source/basics"

# big data
alias f="cd /root/bigdata/flink/flink-1.11.3"$
alias k="cd /root/bigdata/kafka/kafka_2.12-2.6.0"$
alias rs="/root/bigdata/redis/redis-5.0.10/src/redis-cli"

# NVIDIA
# 查看内存空间
alias free="free -m"

# 查看GPU
alias vga="lspci  | grep -i vga"  # 显示接口信息
alias n="lspci | grep -i nvidia"
alias ns="nvidia-smi"  # 查看显存使用情况
# 每隔0.1秒刷新一次
alias wns="watch -n 0.1 -d nvidia-smi"
# cu102指的是cuda版本为10.2
alias cuda="nvcc --version"
alias cuda_version="cat /usr/local/cuda/version.txt"  # 查看cuda版本

# Changing "ls" to "exa"
# alias ls='exa -al --color=always --group-directories-first' # my preferred listing
# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
# alias ll='exa -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing

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
