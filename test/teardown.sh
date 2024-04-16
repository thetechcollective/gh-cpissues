#!/bin/bash
set -e -x
#Assume that test.gitconfig is in the same folder as this script
gh repo delete $(gh api user --jq '.login')/$(git config --file test.gitconfig setup.dest-repo) --yes
rm -rf $(git rev-parse --show-toplevel)/$(git config --file test.gitconfig setup.dest-repo)