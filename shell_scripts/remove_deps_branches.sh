#!/bin/bash

# Prefix for branch names to target for deletion
branchPrefix="$(date +%Y)-*-dependency-updates"

echo "Fetching all branches..."
git fetch --all

echo "Filtering branches by prefix: $branchPrefix"
# List local branches that match the pattern and delete them
for branch in $(git branch --list "$branchPrefix"); do
    # Strip leading whitespace characters
    branch=$(echo $branch | sed 's/^\s*//g')
    echo "Deleting local branch: $branch"
    git branch -D "$branch"
done

# Fetch remote branches and filter by pattern
git fetch --all
echo "Filtering remote branches by prefix: $branchPrefix"
for branch in $(git branch -r --list "origin/$branchPrefix"); do
    # Extract branch name without remote part
    branchName=$(echo $branch | sed 's@origin/@@g')
    echo "Deleting remote branch: $branchName"
    git push origin --delete "$branchName"
done

echo "Branch cleanup complete."
