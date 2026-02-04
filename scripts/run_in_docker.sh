#!/bin/bash

CONTAINER_NAME="splunkwasm"

if [ -z "$(docker ps --filter "name=${CONTAINER_NAME}" -q)" ]; then
    echo "Can't find ${CONTAINER_NAME} container. Please start it with start_splunk.sh"

    exit 1
fi

PYTHON_VERSION="3.13"
if [ -n "$1" ]; then
    PYTHON_VERSION="$1"
fi

if [[ "${PYTHON_VERSION}" != "3."* ]]; then
    echo "Invalid python version specified: ${PYTHON_VERSION}"
    exit 1
fi

# we can't use 3.9
if [[ "${PYTHON_VERSION}" == "3.9" ]]; then
    echo "Python 3.9 is not supported by pywasm. Please use a different version."
    exit 1
fi

echo "Using python version ${PYTHON_VERSION}"

echo "Cleaning up previous package in ${CONTAINER_NAME}..."
docker exec -i --user root "${CONTAINER_NAME}" rm -rf /home/ansible/splunkwasm
echo "Copying package to ${CONTAINER_NAME} and running it..."
docker cp package "${CONTAINER_NAME}":/home/ansible/
docker exec -i --user root "${CONTAINER_NAME}" "/opt/splunk/bin/python${PYTHON_VERSION}" /home/ansible/package/splunkwasm/__main__.py