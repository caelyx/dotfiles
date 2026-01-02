## CONTAINERS 
 
agentic-base-rebuild() { 
    container build -f ~/.config/containers/Containerfile.base \ 
        -t agentic-base:latest \ 
        ~/.config/containers 
} 
 
 _agentic_mounts() {
    _mounts=()
    _mounts+=(--volume "$(pwd):/workspace/src")
    [[ -f "$HOME/.zshrc" ]] && _mounts+=(--volume "$HOME/.zshrc:/workspace/.zshrc:ro")
    [[ -d "$HOME/.dotfiles" ]] && _mounts+=(--volume "$HOME/.dotfiles:/workspace/.dotfiles:ro")
    [[ -f "$HOME/.vimrc" ]] && _mounts+=(--volume "$HOME/.vimrc:/workspace/.vimrc:ro")
    [[ -d "$HOME/.vim" ]] && _mounts+=(--volume "$HOME/.vim:/workspace/.vim:ro")
    [[ -f "$HOME/.gitconfig" ]] && _mounts+=(--volume "$HOME/.gitconfig:/workspace/.gitconfig:ro")
}

agentic-sandbox() { 
    local image="${1:-agentic-base:latest}" 
    local mounts=() 
 
    if [[ -f "./Containerfile" ]]; then 
        echo "Building project-specific image..." 
        container build -t "agentic-project:latest" . 
        image="agentic-project:latest" 
    fi 
 
    _agentic_mounts mounts 
    container run -it --rm "${mounts[@]}" "$image" zsh 
} 
 
agentic-quick() { 
    local mounts=() 
    _agentic_mounts mounts 
    container run -it --rm "${mounts[@]}" agentic-base:latest zsh 
} 
 
