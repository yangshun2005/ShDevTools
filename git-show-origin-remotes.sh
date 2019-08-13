#!/bin/bash
set -e

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
       cd $repo
       printf "%-50s %s\n" $repo $( git config --get remote.origin.url )
       cd ..
    fi
done

