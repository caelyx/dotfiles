autoload colors
colors

export RPROMPT='%2~ %n'
export PROMPT="%m %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "

export PATH=$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH:/Users/caelyx/Library/Python/3.9/bin
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
alias pbfix='pbpaste | pbcopy' # Usefully forces plaintext
alias katja='mosh -p 9022 katja'
alias today='date "+%F"'
alias gitup='git add `today`.md && git commit -m `today` && git push' # Update today's notes

xw () {  # Crossword solver; % xw m.nk.y 
    grep -i "^$1$" /usr/share/dict/words 
}

# wrdl () {  # Wordle solver; % xw .r.t. ie zxvy
#     grep -i "^$1$" /Users/caelyx/src/wordle-solver/wordlist.txt | grep -i "[$2]" | grep -vi "[$3]"
# }

topo () { # Create a 200x290 map at 1:25,000 centred at $x, $y
    nswtopo init -d 200,290 -c $2,$1 map.tgz; 
    nswtopo add map.tgz nsw/topographic
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

}

topo_init () { # Create a 200x290 map at 1:25,000 centred at $x, $y
    nswtopo init -d 200,290 -c $2,$1 map.tgz; 
}

topo_render () { # Render the topographic basemap of the file
    nswtopo add map.tgz nsw/topographic;
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

}

topo_ref () { # Render the standard-issue reference basemap of the file
    nswtopo add map.tgz nsw/reference-topo-current;
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

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

alias efix="head -1 ~/notes/EmailCleanUp.md | pbcopy"

alias newsradio="mpg321 http://live-radio01.mediahubaustralia.com/PBW/mp3/ http://live-radio02.mediahubaustralia.com/PBW/mp3/"

export GPG_TTY=$(tty)

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

if [ -f ~/.dotfiles/zshrc.local ]; then
    source ~/.dotfiles/zshrc.local
fi
