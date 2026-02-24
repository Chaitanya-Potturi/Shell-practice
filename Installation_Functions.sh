#!/bin/bash

#COLOURS
Red='\e[31m'
Green='\e[32m'
Blue='\e[34m'
yellow='\e[33m'
Na='\e[0m'

Software_Install() {

#Checking if its already installed or not

  for args in $@
  do
    pkg=$(rpm -q $args)
    if [ $? -eq 0 ]; then
      echo -e "$Green The Package $args is already installed $Na "
    else 
      echo -e "$Yellow Installing $args $Na"
      dnf install $args
      echo -e "$Green Package $args Installed $Na"
    fi 
  done 
}

if [ $# -eq 0 ]; then
  echo -e "$Red Please pass the required packages/software to install as Arguments $Na"
  exit 1
fi

if [ $(id -u) -ne 0 ]; then
  echo -e "$Blue User is not root Hence skipping the installtion $Na"
  exit 1
else 
  Software_Install $@
fi


