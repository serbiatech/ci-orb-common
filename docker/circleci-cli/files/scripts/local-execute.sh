#!/usr/bin/env bash

# Constants

DOCKER_SOCKET=/var/run/docker.sock
CIRCLECI_CONFIG=.circleci/config.yml
CIRCLECI_LOCAL_BUILD_CONFIG=local_build_config.yml
CIRCLECI_LOCAL_BUILD_REPOSITORY=/tmp/_circleci_local_build_repo

# Read job name from input

JOB_NAME=$1

# Remove old config if exists

rm -f ${CIRCLECI_LOCAL_BUILD_CONFIG}

# Process new config

circleci config process ${CIRCLECI_CONFIG} >> ${CIRCLECI_LOCAL_BUILD_CONFIG}

# Run command for the local execution of the job

docker run -v ${DOCKER_SOCKET}:${DOCKER_SOCKET} \
       -v "${HOST_PROJECT_ROOT}":${CIRCLECI_LOCAL_BUILD_REPOSITORY} \
       -w "${HOST_PROJECT_ROOT}" \
       circleci/picard circleci execute \
       -c ${CIRCLECI_LOCAL_BUILD_REPOSITORY}/${CIRCLECI_LOCAL_BUILD_CONFIG} \
       --job "$JOB_NAME"
