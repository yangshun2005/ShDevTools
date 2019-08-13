#!/bin/bash
set -e

branchName="$1"
if [[ -z "$branchName" ]]; then
	echo "Usage: git-re-branch-non-master-all.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		repoBranchName="$( git symbolic-ref --short HEAD )"

		if [[ "$repoBranchName" != "master" ]]; then

			echo "------------------- $repo -------------------"
			git checkout -b "$branchName"
		fi

		cd ..
	fi
done

