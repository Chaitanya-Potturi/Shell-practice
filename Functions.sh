#!/bin/bash

Software_Install() {

  for args in $@
  do
    dnf install $args
  done 
}

Software_Remove(){

}
Software_Install $@