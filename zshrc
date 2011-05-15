#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi


export MAIL=$HOME/Mail/inbox/
export MAILCHECK=0
export PATH=$HOME/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin:/usr/lib/j2sdk1.5-sun/bin
export JDK_HOME=/usr/lib/j2sdk1.5-sun/jre
export JAVA_HOME=/usr/lib/j2sdk1.5-sun
export PS1="%m %(!.%{[0;1;37;41m%} # %{[0m%}.%{[0;1;34m%}%%) %{[0m%}"
export RPROMPT='%~'
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig
export PYTHONSTARTUP=~/.pythonrc


alias ls='ls --color=auto -F'
alias -g G=' | egrep '
alias -g L=' | less '
alias -g O=' | sort '
alias ccd='. ~/local/bin/ccd'
alias cvstat='/usr/bin/cvs status | /bin/grep "Status:"'
alias cvsmod='/usr/bin/cvs status | /bin/grep "Status:" | /bin/grep -v "Up-to-date"'
