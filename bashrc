# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# save and load history on each command
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# kubectl autocompletion
if command -v kubectl &> /dev/null
then
    source <(kubectl completion bash)
fi

# Functions

# Alias definitions
alias myemacsclient="emacsclient -a '' -s ${HOME}/.emacs.d/temp/server"
function emacssudoedit_term() {
    myemacsclient -t -e "(find-file \"/sudo::$(realpath $1)\")"
}
function emacssudoedit_gui() {
    myemacsclient -c -e "(find-file \"/sudo::$(realpath $1)\")"
}

alias et='myemacsclient -t' # terminal
alias est='emacssudoedit_term' # sudo terminal
alias esg='emacssudoedit_gui' # sudo terminal
alias eg='myemacsclient -c' # GUI
alias magit='et -e "(magit-status \"$(pwd)\")"'
alias stopemacs='myemacsclient -e "(save-buffers-kill-emacs)"'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias kubenodes='kubectl get nodes --show-labels'
alias kubepods='kubectl get pods -o wide'

# Force xterm-256color on ssh sessions
# most nodes don't have xterm-24bit I use
alias ssh='TERM=xterm-256color ssh'

# Variables
export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR=emacs
export XDG_CURRENT_DESKTOP=kde
export QT_QPA_PLATFORMTHEME="qt5ct"
export PS1="[\u@\[$(tput setaf 6)\]\h\[$(tput sgr0)\] \W]\\$ \[$(tput sgr0)\]"


# not for github's eyes ;)
if [ -f ${HOME}/.bashrc_personal ]; then
    source ${HOME}/.bashrc_personal
fi
