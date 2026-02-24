#!/bin/bash

UserId=$(id -u)
echo " User id form the id command $UserId"

if [ -z $# ]; then
  echo " Please pass the required software to install"
  exit 1
else
  for args in $@
  do
    # elif [ $# -gt 1 ]; then
    #   echo " please pass only one software to install at one time"
    #   exit 1
    if [ $UserId -eq 0 ]; then
      echo "User is root, So proceed with the isntallation"
      echo " Installing $@"
      dnf install $args -y 
    else 
      echo "User is $(whoami) is not root user, Hence skipping installation"
    fi
  done
fi