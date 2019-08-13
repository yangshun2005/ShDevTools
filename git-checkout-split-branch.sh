#!/bin/bash
set -e

branchName="$1"

if [[ -z "$branchName" ]]; then
	echo "Usage: git-checkout-split-branch.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo
		splitBranchName="$branchName-${repo::-1}"
		echo "Checking $splitBranchName"
		set +e
		git checkout "master"
		git fetch
        git remote prune origin
		git branch -D "$splitBranchName" 
		git checkout "$splitBranchName"
		set -e

		cd ..
	fi
done

