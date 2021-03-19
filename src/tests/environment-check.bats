#!/usr/bin/env bats

setup() {
    source ./src/scripts/environment-check.sh
}

@test "Test all env variable are set" {
    result=$(
      export STECH_ENV_KEYS_FOR_CHECK="FIRST_TEST_KEY SECOND_TEST_KEY" && \
      export FIRST_TEST_KEY=test-value-1 && \
      export SECOND_TEST_KEY=test-value-2 && \
      checkEnvKeys
    )
    [ -z "$result" ]
}

@test "Test first env variable isn't set" {

    local result

#    checkStatus () {
#      checkEnvKeys
#
#      if [ "$?" -ne 0 ]; then
#          echo "FIRST_TEST_KEY environment variable is not set."
#      fi
#    }

    result=$(
      export STECH_ENV_KEYS_FOR_CHECK="FIRST_TEST_KEY SECOND_TEST_KEY" && \
      export SECOND_TEST_KEY=test-value-2 && \
      checkEnvKeys 2>&1
    )

    [ "$result" == "FIRST_TEST_KEY environment variable is not set." ]
#    [ "$result" -ne 0 ]
}
#
#@test "Test second env variable isn't set" {
#    export FIRST_TEST_KEY="first_test_value"
#
#    result=$(checkEnvKeys)
#    [ "$result" == "SECOND_TEST_KEY environment variable is not set." ]
#}