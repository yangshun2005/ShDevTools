#!/bin/bash
set -e

for repo in $( ls -d */ ); do
	if [ $( ls -a $repo | grep ^.git$ ) ]; then
		
		echo "------------------- $repo -------------------"
		cd $repo
		set +e
		git fetch --prune
		fetchResult = $?
		cd ..
		set -e

		if [ $fetchResult == 128 ]; then
			if [ -d ".junk/" ]; then
				mkdir ".junk/"
			fi
			mv $repo ".junk/$repo"
		fi
	fi
done

