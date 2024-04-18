# Contributing to [gh-cpissues]

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:
- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Changes and features
Pull requests are the best way to propose changes to the codebase. We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. Ensure the test suite passes.
4. Make sure your code lints.
5. Issue that pull request!

## Testing
Testing is done using [Bats-core](https://github.com/bats-core/bats-core) to run the current tests do the following:

1. Make sure you're running in the devcontainer.
2. Use `gh auth login --scopes "delete_repo"` to authenticate yourself.
3. Run `setup.sh`.
4. CD into the created repository folder.
5. Run the `bats` script from that directory.
6. Run `teardown.sh` to clean up after tests.

*Additional tests should be added and run automatically when the pipepline is set up.
