#!/usr/bin/env bats

run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
amount_of_issues=$output

run gh cpissues ttc/gh-cpissues --label nolabel
[ "$status" -eq 1 ]
[[ "$output" =~ "Could not resolve to a Repository with the name" ]]

run gh cpissues thetechcollective/gh-cpissues --noArg nolabel
[ "$status" -eq 1 ]
[[ "$output" =~ "Unknown argument:" ]]

run gh cpissues thetechcollective/gh-cpissues --label
[ "$status" -eq 1 ]
[[ "$output" =~ "cannot be empty" ]]

run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
[ $amount_of_issues -eq "$output" ]
