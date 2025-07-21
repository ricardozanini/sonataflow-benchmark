#!/bin/bash

NS=sonataflow-benchmark-1-35-0

oc create namespace $NS

./deploy-workflow.sh ../1.35.0/kubernetes/petstore.yaml petstore $NS
