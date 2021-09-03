#!/bin/bash

IMAGE_NAME=${IMAGE_NAME:-java-ci}
echo "IMAGE_NAME: "$IMAGE_NAME

IMAGE_TAG=${IMAGE_TAG:-1.0.0}
echo "IMAGE_TAG: "$IMAGE_TAG


docker build --no-cache --disable-content-trust=true --build-arg JAR_FILE=build/libs/*.jar -t $IMAGE_NAME:${IMAGE_TAG} -f ./docker/Dockerfile .
#docker push ${IMAGE_NAME}:${IMAGE_TAG}
#docker rmi ${IMAGE_NAME}:${IMAGE_TAG}