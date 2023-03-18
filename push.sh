#!/bin/bash

[[ $DEBUG = true ]] && set -x

for image in $(docker images --filter=label=org.ustcmirror.images=true --format="{{.Repository}}:{{.Tag}}")
do
    docker push "$image"
    echo "$image pushed"
done

