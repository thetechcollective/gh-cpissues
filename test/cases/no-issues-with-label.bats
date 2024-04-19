#!/usr/bin/env bats

#Ensure that it doesn't copy any issues when no label is found.
run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
amount_of_issues=$output

run gh cpissues thetechcollective/gh-cpissues --label nolabel
[ "$status" -eq 0 ]
[[ "$output" =~ "No issues found" ]]

run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
[ $amount_of_issues -eq "$output" ]