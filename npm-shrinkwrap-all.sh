#!/bin/bash
set -e

for repo in $( ls -d */ ); do
    if [ $( ls $repo | grep ^package.json$ ) ]; then
       echo "------------------- $repo -------------------"
       cd $repo
       npm shrinkwrap
       cd ..
    fi
done

