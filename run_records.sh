#!/bin/bash

cd records-docs
# Compile
echo $'******* Step 1 ********\nCompile ...'
make html

# Copy to release files
echo $'\n******* Step 2 ********\nCopy the html to githubio.records ...'
cp -r build/html/* ../../records
