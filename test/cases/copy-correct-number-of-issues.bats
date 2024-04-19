#!/usr/bin/env bats

run gh issue --repo thetechcollective/gh-cpissues list --label "testsample" --json title --jq 'length'
[ "$status" -eq 0 ]
sourcecount=$output

run gh issue list --json title --jq 'length'
[ "$status" -eq 0 ]
targetcount=$output

[ $sourcecount -eq $targetcount ]
