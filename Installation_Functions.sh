#!/bin/bash

#COLOURS
Red='\e[31m'
Green='\e[32m'
Blue='\e[34m'
yellow='\e[33m'
Na='\e[0m'
if [ $# -eq 0 ]; then
  echo "$Red Please pass the required packages/software to install as Arguments $Na"
  exit 1
fi

if [ $(id -u) -ne 0]; then
  echo "$Blue User is not root Hence skipping the installtio $Na"
  exit 1
else 
  Software_Install $@
fi

Software_Install() {

#Checking if its already installed or not

  for args in $@
  do
    pkg=$(rpm -q $@)
    if [ $? -eq 0 ]; then
      echo -e "$Green The Package $args is already installed $Na "
    else 
      echo -e "$Yellow Installing $args $Na"
      dnf install $args
      echo "$Green Package $args Installed $Na"
  done 
}
