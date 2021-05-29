#!/bin/bash

## Copyright (c) 2021 mangalbhaskar. All Rights Reserved.
##__author__ = 'mangalbhaskar'
###----------------------------------------------------------
## date utility functions
###----------------------------------------------------------


## Todo: date formatting different types
function _date_.get() {
  echo $(date +"%d-%b-%Y, %A");
}


function _date_.get__timestamp() {
  ## second, 010129_012650
  local __TIMESTAMP__=$(date -d now +'%d%m%y_%H%M%S')
  echo "${__TIMESTAMP__}"
}


function _date_.get__timestamp_millisec() {
  ## millisecond, 010129_012650_053, milli e−3
  local __TIMESTAMP__=$(date -d now +'%d%m%y_%H%M%S_%3N')
  echo "${__TIMESTAMP__}"
}


function _date_.get__timestamp_microsec() {
  ## nanosecond, 010129_012650_053993752, micro is e−6 
  ## References:
  ## * https://stackoverflow.com/a/18704121
  local __TIMESTAMP__=$(date -d now +'%d%m%y_%H%M%S_%6N')
  echo "${__TIMESTAMP__}"
}


function _date_.get__timestamp_nanosec() {
  ## nanosecond, 010129_012650_053993752, nano is e−9
  ## References:
  ## * https://stackoverflow.com/a/18704121
  local __TIMESTAMP__=$(date -d now +'%d%m%y_%H%M%S_%N')
  echo "${__TIMESTAMP__}"
}
