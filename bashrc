# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Functions
function emacssudoedit() {
    emacsclient -a "" -t -e "(find-file \"/sudo::$(realpath $1)\")"
}

# Alias definitions
alias et='emacsclient -a "" -t' # terminal
alias es='emacssudoedit' # sudo terminal
alias eg='emacsclient -a "" -c' # GUI
alias magit='et -e "(magit-status \"$(pwd)\")"'
alias stopemacs='emacsclient -e "(save-buffers-kill-emacs)"'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Variables
export PATH="${HOME}/.local/bin:${PATH}"
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
export EDITOR=et
export QT_QPA_PLATFORMTHEME="qt5ct"

PS1="[\u@\[$(tput setaf 6)\]\h\[$(tput sgr0)\] \W]\\$ \[$(tput sgr0)\]"

# not for github's eyes ;)
if [ -f ${HOME}/.bashrc_personal ]; then
    source ${HOME}/.bashrc_personal
fi
