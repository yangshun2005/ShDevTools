#!/bin/bash
set -e

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo
		git checkout "master"
		cd ..
	fi
done

