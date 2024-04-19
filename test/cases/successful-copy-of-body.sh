#!/usr/bin/env bats
# Test case: Successful copy of body
 
SOURCECOUNT=$(gh issue --repo thetechcollective/gh-cpissues list --label "testsample" --json body --jq 'length')
declare -a ISSUE_BODIES
 
readarray -t ISSUE_NUMBERS < <(gh issue list --repo thetechcollective/gh-cpissues --label "testsample" --json number -q '.[].number')
readarray -t COPIEDISSUE_BODIES < <(gh issue list --json body -q '.[].body')
 
for ((i=${#ISSUE_NUMBERS[@]}-1; i>=0; i--)); do
    ISSUE_NUMBER=${ISSUE_NUMBERS[i]}
    readarray -t ISSUE_BODY < <(gh issue view --repo $REPO $ISSUE_NUMBER --json body)
    ISSUE_BODIES+=("${ISSUE_BODY[@]}")
done
 
echo "Processing issue numbers in reverse order:"
for ((i=1; i<=SOURCECOUNT; i++)); do
    SOURCE=${ISSUE_BODIES[j]}
    TARGET=${COPIEDISSUE_BODIES[j]}
    [ "$SOURCE" == "$TARGET" ]
 
done
 
 
 