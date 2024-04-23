#!/bin/bash
set -e -x

#Assume that this is the correct root and that gitconfig is in test folder under root
ROOT_DIR=/workspaces/gh-cpissues

export GH_TOKEN=${GH_TOKEN}

USER=$(gh api user --jq '.login')

path_to_gitconfig=$ROOT_DIR/test/test.gitconfig

DEST_REPO=$(git config --file $path_to_gitconfig setup.dest-repo)
README=$(git config --file $path_to_gitconfig setup.readme)

gh repo create $DEST_REPO --add-readme --description "$README" --public

pushd $ROOT_DIR/
gh repo clone $USER/$DEST_REPO
gh extension install .
popd
