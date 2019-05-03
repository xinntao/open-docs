#!/bin/bash

cd records-docs
if [ -d "build" ]; then
  rm -r build
fi

# Compile
echo $'\n***********************\n******* Step 1 ********\n***********************'
echo 'Compile ...'
make html

if [ -d "../../records" ]; then
  rm -r ../../records/*
  # Copy to release files
  echo $'\n***********************\n******* Step 2 ********\n***********************'
  echo 'Copy the html to githubio.records ...'
  cp -r build/html/* ../../records
  # compatible with github jekyll
  python ../../sphinxtogithub.py ../../records
fi
