#!/bin/bash

MERGED_BRANCHES="$( git branch --merged origin/master | grep -v "\*" | grep -v master | grep -v dev )"

if [ -n "$MERGED_BRANCHES" ]; then
    echo "$MERGED_BRANCHES" | xargs -n 1 git branch -d
fi
