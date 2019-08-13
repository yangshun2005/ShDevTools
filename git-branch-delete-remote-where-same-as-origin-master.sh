#!/bin/bash
set -e

branchName="$1"
if [[ -z "$branchName" ]]; then
	echo "Usage: git-branch-delete-remote-where-same-as-origin-master.sh <<branchName>>"
	exit 1
fi

for repo in $( ls -d */ ); do
	if [[ $( ls -a $repo | grep ^.git$ ) ]]; then
		cd $repo

		if [[ "$( git symbolic-ref --short HEAD )" == "$branchName" ]]; then

			git pull
			git merge origin/master --no-edit

			set +e
			git diff --quiet --exit-code "$branchName" "origin/master"
			diffCode=$?
			set -e

			if [[ $diffCode == 0 ]]; then

				echo "------------------- $repo -------------------"
				set +e
				git push --delete origin "$branchName"
				set -e

				git checkout master
				git branch -D "$branchName"

			fi
		fi

		cd ..
	fi
done

