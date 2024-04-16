#!/bin/bash
set -e -x
#Assume that test.gitconfig is in the same folder as this script
gh repo create $(git config --file test.gitconfig setup.dest-repo) --add-readme --description "Description of testrepo" --public

pushd $(git rev-parse --show-toplevel)/
gh repo clone $(gh api user --jq '.login')/$(git config --file ./test/test.gitconfig setup.dest-repo)
pushd $(git config --file ./test/test.gitconfig setup.dest-repo)
ln -s ../gh-cpissues gh-cpissues
gh extension install .
popd
popd