# ZSH Configuration Files

This repository contains my personal ZSH configuration files.

## Installation

To use these configuration files, clone the repository into your `~/.config/zsh/config.d/` directory.

These config files are read thus:

```shell
# The .zshrc file contents. Disregard the Fig block if you don't use fig

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
echo "--- source .zshrc file ---"


### READ CONFIG FILES

	for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	  echo "sourcing ${conf}"
	  source "${conf}"
	done
	unset conf

### END READ CONFIG FILES

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

```
