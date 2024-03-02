#!/bin/bash

# Fetch the current date in yyyy-mm-dd format
echo -e "\nFetching the current date...\n"
currentDate=$(date +%F) # +%F is equivalent to +%Y-%m-%d

# Branch name
branchName="${currentDate}-dependency-updates"
echo -e "\nBranch name is: $branchName\n"

# Check out main branch
echo -e "\nCheck out main...\n"
git checkout main

# Pull the latest changes from origin
echo -e "\nPulling the latest changes from origin...\n"
git pull

# Create and switch to the new branch
echo -e "\nCreating and switching to the new branch: $branchName\n"
git checkout -b "$branchName"

# Upgrade dependencies interactively
echo -e "\nUpgrading dependencies interactively...\n"
yarn upgrade-interactive --latest

# Delete yarn.lock file
echo -e "\nDeleting yarn.lock file...\n"
rm -f yarn.lock

# Install dependencies
echo -e "\nInstalling dependencies...\n"
yarn install

# Open the project in Visual Studio Code
echo -e "\nOpening the project in Visual Studio Code...\n"
code .

# Open the browser and then start the app
echo -e "\nOpening browser and starting the app...\n"
(sleep 3; open http://localhost:8000/) &
yarn clean && yarn start
