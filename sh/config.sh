#!/bin/bash

REGISTRY_USER=$USER
REGISTRY=quay.io

# Define the function
wait_for_service() {
  local service="$1"
  local namespace="$2"
  # Poll until the service exists
  echo "Waiting for service '$service' to be created in namespace: '$namespace'..."

  until oc get svc "$service" -n "$namespace" &> /dev/null; do
    sleep 1
  done
}
