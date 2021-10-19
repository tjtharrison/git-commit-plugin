#!/bin/bash

set -e

## Gather git details
GIT_BRANCH=$(git status | grep "On branch" | sed 's/On branch //g')
COMMITTED_FILES=$(git status | grep "Changes to be committed" | wc -l)

## Check for added files
if [[ $COMMITTED_FILES -lt 1 ]]; then
    echo "No files have been added ready for commit! ($COMMITTED_FILES)"
    exit 1
fi

## Select commit STATUS
PS3='Commit a MR or WIP git commit: '
CHOICES=("MR" "WIP" "Exit")
select CHOICE in "${CHOICES[@]}"; do
    case $CHOICE in
        "MR")
            COMMIT_STATUS="$CHOICE"
            break
            ;;
        "WIP")
            COMMIT_STATUS="$CHOICE"
            break
            ;;
        "Exit")
            echo "Please rerun when you are ready.."
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

## Enter commit message
read -p 'Commit Message: ' COMMIT_MESSAGE

## Confirmation
echo # Blank line
echo "Commit Message:"
echo "STATUS: $COMMIT_STATUS"
echo "MESSAGE: $COMMIT_MESSAGE"

echo "Okay, committing and pushing to $GIT_BRANCH"
git commit -m "STATUS: $COMMIT_STATUS
MESSAGE: $COMMIT_MESSAGE"
git push origin $GIT_BRANCH