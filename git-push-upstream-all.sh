#!/bin/bash
set -e

branchName="$1"
if [[ -z "$branchName" ]]; then
	echo "Usage: git-push-upstream-all.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		if [[ "$( git symbolic-ref --short HEAD )" == "$branchName" ]]; then

			echo "------------------- $repo -------------------"
			git push --set-upstream origin "$branchName"
		fi

		cd ..
	fi
done

