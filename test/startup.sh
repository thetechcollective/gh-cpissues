#!/bin/sh


ISSUES_DIR="./issues"

# Set the GITHUB_TOKEN for the GitHub API
export GITHUB_TOKEN="$GITHUB_TOKEN"

# Create GitHub repositories
curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"name":"'"$REPO_ISSUES_NAME"'"}' \
     https://api.github.com/user/repos

curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"name":"'"$REPO_TEST_NAME"'"}' \
     https://api.github.com/user/repos

# Create first commit
curl -X PUT -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"branch": "main", "message": "Create a dummy file for the sake of creating a branch", "content": "ZHVtbXk="}' \
     https://api.github.com/repos/$GITHUB_USER/$REPO_TEST_NAME/contents/dummy
  
curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"message": "Initial commit", "tree": "4b825dc642cb6eb9a060e54bf8d69288fbee4904"}' \
     https://api.github.com/repos/$GITHUB_USER/$REPO_TEST_NAME/git/commits

curl -X PATCH -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"sha": "COMMIT_SHA", "force": true}' \
     https://api.github.com/repos/$GITHUB_USER/$REPO_TEST_NAME/git/refs/heads/main

# Loop through all Markdown files in the issues directory
for issue_file in "$ISSUES_DIR"/*.md; do
  if [ -f "$issue_file" ]; then
    # Extract the file name without the path and .md extension to use as the title
    TITLE=$(basename "$issue_file" .md)

    # Read the entire file content for the body
    BODY=$(cat "$issue_file")

    # Use jq to properly escape the body content as a JSON string
    JSON_BODY=$(echo "$BODY" | jq -aRs .)

    # Define Labels 
    LABELS_JSON='["template", "urgent"]'

    # Create a GitHub issue with the title, body and labels.
    curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
         -H "Accept: application/vnd.github.v3+json" \
         -H "Content-Type: application/json" \
         -d "{\"title\": \"$TITLE\", \"body\": $JSON_BODY, \"labels\": $LABELS_JSON}" \
         https://api.github.com/repos/$GITHUB_USER/$REPO_ISSUES_NAME/issues
  fi
done

git clone https://github.com/$GITHUB_USER/$REPO_TEST_NAME.git

cd $REPO_TEST_NAME

gh extension install thetechcollective/gh-cpissues

gh cpissues $GITHUB_USER/$REPO_ISSUES_NAME --label template

# Keep the container running
sleep infinity
