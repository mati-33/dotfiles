# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# colored prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# starship
eval "$(starship init bash)"

# aliases
alias py='python3'
alias pyenv='python3 -m venv .venv'
alias pyenv12='python3.12 -m venv .venv'
alias cb='xclip -selection clipboard'
alias vim='nvim'
alias vimconfig='cd ~/.config/nvim/ && vim'
alias ..='cd ..'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
