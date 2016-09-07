#!/usr/bin/env bash

# Main driver to build programs
# Author Xin Shi <shixin@ihep.ac.cn>
# Created [2016-03-28 Mon 08:19]


if [[ $# -eq 0 ]]; then 
    printf "NAME\n\tbuild.sh - Main driver to build programs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./build.sh [OPTION]" 
    printf "\nOPTIONS\n" 
    printf "\n\t%-5s  %-40s\n"  "1"  "build d0bard0 analyzer" 
    printf "\n\t%-5s  %-40s\n"  "2"  "build dd analyzer" 
fi

option=$1

case $option in 
    1) echo "Building d0bard0 module..."
       cd Analysic/Physics/D0barD0/D0barD0-00-00-01/cmt/ 
       cmt config
       source setup.csh
       make  
       ;;
esac

case $option in 
    2) echo "Building dd module..."
       cd Analysic/Physics/DDAlg/DDAlg-00-00-01/cmt/ 
       cmt config
       source setup.csh
       make  
       ;;
esac
