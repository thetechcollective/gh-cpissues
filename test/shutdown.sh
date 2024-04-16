#!/bin/sh

# Delete GitHub repository
curl -X DELETE -u "$GITHUB_USER:$GITHUB_TOKEN" \
     https://api.github.com/repos/$GITHUB_USER/$REPO_ISSUES_NAME

curl -X DELETE -u "$GITHUB_USER:$GITHUB_TOKEN" \
     https://api.github.com/repos/$GITHUB_USER/$REPO_TEST_NAME
