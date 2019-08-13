#!/bin/bash
set -e

for repo in $( ls -d */ ); do
    if [ $( ls $repo | grep ^package.json$ ) ]; then
       echo "------------------- $repo -------------------"
       cd $repo
       rm -f -r node_modules
       cd ..
    fi
done

