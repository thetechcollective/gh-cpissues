#!/usr/bin/env bats

@test "gh cpissues" {
mock_gh() {
    echo '{"title": "Test Issue", "body": "This is a test issue"}'
}
export -f mock_gh

TEMPLATEISSUES=$(mktemp)
TMPFILE=$(mktemp)

run ./gh-cpissues.sh "mock_repo" --label "test"

[ "$status" -eq 0 ]
[ -f "$TEMPLATEISSUES" ]
[ -f "$TMPFILE" ]
run cat "$TMPFILE"
[ "$output" = 'This is a test issue']

rm -f "$TEMPLATEISSUES" "$TMPFILE"
}

