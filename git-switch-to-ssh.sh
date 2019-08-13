#!/bin/bash
set -e

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
       cd $repo

       originUrl=$( git config --get remote.origin.url )
       newOriginUrl=$( echo "$originUrl" | sed "s/^https:\/\/github.com\//git@github.com:/" )

       if [ "$originUrl" != "$newOriginUrl" ]; then
	
           echo "------------------- $repo -------------------"
           echo "Updating origin from $originUrl to $newOriginUrl"
           git remote set-url origin "$newOriginUrl"
       fi

       cd ..
    fi
done


