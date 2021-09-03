#!/bin/bash

docker run --rm -i \
    -e GRADLE_USER_HOME=/gradle/repository \
    -v /gradle/repository:/gradle/repository \
    -v ${PWD}:/workspace \
    openjdk:8-jdk-alpine \
    sh -c 'cd /workspace && sh publish.sh'