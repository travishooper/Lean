#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t quantconnect/lean:latest -t quantconnect/lean:$TRAVIS_COMMIT .
docker push quantconnect/lean:latest
docker push quantconnect/lean:$TRAVIS_COMMIT