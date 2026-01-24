## CONTAINERS 

_agentic_ensure_service() {
    if ! container system status &>/dev/null; then
        echo "Container system is not running."
        read -q "reply?Start it now? [Y/n] " || reply="y"
        echo
        
        if [[ "$reply" =~ ^[Nn]$ ]]; then
            echo "Cancelled."
            return 1
        fi
        
        echo "Starting container system..."
        container system start
    fi
    return 0
}

_agentic_mounts() {
    _mounts=()
    _mounts+=(--volume "$(pwd):/workspace/src")
    # Mount directories only - VZ framework cannot mount individual files
    _mounts+=(--volume "$HOME/.dotfiles:/home/agent/.dotfiles:ro")
    _mounts+=(--volume "$HOME/.vim:/home/agent/.vim:ro")
}

agentic-base-rebuild() {
    _agentic_ensure_service || return 1

    if [[ ! -f "$HOME/.config/containers/Containerfile.base" ]]; then
        echo "Error: ~/.config/containers/Containerfile.base not found"
        echo "Create it first with your base image definition."
        return 1
    fi

    container builder start --cpus 8 --memory 16g
    container build -f "$HOME/.config/containers/Containerfile.base" -t agentic-base:latest  --memory 4g "$HOME/.config/containers"
    container builder stop
}
 
agentic-sandbox() {
    _agentic_ensure_service || return 1
    
    local image="${1:-agentic-base:latest}"
    
    if [[ -f "./Containerfile" ]]; then
        echo "Building project-specific image..."
        container build -t "agentic-project:latest" .
        image="agentic-project:latest"
    fi
    
    _agentic_mounts
    container run -it --rm "${_mounts[@]}" "$image" --memory 4g zsh
}

agentic-quick() {
    _agentic_ensure_service || return 1
    
    _agentic_mounts
    container run -it --rm "${_mounts[@]}" --memory 4g agentic-base:latest zsh
}

alias agentic-stop='container system stop'
