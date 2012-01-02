# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="caelyx"
# ZSH_THEME="gallifrey"
ZSH_THEME="kardan"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# brew
# git
# github
# gnu-utils
# gpg-agent
# mercurial
# osx
# python
# textmate
# thor
# vagrant
# vi-mode

export PATH=$HOME/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/git/bin
export PYTHONSTARTUP=~/.pythonrc

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

export BAT_CHARGE=/usr/local/bin/batterylevel.py
function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

export PS1="%m > "
RPROMPT='%3~ $(battery_charge)'

if [[ `uname` = 'Darwin' ]]; then
    alias ls='ls -G -F';
elif [[ `uname` = 'Linux' ]]; then
    alias ls='ls --color=auto -F';
fi

alias -g G=' | egrep '
alias -g L=' | less '
alias -g O=' | sort '
alias cvstat='/usr/bin/cvs status | /bin/grep "Status:"'
alias cvsmod='/usr/bin/cvs status | /bin/grep "Status:" | /bin/grep -v "Up-to-date"'
