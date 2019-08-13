#!/bin/bash
set -e

branchName="$1"

if [[ -z "$branchName" ]]; then
	echo "Usage: git-split-branch-and-push-all.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		if [[ "$( git symbolic-ref --short HEAD )" == "$branchName" ]]; then

			splitBranchName="$branchName-${repo::-1}"

			echo "------------------- $repo => $splitBranchName -------------------"
			git checkout -b "$splitBranchName"
			git push --set-upstream origin "$splitBranchName"
		fi

		cd ..
	fi
done

