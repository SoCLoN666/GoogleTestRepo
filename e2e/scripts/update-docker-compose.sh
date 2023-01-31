#!/bin/bash

FILE=./docker-compose.chromium.yml
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
fi