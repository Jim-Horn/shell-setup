echo "--- source nvm.zsh ---"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  
  echo "Current Node version: $node_version"
  echo "Looking for .nvmrc file..."

  if [ -n "$nvmrc_path" ]; then
    echo ".nvmrc found at $nvmrc_path"
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    echo "Required Node version from .nvmrc: $(cat "${nvmrc_path}")"
    echo "NVM Node version: $nvmrc_node_version"

    if [ "$nvmrc_node_version" = "N/A" ]; then
      echo "Node version not installed. Installing..."
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      echo "Switching to Node version $(cat "${nvmrc_path}")"
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "No .nvmrc found, reverting to default Node version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc