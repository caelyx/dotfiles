export RPROMPT='%2~ %m'
export PROMPT='%m%% '

export PATH=$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ `uname` = 'Darwin' ]]; then
    alias ls='ls -G -F';
elif [[ `uname` = 'Linux' ]]; then
    alias ls='ls --color=auto -F';
fi

alias -g G=' | egrep '
alias -g L=' | less '
alias -g O=' | sort '
alias pbfix pbpaste | pbcopy # Usefully forces plaintext
alias katja='mosh -p 9022 katja'

# On OS X, display a notification centre notification
alias notifyDone="osascript -e 'display notification \"Task complete\" with title \"Done\"'"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

setopt menucomplete # Show the list of possible completions
setopt autolist
setopt nolistbeep # Don't ring the bell when match is ambiguous

alias d20="qrandom --int --min 1 --max 20" 
alias d12="qrandom --int --min 1 --max 12" 
alias d10="qrandom --int --min 1 --max 10" 

if [ -f ~/.dotfiles/zshrc.authentication ]; then
    source ~/.dotfiles/zshrc.authentication
fi
