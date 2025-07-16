#!/bin/bash

source config.sh

FILE=$1
WF=$2
NS=$3

oc apply -f $FILE -n $NS

wait_for_service $WF $NS

oc expose service $WF \
  --name=$WF \
  --namespace=$NS \
  --port=8080

ROUTE_HOST=$(oc get route $WF -n $NS -o jsonpath='{.spec.host}')

echo "Use this url to access the workflow: http://$ROUTE_HOST/$WF"