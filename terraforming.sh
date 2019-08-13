#!/bin/bash
set -eu

credentailsDir=~/.aws

docker run -i --rm \
	--volume "$credentailsDir:/root/.aws" \
	jeffashton/terraforming $@
