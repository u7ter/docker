#!/bin/bash

REGISTRY='mars16' # or use you registry ids

echo "********************************************************************************"
echo "Build new base image"
echo "********************************************************************************"
echo ""

read -r -p "Enter image tag [latest]: " TAG
TAG=${TAG:-latest}

ROOT_PASSWORD=''
until [[ "$ROOT_PASSWORD" != '' ]]; do
    read -r -p "Enter new password for root: " ROOT_PASSWORD
done

echo -e "\nBegin\n"

docker build --build-arg ROOT_PASSWORD="$ROOT_PASSWORD" -t $REGISTRY/base:$TAG .

if [ $? -ne 0 ]; then
    echo -e "\nBuild Failed!\n"
    exit 1
fi

echo -e "\nBuild completed\n"

read -r -p "Push this image to docker registry ($REGISTRY) [y/N]?" -n1 PUSH_TO_REGISTRY
PUSH_TO_REGISTRY=${PUSH_TO_REGISTRY:-N}
if [[ $PUSH_TO_REGISTRY =~ ^(y|Y) ]]; then
    echo ""
    docker push $REGISTRY/base:$TAG
fi

echo -e "\nDone"


