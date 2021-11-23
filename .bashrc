# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

alias pt="cd ~/project/tutorials/beginner_source/basics"
alias ll="ls -al"

# NVIDIA
# 查看GPU
alias n="lspci | grep -i nvidia"
alias ns="nvidia-smi"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
export LD_LIBRARY_PATH=/usr/local/cuda/lib
export PATH=$PATH:/usr/local/cuda/bin

export PATH="$PATH:$HOME/.ft"

export HISTTIMEFORMAT="%d/%m/%y %T "

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
