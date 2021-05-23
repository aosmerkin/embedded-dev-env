#!/bin/bash

DEFAULT_DEVELOPER_USER_ID=`id -u`
DEFAULT_DEVELOPER_GROUP_ID=`id -g`
DEFAULT_WORKSPACE=../embedded-workspace
export DEVELOPER_USER_ID=${DEVELOPER_USER_ID:-${DEFAULT_DEVELOPER_USER_ID}}
export DEVELOPER_GROUP_ID=${DEVELOPER_GROUP_ID:-${DEFAULT_DEVELOPER_GROUP_ID}}
export WORKSPACE=${WORKSPACE:-${DEFAULT_WORKSPACE}}

case "$1" in
build)
    docker-compose build
    ;;
start)
    docker-compose up -d --remove-orphans --force-recreate -V
    ;;
stop)
    docker-compose down
    ;;
exec)
    shift
    docker-compose exec embedded-dev-env "$@"
    ;;
*)
    docker-compose "$@"
    ;;
esac
