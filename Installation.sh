#!/bin/bash

UserId=$(id -u)
#echo " User id form the id command $UserId"

if [ $# -eq 0 ]; then
  echo " Please pass the required software to install"
  exit 1
fi
if [ $UserId -eq 0 ]; then
    echo "User is not root, So skipping the isntallation"
    exit 1
elif 
  for args in $@
    do
      # elif [ $# -gt 1 ]; then
      #   echo " please pass only one software to install at one time"
      #   exit 1
        software=$(rpm -q "$args")
        if [ $? -eq 0 ]; then
          echo "$args is already installed"  
        else
          echo " Installing $args as it was not installed"
          dnf install $args -y 
        fi
    done
fi