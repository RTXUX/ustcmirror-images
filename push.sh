#!/bin/bash

[[ $DEBUG = true ]] && set -x

[[ -z $SKIP_LOGIN ]] && docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"

for image in $(docker images --filter=label=org.ustcmirror.images=true --format="{{.Repository}}:{{.Tag}}")
do
    docker push "$image"
    echo "$image pushed"
done

