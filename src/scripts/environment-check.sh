#!/usr/bin/env bash

checkEnvKeys () {

  echo $1

#  read -r -a keys <<< "${STECH_ENV_KEYS_FOR_CHECK}"
#
#  for key in "${keys[@]}"
#  do
#    set -e
#    if [ -z "${!key}" ]; then
#      echo "$key environment variable is not set."
##      exit 1
#    fi
#  done
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    checkEnvKeys
fi
