#!/bin/bash
set -e

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
   
       echo "------------------- $repo -------------------"
       cd $repo

       status="$( git status )"

       if [ -n "$( echo "$status" | grep 'git push' )" ]; then
          echo "$status"
       elif [ -n "$( echo "$status" | grep 'git reset' )" ]; then
          echo "$status"
       elif [ -n "$( echo "$status" | grep 'git add' )" ]; then
          echo "$status"
       fi

       cd ..
    fi
done

