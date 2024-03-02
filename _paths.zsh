echo "--- source _paths.zsh ---"
export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionssh-add --apple-use-keychain ~/.ssh/home

# pnpm
export PNPM_HOME="/Users/jdhorn/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
