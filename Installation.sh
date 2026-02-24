#!/bin/bash

UserId=$(id -u)

if [UserId eq 0] ; then
  echo "User is root, So proceed with the isntallation"
  echo " Installing $1"
  dnf install $1
else 
  echo "User is $(whoami) User is not root, Hence skipping installation"
fi
