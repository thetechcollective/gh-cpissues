# GitHub Issue Copier
A GitHub CLI extension to copy GitHub Issues from one repository to another based on a specified label.

## Prerequisites 

- [GitHub CLI (gh)](https://cli.github.com/)

## Installation 

1. Make sure you have the GitHub CLI installed. 
2. Install the gh extension from the repository with command: `gh extension install thetechcollective/gh-cpissues`

## Usage

```bash
gh cpissues <git-repo> --label <label> [--verbose]
```
Replace '`<git-repo>`' with the target repository where you want to copy the issues and '`<label>`' with the label of the issues you want to copy.

`[--verbose]`: (Optional) Include this flag to get more detailed output about the operation. This can be helpful for debugging or understanding the process in more detail.

## Options 
- '`<git-repo>`': The target repository in the format '`<owner>/<repository>`'.
- '`--label <label>`': Specify the label of the issues to copy. 

## Example 

```bash
gh cpissues thetechcollective/dx-intro --label template 
```

This command will copy all issues labeled "template" from the repository "thetechcollective/dx-intro" to the current repository.

## Notes
- This script uses the GitHub CLI ('`gh`') to interact with GitHub repositories.
- Issues are copied with their title and body intact.
- If an issues with the same title already exists in the target repository, it wont be copied again.  