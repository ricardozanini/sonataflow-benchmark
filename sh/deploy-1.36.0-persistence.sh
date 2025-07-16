#!/bin/bash

source config.sh

NS=sonataflow-benchmark-1-36-0-persistence

oc create namespace $NS

kubectl kustomize ../1.36.0/kubernetes | kubectl apply -f - -n $NS

wait_for_service "postgres" $NS

kubectl apply -f ../1.36.0/kubernetes/01-petstore-persistence-props.yaml -n $NS

./deploy-workflow.sh ../1.36.0/kubernetes/02-petstore-persistence.yaml petstore $NS
