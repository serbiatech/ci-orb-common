#!/bin/bash

ORB_TEST_ENV="bats-core"

checkEnvKeys () {
  for key in "${STECH_ENV_KEYS_FOR_CHECK[@]}"
  do
    set -e
    if [ -z "${!key}" ]; then
      echo "$key environment variable is not set."
      exit 1
    fi
  done
}

# Will not run if sourced for bats-core tests.
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    checkEnvKeys
fi


export STECH_ENV_KEYS_FOR_CHECK=("DOCKERHUB_USERNAME" "DOCKERHUB_PASSWORD")
export DOCKERHUB_USERNAME="DOCKERHUB_USERNAME"

checkEnvKeys