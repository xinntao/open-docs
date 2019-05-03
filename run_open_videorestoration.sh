#!/bin/bash

cd open-videorestoration-docs
if [ -d "build" ]; then
  rm -r build
fi

# Compile
echo $'\n***********************\n******* Step 1 ********\n***********************'
echo 'Compile ...'
make html

if [ -d "../../open-videorestoration" ]; then
  rm -r ../../open-videorestoration/*
  # Copy to release files
  echo $'\n***********************\n******* Step 2 ********\n***********************'
  echo 'Copy the html to githubio.open-videorestoration ...'
  cp -r build/html/* ../../open-videorestoration
  # compatible with github jekyll
  python ../../sphinxtogithub.py ../../open-videorestoration
fi
