#!/bin/bash

NS=sonataflow-benchmark-1-36-0

oc create namespace $NS

./deploy-workflow.sh ../1.36.0/kubernetes/petstore.yaml petstore $NS
