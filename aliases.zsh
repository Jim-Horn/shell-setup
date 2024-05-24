echo "--- source aliases.zsh ---"

eval $(thefuck --alias)
alias darn=fuck
alias deltemp="echo '>>> git branch | grep tmp | xargs git branch -D' && git branch | grep tmp | xargs git branch -D && echo '>>> git remote prune origin' && git remote prune origin"
alias grid="echo '>>> git rebase -i develop' && git rebase -i develop"
alias rmNext='find . -type d -name ".next" -print0 | xargs -0 -I {} sh -c "echo Removing {}; rm -r {}"'
alias rmnext=rmNext

function mcd() {
  echo '>>> mkdir '$1 &&
    mkdir -p "$1" &&
    echo '>>> cd '$1 &&
    cd "$1";
}

function update() {
  echo '>>> git fetch origin' &&
    git fetch origin &&
  echo '>>> git checkout origin/'$1 &&
    git checkout origin/"$1"  &&
  echo '>>> git branch -f '$1 &&
    git branch -f "$1" &&
  echo '>>> git checkout '$1 &&
    git checkout "$1";
}

function recent() {
  fmt=%(align:width=40,position=left)%(refname:short)%(end)(%(authordate:relative), %(authordate:short))

  if [[ $1 == "" ]]; then
    git for-each-ref --sort=-committerdate --count=10 --format=$fmt refs/heads/ |tr '"' '\0'
  else
    git for-each-ref --sort=-committerdate --count=100 --format=$fmt refs/heads/ | grep -i $1 |tr '"' '\0'
  fi
}

function branch() {
  CURRENT_BRANCH=`git branch --show-current`
  echo "$CURRENT_BRANCH" | pbcopy  && echo "\nCurrent branch: $CURRENT_BRANCH\n"
}

function br() {
  branch
}

pull() {
    # Get current date and time
    current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Stash changes with a unique message including date and time
    stash_message="Temporary stash for pull on $current_datetime"
    git stash save "$stash_message"
    
    # Pull changes from the remote repository
    git pull origin master  # Replace 'master' with your branch name
    
    # Find the stash by its message and apply it
    stash_to_apply=$(git stash list | grep "$stash_message" | cut -d: -f1)
    
    if [ -n "$stash_to_apply" ]; then
        git stash apply "$stash_to_apply"
        echo "Applied stash: $stash_to_apply"
    else
        echo "No matching stash found to apply."
    fi
}

// document this function
delmerged() {
    main_branch="develop"

    # Checkout the main branch to compare other branches
    git checkout $main_branch

    # List all local branches and loop through them
    for branch in $(git branch --merged | grep -v "\*" | tr -d ' '); do
        # Skip the main branch
        if [ "$branch" != "$main_branch" ]; then
            # Delete the merged local branch
            git branch -d $branch
        fi
    done
}


alias update_deps='~/.config/zsh/config.d/shell_scripts/update_deps.sh'
alias deps=update_deps

alias deldeps='~/.config/zsh/config.d/shell_scripts/remove_deps_branches.sh'
