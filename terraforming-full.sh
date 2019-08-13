#!/bin/bash
set -eu

resources=(
	"alb"
	"asg"
	"cwa"
	"dbpg"
	"dbsg"
	"dbsn"
	"ec2"
	"ecc"
	"ecsn"
	"efs"
	"eip"
	"elb"
	"iamg"
	"iamgm"
	"iamgp"
	"iamip"
	"iamp"
	"iampa"
	"iamr"
	"iamrp"
	"iamu"
	"iamup"
	"igw"
	"kmsa"
	"kmsk"
	"lc"
	"nacl"
	"nat"
	"nif"
	"r53r"
	"r53z"
	"rds"
	"rs"
	"rt"
	"rta"
	"s3"
	"sg"
	"sn"
	"snst"
	"snss"
	"sqs"
	"vgw"
	"vpc"
)

credentailsDir=~/.aws

for resource in ${resources[@]}; do

	echo "Generating $resource"

	set +e

	docker run --rm \
		--volume "$credentailsDir:/root/.aws" \
		jeffashton/terraforming $resource \
		> "$resource.txt"

	if [ "$?" != "0" ]; then
		echo "  ERROR: Failed to generate $resource"
	fi

	set -e

done

