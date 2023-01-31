#!/bin/bash

cleanUp() {
    rm ./docker-compose.chromium.yml 
    rm ./Dockerfile.chromium

    echo "docker-compose.chromium.yml and Dockerfile.chromium succesfully removed!"
}

cleanUp