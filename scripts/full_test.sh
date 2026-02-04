#!/bin/bash

set -e

MYDIR="$(dirname "$0")"

"$MYDIR/start_splunk.sh" --wait

mise package

RUN_OUTPUT="$("$MYDIR/run_in_docker.sh")"
echo "${RUN_OUTPUT}"

if [[ "${RUN_OUTPUT}" != *"Success"* ]]; then
    echo 'Expected "Success" in run_in_docker stdout.'
    exit 1
fi
