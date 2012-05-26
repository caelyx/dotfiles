#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi


export PATH=$HOME/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/local/git/bin
export PS1="%m %(!.%{[0;1;37;41m%} # %{[0m%}.%{[0;1;34m%}%%) %{[0m%}"
export RPROMPT='%3~'
export PYTHONSTARTUP=~/.pythonrc


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
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
