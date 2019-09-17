#!/usr/bin/env bash

set -e -o pipefail

TF_OUTPUT=$(cd ../terraform && terraform output -json)
CLUSTER_NAME="$(echo ${TF_OUTPUT} | jq -r .kubernetes_cluster_name.value)"
STATE="s3://$(echo ${TF_OUTPUT} | jq -r .kops_s3_bucket.value)"

kops delete cluster --name ${CLUSTER_NAME} --state ${STATE} --yes
