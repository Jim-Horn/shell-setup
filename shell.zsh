echo "--- source warp.zsh ---"

eval "$(pyenv init --path)"

# NOT IN WARP
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
	##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
	
	echo "--- NOT WARP ---"
	
	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block; everything else may go below.
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	source ~/powerlevel10k/powerlevel10k.zsh-theme

	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	
	typeset -g POWERLEVEL10K_INSTANT_PROMPT=off

	##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

# ONLY IN WARP
if [[ $TERM_PROGRAM = "WarpTerminal" ]]; then
	##### WHAT YOU WANT TO ENABLE FOR WARP - BELOW
	
	echo "--- WARP ---"
	
	# ZSH_THEME="agnoster"
# 
# 	source $ZSH/oh-my-zsh.sh # disabled Wednesday, April 12, 2023
	eval "$(starship init zsh)"
# 	
# 	source $(brew --prefix)/opt/spaceship/spaceship.zsh

	##### WHAT YOU WANT TO ENABLE FOR WARP - ABOVE
fi

