#!/bin/bash

#Assume that test.gitconfig is in the same folder as this script
gh repo create $(git config --file test.gitconfig setup.dest-repo) --add-readme --description "Description of testrepo" --public

pushd $(git rev-parse --show-toplevel)/
gh extension install .
popd