#!/bin/bash
set -e

for repo in $( ls -d */ ); do
	if [ $( ls -a $repo | grep ^.git$ ) ]; then
		echo "------------------- $repo -------------------"
		cd $repo
		set +e
		git checkout -- "*.csproj"
		set -e
		cd ..
	fi
done

