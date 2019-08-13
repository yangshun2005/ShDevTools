#!/bin/bash

HELPER_SCRIPT="$(dirname $BASH_SOURCE)/git-branch-delete-merged-with-master.sh"

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
       echo "------------------- $repo -------------------"
       cd $repo
       $HELPER_SCRIPT
       cd ..
    fi
done

