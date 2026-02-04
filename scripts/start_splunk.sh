#!/bin/bash
docker run --rm -it \
    --name splunkwasm \
    -e SPLUNK_GENERAL_TERMS=--accept-sgt-current-at-splunk-com \
    -e SPLUNK_START_ARGS=--accept-license \
    -e SPLUNK_PASSWORD=Helloworld1234 \
    -p 8000:8000 \
    -p 8088:8088 \
    -p 8089:8089 \
    --platform linux/amd64 \
    -d \
    splunk/splunk:latest
docker logs -f splunkwasm
