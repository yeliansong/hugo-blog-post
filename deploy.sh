#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project and remove stale generated files.
hugo --cleanDestinationDir

# Sync the generated site and delete files that no longer exist locally.
rsync -av --delete public/ ../../hugo_public/yeliansong.github.io/

# Go To Public folder
cd ../../hugo_public/yeliansong.github.io/
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date` "

echo -e "\033[0;32m$msg\033[0m"

if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
