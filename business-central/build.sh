#!/bin/bash

# ***************************************************
# jBPM Workbench Showcase - Docker image build script
# ***************************************************

IMAGE_NAME="bennersaude/business-central"
IMAGE_TAG="7.14.0.Final.neobe.1"


# Build the container image.
echo "Building the Docker container for $IMAGE_NAME:$IMAGE_TAG.."
docker build --rm --no-cache -t $IMAGE_NAME:$IMAGE_TAG .
echo "Build done"
