#!/bin/bash
set -e

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		branchName="$( git symbolic-ref --short HEAD )"

		if [[ "$branchName" != "master" ]]; then

			echo "------------------- $repo -------------------"
			git push --set-upstream origin "$branchName"
		fi

		cd ..
	fi
done

