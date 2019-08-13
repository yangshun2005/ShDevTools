#!/bin/bash
set -e

diffFile="$1"

if [[ -z "$policyFile" ]]; then
	echo "Usage: terraform-policy-diff.sh <<diffFile>>
	exit 1
fi

cat $diffFile | sed s/=\>/\\n/ | split -l 1;
cat xaa | sed 's/\s\+$//' | sed s/\"// | sed 's/\"$//' | sed 's/\\\n//g' | sed 's/\\\"/\"/g' | python -m json.tool > initial.json;
cat xab | sed 's/\s\+$//' | sed s/\"// | sed 's/\"$//' | sed 's/\\\n//g' | sed 's/\\\"/\"/g' | python -m json.tool > new.json;
