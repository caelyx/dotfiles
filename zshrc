export RPROMPT='%2~ %m'
export PROMPT='%n %% '

export EDITOR=`which vim` # vi as vim breaks git somewhat
export PATH=/usr/local/Cellar/ruby@2.5/2.5.5/bin:/usr/local/lib/ruby/gems/2.5.0/bin:$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
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

alias blogup='rake generate && rake deploy'
alias rake='nocorrect rake' # Otherwise, Octopress rake commands bzzzt out.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

setopt nomenucomplete # Show the list of possible completions
setopt autolist
setopt nolistbeep # Don't ring the bell when match is ambiguous
