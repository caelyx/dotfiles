export RPROMPT='%2~'
export PROMPT='%n@%m%% '

export PATH=$HOME/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:$PATH
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
