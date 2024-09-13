echo "--- source _paths.zsh ---"
export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/jim.horn/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GIT_CONFIG_GLOBAL=~/my_git_configs/.gitconfig

# AWS CDK
export AWS_SDK_LOAD_CONFIG=1
export AWS_DEFAULT_REGION=us-east-1
export AWS_PROFILE=asurion-sales-domain-nonprod.dev
# AWS CDK end

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH=$PATH:/usr/local/bin/aws