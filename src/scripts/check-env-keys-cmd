#!/bin/bash

ORB_TEST_ENV="bats-core"

checkEnvKeys () {

  read -r -a keys <<< "${STECH_ENV_KEYS_FOR_CHECK}"

  for key in "${keys[@]}"
  do
    set -e
    if [ -z "${!key}" ]; then
      echo "$key environment variable is not set."
      exit 1
    fi
  done
}

# Will not run if sourced for bats-core tests.
if [ "${0#*$ORB_TEST_ENV}" = "$0" ]; then
    checkEnvKeys
fi
