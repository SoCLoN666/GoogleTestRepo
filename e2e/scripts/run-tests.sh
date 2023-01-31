#!/bin/bash

RUN_TESTS="npm test"

runAllTests() {
    echo "TESTS STARTED ..."
    
    eval $RUN_TESTS
}

runAllTests