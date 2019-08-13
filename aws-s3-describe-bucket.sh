#!/bin/bash
set -eu

echo "head:"
aws s3api head-bucket --bucket $1

set +e

echo "accelerate configuration:"
aws s3api get-bucket-accelerate-configuration --bucket $1

echo "acl:"
aws s3api get-bucket-acl --bucket $1

echo "cors:"
aws s3api get-bucket-cors --bucket $1

echo "encryption:"
aws s3api get-bucket-encryption --bucket $1

echo "lifecycle configuration:"
aws s3api get-bucket-lifecycle-configuration --bucket $1

echo "location:"
aws s3api get-bucket-location --bucket $1

echo "logging:"
aws s3api get-bucket-logging --bucket $1

echo "notification configuration:"
aws s3api get-bucket-notification-configuration --bucket $1

echo "policy:"
aws s3api get-bucket-policy --bucket $1

echo "replication:"
aws s3api get-bucket-replication --bucket $1

echo "request payment:"
aws s3api get-bucket-request-payment --bucket $1

echo "tagging:"
aws s3api get-bucket-tagging --bucket $1

echo "versioning:"
aws s3api get-bucket-versioning --bucket $1

echo "website:"
aws s3api get-bucket-website --bucket $1

echo "analytics configurations:"
aws s3api list-bucket-analytics-configurations --bucket $1

echo "inventory configurations:"
aws s3api list-bucket-inventory-configurations --bucket $1

echo "metrics configurations:"
aws s3api list-bucket-metrics-configurations --bucket $1