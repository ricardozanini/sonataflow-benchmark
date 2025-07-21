#!/bin/bash

source config.sh

IMG=$REGISTRY/$REGISTRY_USER/petstore:1.36.0-persistence

QUARKUS_EXTENSIONS=io.quarkus:quarkus-jdbc-postgresql:3.15.4.redhat-00001,io.quarkus:quarkus-agroal:3.15.4.redhat-00001,org.kie:kie-addons-quarkus-persistence-jdbc:9.103.0.redhat-00004

docker build -f ../1.36.0/docker/Dockerfile \
  --build-arg=QUARKUS_EXTENSIONS=$QUARKUS_EXTENSIONS \
  --tag $IMG \
  ../src/main/resources

docker push $IMG
