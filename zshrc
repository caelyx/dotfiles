## ZSH configuration 
setopt nomenucomplete # Show the list of possible completions
setopt autolist
setopt nolistbeep # Dont ring the bell when match is ambiguous

autoload colors
colors

export RPROMPT='%2~ %n'
export PROMPT="%m %{%(#~$fg[red]~$fg[blue])%}%#%{$fg[default]%} "
export PATH=/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:$HOME/bin:$PATH
export EDITOR=`which vim` 
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

# Python virtual environment helper functions
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/src
#source /usr/local/bin/virtualenvwrapper.sh


## ALIASES

if [[ `uname` = 'Darwin' ]]; then
    alias ls='ls -G -F';
elif [[ `uname` = 'Linux' ]]; then
    alias ls='ls --color=auto -F';
fi

alias -g G=' | egrep '
alias -g L=' | less '
alias -g O=' | sort '
alias today='date "+%F"'
alias pbfix='pbpaste | pbcopy' # Usefully forces plaintext
alias gitup='git add `today`.md && git commit -m `today` && git push' # Update today's notes
alias katja='mosh -p 9022 katja'

# Dice rolling
alias d20="qrandom --int --min 1 --max 20" 
alias d12="qrandom --int --min 1 --max 12" 
alias d10="qrandom --int --min 1 --max 10" 

# Email inbox search for messages safe to archive
alias efix="head -1 ~/notes/EmailCleanUp.md | pbcopy"

# Play ABC News Radio livestream
alias newsradio="mpg321 http://live-radio01.mediahubaustralia.com/PBW/mp3/ http://live-radio02.mediahubaustralia.com/PBW/mp3/"

# Create a tmp folder for today and go to it
alias tmptoday="[ -d ~/tmp/`today` ] || mkdir ~/tmp/`today`; cd ~/tmp/`today`"

## FUNCTIONS

xw () {  # Crossword solver; % xw m.nk.y 
    grep -i "^$1$" /usr/share/dict/words 
}

# On OS X, display a notification centre notification
notifyDone () { 
    osascript -e "display notification \"$*\" with title \"zsh\"" 
}

# wrdl () {  # Wordle solver; % xw .r.t. ie zxvy
#     grep -i "^$1$" /Users/caelyx/src/wordle-solver/wordlist.txt | grep -i "[$2]" | grep -vi "[$3]"
# }


## TOPOGRAPHIC MAP RENDERING
# Shortcuts for using https://github.com/mholling/nswtopo

topo () { # Create a A4 Portrait map at 1:25,000 centred at $x, $y using vector imagery
    nswtopo init -d 200,290 -c $2,$1 map.tgz; 
    nswtopo add map.tgz nsw/topographic
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

}

topo_init_p () { # Prepare file to hold a A4 Portrait map at 1:25,000 centred at $x, $y
    nswtopo init -d 200,290 -c $2,$1 map.tgz; 
}

topo_init_l () { # Prepare file to hold a A4 Landscape map at 1:25,000 centred at $x, $y
    nswtopo init -d 290,200 -c $2,$1 map.tgz; 
}

topo_render_t () { # Render the vector topographic basemap of the file
    nswtopo add map.tgz nsw/topographic;
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

}

topo_render_r () { # Render the standard-issue (bitmap) reference basemap of the file
    nswtopo add map.tgz nsw/reference-topo-current;
    nswtopo grid map.tgz;
    nswtopo declination map.tgz;
    nswtopo render map.tgz pdf;
    open map.pdf

}

# Import additional local functions/settings, if specified
if [ -f ~/.dotfiles/zshrc.local ]; then
    source ~/.dotfiles/zshrc.local
fi
