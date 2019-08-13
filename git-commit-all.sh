#!/bin/bash
set -e

commitMessage="$1"
if [[ -z "$commitMessage" ]]; then
	echo "Usage: git-commit-all.sh <<commitMessage>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		if [[ $( git status --porcelain ) ]]; then

			echo "------------------- $repo -------------------"
			git add .
			git commit -a -m "$commitMessage"
		fi

		cd ..
	fi
done

