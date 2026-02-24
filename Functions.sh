#!/bin/bash

Red='\e[31m'
Green='\e[32m'
Blue='\e[34m'
Yellow='\e[33m'
Na='\e[0m'

Args_Check(){
if [ $# -eq 0 ]; then
  echo -e "$Red Please pass the required packages/software to install as Arguments $Na"
  exit 1
fi
}

User_Check(){
if [ $(id -u) -ne 0 ]; then
  echo -e "$Blue User is not root Hence skipping the installtion $Na"
  exit 1
else
  Args_Check $@
  Software_Install $@
fi
}




Software_Install() {

  for args in $@
    do 
      pkg=$(rpm -q $args )
      if [ $? -ne 0 ]; then
          echo -e "$Red Pacakage is not there $Na"
          echo -e "$Blue Package $args is getting installed $Na"
          dnf install $args -y 
          echo -e "$Green Package is installed $Na"
      else 
        echo -e "$Green $args is already installed $Na "
      fi
  done 
}

Software_Remove(){
 for args in $@
    do 
      pkg=$(rpm -q $args )
      if [ $? -eq 0 ]; then
          echo -e "$Red Pacakage is not there $Na"
          echo -e "$Blue Package $args is getting installed $Na"
          dnf remove $args -y 
          echo -e "$Green Package is installed $Na"
      else 
        echo -e "$Green $args is not installed $Na "
      fi
  done 
}
User_Check $@


