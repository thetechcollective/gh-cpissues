#!/bin/bash

#Assume that test.gitconfig is in the same folder as this script
gh repo delete $(gh api user --jq '.login')/$(git config --file test.gitconfig setup.dest-repo) --yes
