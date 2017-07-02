#!/usr/bin/env bash

# Main driver to build programs
# Author Xin Shi <shixin@ihep.ac.cn>
# Created [2016-03-28 Mon 08:19]


if [[ $# -eq 0 ]]; then 
    printf "NAME\n\tbuild.sh - Main driver to build programs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./build.sh [OPTION]" 
    printf "\nOPTIONS\n" 
    printf "\n\t%-5s  %-40s\n"  "1"  "build DD_D0 analyzer" 
    printf "\n\t%-5s  %-40s\n"  "2"  "build DD_D0bar analyzer" 
fi

option=$1

case $option in 
    1) echo "Building DD_D0 module..."
       cd Analysic/Physics/DD/DD-00-00-01/cmt/
       cmt config
       source setup.sh
       make  
       ;;
    2) echo "Building DD_D0bar module..."
       cd Analysic/Physics/DD/DD-00-00-02/cmt/
       cmt config
       source setup.sh
       make  
       ;;
esac
