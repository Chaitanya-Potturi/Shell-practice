#!/bin/bash

UserId=$(id -u)
echo " User id fomr the id command $UserId"

if [ -z $1 ]; then
  echo " Please pass the required software to install"
elif [ $# -gt 1 ]; then
  echo " please pass only one software to install at one time"
  exit 1
elif [ $UserId -eq 0 ] ; then
  echo "User is root, So proceed with the isntallation"
  echo " Installing $1"
  dnf install $1 -y 
else 
  echo "User is $(whoami) User is not root, Hence skipping installation"
fi
