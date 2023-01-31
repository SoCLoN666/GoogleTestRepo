#!/bin/bash

IFS='%'

YAML_DATA="version: '3.0'
services:
  e2e-tests:
    build:
      context: .
      dockerfile: Dockerfile.chromium
    volumes:
      - ./e2e:/home/node/app/e2e
      - ./playwright-report:/home/node/app/playwright-report
      - ${PWD}/package.json:/home/node/app/package.json
      - /home/node/app/node_modules
    command: npm test"

updateDockerComposeYml() {
    FILE=./docker-compose.chromium.yml
    if [ -f "$FILE" ]; then
        echo "$FILE exists."
        
    else 
        echo "$FILE does not exist."

        touch docker-compose.chromium.yml

        echo $YAML_DATA >> ./docker-compose.chromium.yml

        exec 3>&-
    fi
} 

updateDockerComposeYml
