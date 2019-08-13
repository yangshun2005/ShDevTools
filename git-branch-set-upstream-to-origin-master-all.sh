#!/bin/bash
set -e

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
       echo "------------------- $repo -------------------"
       cd $repo
       git branch --set-upstream-to origin/master
       cd ..
    fi
done

