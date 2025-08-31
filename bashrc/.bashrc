# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$PATH:$HOME/.local/bin"

mkdir -p "$XDG_STATE_HOME"/bash
export HISTFILE="$XDG_STATE_HOME/bash/history"

mkdir -p "$XDG_STATE_HOME"/python
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history

mkdir -p "$XDG_STATE_HOME"/sqlite
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite/history

mkdir -p "$XDG_STATE_HOME"/node
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node/history

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

# go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"

# colored prompt
function prompt_cmd {
    RET=$?
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n'
    if [[ $RET != 0 ]]; then
        PS1+="\[\033[0;31m\]>\[\033[00m\] "
    else
        PS1+="\[\033[0;32m\]>\[\033[00m\] "
    fi
}

PROMPT_COMMAND=prompt_cmd
eval "$(starship init bash)"

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
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# ubuntu
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/usr/local/go/bin"
