#!/bin/bash

Red='\e[31m'
Green='\e[32m'
Blue='\e[34m'
Yellow='\e[33m'
Na='\e[0m'

Software_Install() {

  for args in $@
    do 
      pkg=$(rpm -q $args )
      if [ $? -ne 0 ]
          echo -e "$Red Pacakage is not there $Na"
          echo -e "$Blue Package $args is getting installed $Na"
          dnf install $args -y 
          echo -e "$Green Package is installed $Na"
      else 
        echo -e "$Green $args is already installed $Na "
    
  done 
}

Software_Remove(){
 echo ""
}
Software_Install $@