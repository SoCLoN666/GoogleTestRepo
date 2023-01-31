#!/bin/bash\

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

DOCKERFILE_DATA='FROM mcr.microsoft.com/playwright:v1.30.0-focal as base

WORKDIR /home/node/app

COPY package.json ./
RUN npm install

COPY . .
RUN npx playwright install 

RUN chmod +x ./e2e/scripts/remove-browsers-in-config.sh
RUN sh ./e2e/scripts/remove-browsers-in-config.sh

RUN chmod +x ./e2e/scripts/run-tests.sh
ENTRYPOINT ["./e2e/scripts/run-tests.sh"]'

createDockerComposeYml() {
    FILE=./docker-compose.chromium.yml
    if [ -f "$FILE" ]; then
        echo "$FILE exists."
        
    else 
        echo "$FILE does not exist."
        echo "creation of $FILE ..."

        touch docker-compose.chromium.yml

        echo $YAML_DATA >> ./docker-compose.chromium.yml

        exec 3>&-
    fi
} 

createDockerFile() {
    FILE=./Dockerfile.chromium
    if [ -f "$FILE" ]; then
        echo "$FILE exists."
        
    else 
        echo "$FILE does not exist."
        echo "creation of $FILE ..."

        touch Dockerfile.chromium

        echo $DOCKERFILE_DATA >> ./Dockerfile.chromium

        exec 3>&-
    fi
} 

createDockerFile
createDockerComposeYml
