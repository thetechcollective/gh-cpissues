#!/bin/sh


ISSUES_DIR="./issues"

# Set the GITHUB_TOKEN for the GitHub API
export GITHUB_TOKEN="$GITHUB_TOKEN"

# Create GitHub repository
curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d '{"name":"'"$REPO_NAME"'"}' \
     https://api.github.com/user/repos

# Loop through all Markdown files in the issues directory
for issue_file in "$ISSUES_DIR"/*.md; do
  if [ -f "$issue_file" ]; then
    # Extract the file name without the path and .md extension to use as the title
    TITLE=$(basename "$issue_file" .md)

    # Read the entire file content for the body
    BODY=$(cat "$issue_file")

    # Use jq to properly escape the body content as a JSON string
    JSON_BODY=$(echo "$BODY" | jq -aRs .)

    # Create a GitHub issue with the title and body
    curl -X POST -u "$GITHUB_USER:$GITHUB_TOKEN" \
         -H "Accept: application/vnd.github.v3+json" \
         -H "Content-Type: application/json" \
         -d "{\"title\": \"$TITLE\", \"body\": $JSON_BODY}" \
         https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/issues
  fi
done


# Keep the container running
sleep infinity
