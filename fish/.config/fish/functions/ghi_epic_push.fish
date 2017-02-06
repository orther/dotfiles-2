#!/usr/bin/bash

# Pushes changes to an epic in github
# If a milestone exists.
# Otherwise simply push changes.
#
# 1. Push changes
# 2. Open a pull request if not exists
#
# Example:
# ghi_epic_push

function ghi_epic_push(){
    local MILESTONE=$(<.milestone)
    local PULLREQUEST=$(<.pullrequest)
    local BRANCH=$(git rev-parse --abbrev-ref HEAD)
    local TITLE=${BRANCH[2,50]//-/ }
    if [[ -n $MILESTONE && ! -n $PULLREQUEST ]]; then
        echo "Pushing to origin/$BRANCH" &&
        git push -u origin "${BRANCH}" &&
        echo "Creating a pull-request $TITLE" &&
        local PULLREQUEST=$(hub pull-request -m "[wip] ${TITLE}" | awk 'match($0, /[0-9]+/){print substr($0, RSTART, RLENGTH)}') &&
        echo "Setting up .pullrequest" &&
        ${PULLREQUEST} > .pullrequest
    else
        git push -u origin "${BRANCH}"
    fi
}

ghi_epic_push