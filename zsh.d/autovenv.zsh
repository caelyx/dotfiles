# Auto-activate Python venv, walking up directory tree
auto_activate_venv() {
    local search_dir="$PWD"
    local venv_dir=""
    
    # Walk up the tree looking for .venv or venv (stop at $HOME or root)
    while [[ -n "$search_dir" && "$search_dir" != "$HOME" ]]; do
        if [[ -d "$search_dir/.venv" ]]; then
            venv_dir="$search_dir/.venv"
            break
        elif [[ -d "$search_dir/venv" ]]; then
            venv_dir="$search_dir/venv"
            break
        fi
        search_dir="${search_dir%/*}"
    done
    
    # No venv found — deactivate if one is active
    if [[ -z "$venv_dir" ]]; then
        [[ -n "$VIRTUAL_ENV" ]] && deactivate && \
            [[ -t 1 ]] && echo -e "\e[31mDeactivated: $VIRTUAL_ENV\e[0m"
        return
    fi
    
    # Found venv — only activate if different from current
    if [[ "$VIRTUAL_ENV" != "$venv_dir" ]]; then
        [[ -n "$VIRTUAL_ENV" ]] && deactivate
        source "$venv_dir/bin/activate"
        [[ -t 1 ]] && echo -e "\e[32mActivated: $venv_dir\e[0m"
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_activate_venv
auto_activate_venv  # Run on shell startup

