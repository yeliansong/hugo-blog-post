#!/bin/bash
set -euo pipefail

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project and remove stale generated files.
hugo --cleanDestinationDir

# Sync the generated site and delete files that no longer exist locally.
rsync -av --delete --exclude='.git/' public/ ../../hugo_public/yeliansong.github.io/

# Go to the GitHub Pages repository.
cd ../../hugo_public/yeliansong.github.io/

# Add generated changes to git.
git add .

msg="rebuilding site $(date)"

if [ $# -eq 1 ]; then
  msg="$1"
fi

echo -e "\033[0;32m$msg\033[0m"

if git diff --cached --quiet; then
  echo -e "\033[0;33mNo generated changes to deploy.\033[0m"
else
  git commit -m "$msg"
  git push origin master
fi
