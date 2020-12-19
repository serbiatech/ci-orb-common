#!/usr/bin/env bats

# Runs prior to every test
setup() {
#    export STECH_ENV_KEYS_FOR_CHECK="FIRST_TEST_KEY SECOND_TEST_KEY"

    # Load our script file.
    source ./src/scripts/environment-check.sh
}

#teardown() {
#    # executed after each test
#    echo "teardown" >&3
#}

@test "Test first env variable isn't set" {
    result=$(checkEnvKeys "FIRST_TEST_KEY")
    [ "$result" == "FIRST_TEST_KEY" ]
}
#
#@test "Test second env variable isn't set" {
#    export FIRST_TEST_KEY="first_test_value"
#
#    result=$(checkEnvKeys)
#    [ "$result" == "SECOND_TEST_KEY environment variable is not set." ]
#}