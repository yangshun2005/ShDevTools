#!/bin/bash
set -eu

echo "function:"
aws lambda get-function --function-name $1

echo "event source mappings:"
aws lambda list-event-source-mappings --function-name $1

echo "policy:"
aws lambda get-policy --function-name $1

echo "aliases:"
aws lambda list-aliases --function-name $1

functionArn=$(aws lambda get-function-configuration --function-name $1 --query "FunctionArn" --output "text")

echo "tags:"
aws lambda list-tags --resource $functionArn
