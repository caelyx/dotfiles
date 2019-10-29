export RPROMPT='%2~ %m'
export PROMPT='%m%% '

export PATH=$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export EDITOR=`which vim` 
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

xw () {  # Crossword solver; % xw m.nk.y 
    grep -i "^$1$" /usr/share/dict/words 
}

# On OS X, display a notification centre notification
notifyDone () { 
    osascript -e "display notification \"$*\" with title \"zsh\"" 
}
#alias notifyDone="osascript -e 'display notification \"Task complete\" with title \"Done\"'"

setopt nomenucomplete # Show the list of possible completions
setopt autolist
setopt nolistbeep # Dont ring the bell when match is ambiguous

alias d20="qrandom --int --min 1 --max 20" 
alias d12="qrandom --int --min 1 --max 12" 
alias d10="qrandom --int --min 1 --max 10" 

export GPG_TTY=$(tty)

if [ -f ~/.dotfiles/zshrc.local ]; then
    source ~/.dotfiles/zshrc.local
fi
