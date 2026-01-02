# This function wraps the native 'docker' command to auto-start colima if needed.
colima_docker_wrapper() {
  # 1. Check Colima status
  if ! colima status -j 2>/dev/null | grep -q '"status": "Running"'; then
    echo "🐳 Colima VM is not running. Starting Colima..."
    # 2. Start Colima (in the background, suppress output)
    colima start > /dev/null 2>&1

    # 3. Wait for Colima to start up (optional, but safer)
    for i in {1..30}; do
      if colima status -j 2>/dev/null | grep -q '"status": "Running"'; then
        break
      fi
      sleep 1
    done

    if ! colima status -j 2>/dev/null | grep -q '"status": "Running"'; then
      echo "❌ Error: Colima failed to start."
      return 1
    fi
    echo "✅ Colima VM is now running."
  fi

  # 4. Execute the original docker command with all arguments
  /usr/local/bin/docker "$@"
}

# Replace the 'docker' command with the wrapper function
alias docker='colima_docker_wrapper'

alias docker-stop-all='echo "Stopping all running containers..."; docker stop $(docker ps -q) 2>/dev/null; echo "Stopping Colima VM..."; colima stop'


