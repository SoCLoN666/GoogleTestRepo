#!/bin/bash
removeFireFoxAndWebKitBrowsers() {

 
    for i in 54 54 54 54 54 54 54 54 54 54 54 54 54 54
    do 
        sed -i "54 d" ./playwright.config.ts
    done
}

removeFireFoxAndWebKitBrowsers