#!/bin/bash
set -e -x

#Assume that this is the correct root and that gitconfig is in test folder under root
ROOT_DIR=/workspaces/gh-cpissues
USER=$(gh api user --jq '.login')

path_to_gitconfig=$ROOT_DIR/test/test.gitconfig
DEST_REPO=$(git config --file $path_to_gitconfig setup.dest-repo)

gh extension remove "cpissues"
gh repo delete $USER/$DEST_REPO --yes
rm -rf $ROOT_DIR/$DEST_REPO
