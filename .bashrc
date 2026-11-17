#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'

export TERM=xterm-256color
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
# Tokyo Night Polite Prompt
# \[\e[1;34m\] = Bold Blue
# \[\e[1;35m\] = Bold Magenta
# \[\e[1;36m\] = Bold Cyan
# \[\e[0m\]    = Reset color

PS1='\[\e[1;34m\]Light \[\e[1;36m\]\u@\h \[\e[1;35m\]\W \[\e[0m\]\$ '
alias config='/usr/bin/git --git-dir=/home/hkr_lgt/.dotfiles/ --work-tree=/home/hkr_lgt'
alias config='/usr/bin/git --git-dir=/home/hkr_lgt/.dotfiles/ --work-tree=/home/hkr_lgt'
