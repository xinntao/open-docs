#!/bin/bash

# Compile
echo $'******* Step 1 ********\nCompile ...'
make html

# Copy to release files
echo $'\n******* Step 2 ********\nCopy the html to githubio.records ...'
cp -r _build/html/* ../../records