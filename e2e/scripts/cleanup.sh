#!/bin/bash

cleanUp() {
    rm ./docker-compose.chromium.yml 

    echo "docker-compose.chromium.yml succesfully removed!"
}

cleanUp d