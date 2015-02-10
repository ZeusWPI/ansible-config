#!/usr/bin/env bats

@test "Check that Apt has been updated" {
    result="$(sudo apt-get -s upgrade | grep -C 0 installed | awk '{print $1}')"
    [ "$result" -eq 0 ]
}

@test "Check that Imagemagick was installed" {
    result="$(identify -version | grep "Version" --count)"
    [ "$result" -eq 0 ]
}