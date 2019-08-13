#!/bin/bash
set -e

branchName="$1"
commitMessage="$2"
if [[ -z "$branchName" ]] || [[ -z "$commitMessage" ]]; then
	echo "Usage: git-branch-and-commit-all.sh <<branchName>> <<commitMessage>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		if [[ $( git status --porcelain ) ]]; then

			echo "------------------- $repo -------------------"
			git checkout -b "$branchName"
			git add .
			git commit -a -m "$commitMessage"
		fi

		cd ..
	fi
done

