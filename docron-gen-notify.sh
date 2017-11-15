#!/bin/sh

if [[ ! -z "${TARGET}" ]]; then

    HEAD=$(head -n1 "${TARGET}" | grep 'NOTIFY_CONTAINER=');
    if [[ ! -z "${HEAD}" ]]; then
        export NOTIFY_CONTAINER=$(echo "${HEAD}" | cut -d "=" -f 2)
    fi;
fi;

exec /notify-orig.sh