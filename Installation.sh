#!/bin/bash

UserId=$(id -u)
#id -u command will give the userid of the user and for ROOT its always ZERO
echo " User id form the id command $UserId"

if [ $# -eq 0 ]; then
#($# means no of arguments being passed to script if not vars passed it will exit )
  echo " Please pass the required software to install"
  exit 1
fi
if [ $UserId -ne 0 ]; then
    echo "User is not root, So skipping the isntallation"
    exit 1
else
  for args in $@ #($@ means  all variables passed to that script )
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