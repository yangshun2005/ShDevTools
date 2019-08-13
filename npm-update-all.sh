#!/bin/bash
set -e

for repo in $( ls -d */ ); do
    if [ $( ls $repo | grep ^package.json$ ) ]; then
       echo "------------------- $repo -------------------"
       cd $repo
       npm prune
       npm update --save
       npm update --save-dev
       cd ..
    fi
done

