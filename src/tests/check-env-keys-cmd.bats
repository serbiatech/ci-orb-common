#!/usr/bin/env bats

setup() {
    source ../scripts/check-env-keys-cmd
}

#teardown() {
#    # executed after each test
#    echo "teardown" >&3
#}

@test "1: Test first env variable isn't set" {
    export STECH_ENV_KEYS_FOR_CHECK="FIRST_TEST_KEY SECOND_TEST_KEY"

    result=$(checkEnvKeys)
    echo "$result"
    [ "$result" == "FIRST_TEST_KEY environment variable is not set." ]
}

@test "2: Test second env variable isn't set" {
    export STECH_ENV_KEYS_FOR_CHECK="FIRST_TEST_KEY SECOND_TEST_KEY"
    export FIRST_TEST_KEY="first_test_value"

    result=$(checkEnvKeys)
    [ "$result" == "SECOND_TEST_KEY environment variable is not set." ]
}