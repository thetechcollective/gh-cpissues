#!/bin/bash
set -e -x

cd $(git rev-parse --show-toplevel)/$(git config --file test.gitconfig setup.dest-repo)
gh cpissues thetechcollective/gh-cpissues --label testsample 
