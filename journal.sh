#!/bin/bash

FILE_PATH=~/Documents/Journal 
EDITOR=nvim

if [ ! -d $FILE_PATH ]
then
  read -p 'No journal directory was found. Create ~/Documents/Journal? [Y/n] ' input

  case $input in
    [yY][eE][sS] | [yY])
      mkdir -p $FILE_PATH
      ;;
    [nN][oO] | [nN])
      echo 'Please edit the source code if you want a custom file path.'
      exit 0
      ;;
  esac
fi

DATE_DIR=${FILE_PATH}/$(date +%Y)/$(date +%B) 
[ ! -d $DATE_DIR ] && mkdir -p $DATE_DIR

$EDITOR ${DATE_DIR}/$(date +%d-%m-%y)

exit 0
