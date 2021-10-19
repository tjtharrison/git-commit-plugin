# git-commit-plugin

Git commit plugin to standardise git commit messages

## Installation

This script can be called manually or by creating an alias for a custom git command (Eg `git commit-msg`)

echo 'alias commit-msg='$(pwd)'/git-commit.sh' >> ~/.bashrc

## Usage

Run your alias to write a git commit.

```git add [your changed files for committing]
commit-msg
```
