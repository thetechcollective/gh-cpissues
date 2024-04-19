#!/usr/bin/env bats

run gh cpissues thetechcollective/gh-cpissues --label testexist
[ "$status" -eq 0 ]
[[ "$output" =~ "Copying issue:" ]]

#Ensure that it doesn't copy an existing issue by checking amount before and after command.
run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
amount_of_issues=$output

run gh cpissues thetechcollective/gh-cpissues --label testexist
[ "$status" -eq 0 ]
[[ "$output" =~ "Issue already exists:" ]]

run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
[ $amount_of_issues -eq "$output" ]