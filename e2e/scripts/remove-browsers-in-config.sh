#!/bin/bash
removeFireFoxAndWebKitBrowsers() {

    echo "removing firefox and webkit browsers from config..."
 
    for i in 54 54 54 54 54 54 54 54 54 54 54 54 54 54
    do 
        sed -i "54 d" ./playwright.config.ts
    done

    echo "firefox and webkit browsers are succesfully removed!"
}

removeFireFoxAndWebKitBrowsers