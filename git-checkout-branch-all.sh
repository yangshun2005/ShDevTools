#!/bin/bash
set -e

branchName="$1"
if [[ -z "$branchName" ]]; then
	echo "Usage: git-checkout-branch-all.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		echo "------------------- $repo -------------------"
		set +e
		git checkout "$branchName"
		set -e

		cd ..
	fi
done

