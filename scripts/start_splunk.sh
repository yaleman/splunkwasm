#!/bin/bash
docker run --rm \
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

if [ "$*" == "--wait" ]; then
    while true; do
        # run curl against splunk's web port
        STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" http://localhost:8000)
        if [ "$STATUS_CODE" -lt 400 ]; then
            break
        fi
        echo "Waiting for Splunk to start..."
        sleep 5
    done
    echo "Splunk should be started now."
fi

