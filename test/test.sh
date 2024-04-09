#!/bin/bash

# Function to fetch issues body from a repository
fetch_issues() {
    local owner=$1
    local repo=$2
    curl -s -H "Authorization: token $GITHUB_TOKEN" \
        "https://api.github.com/repos/$owner/$repo/issues?state=all" | jq -r '.[].body'
}

issues1=$(fetch_issues "$GITHUB_USER" "$REPO_ISSUES_NAME")
issues2=$(fetch_issues "$GITHUB_USER" "$REPO_TEST_NAME")

if [ "$issues1" == "$issues2" ]; then
    echo "Issues body are the same."
else
    echo "Issues body are not the same."
fi
