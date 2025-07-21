#!/bin/bash

source config.sh

IMG=$REGISTRY/$REGISTRY_USER/petstore:1.35.0

docker build -f ../1.35.0/docker/Dockerfile \
  --tag $IMG \
  ../src/main/resources

docker push $IMG
