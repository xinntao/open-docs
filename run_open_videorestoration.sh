#!/bin/bash

cd open-videorestoration-docs
# Compile
echo $'******* Step 1 ********\nCompile ...'
make html

# Copy to release files
echo $'\n******* Step 2 ********\nCopy the html to githubio.open-videorestoration ...'
cp -r build/html/* ../../open-videorestoration