#!/bin/bash
set -e -x

#Assume that test.gitconfig is in the same folder as this script
ROOT_DIR=$(git rev-parse --show-toplevel)
USER=$(gh api user --jq '.login')

path_to_gitconfig=$ROOT_DIR/test/test.gitconfig

DEST_REPO=$(git config --file $path_to_gitconfig setup.dest-repo)
README=$(git config --file $path_to_gitconfig setup.readme)

gh repo create $DEST_REPO --add-readme --description "$README" --public

pushd $ROOT_DIR/
gh repo clone $USER/$DEST_REPO
gh extension install .
popd
