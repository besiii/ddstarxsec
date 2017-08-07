#!/usr/bin/env bash

# Main driver to submit jobs 
# Author SHI Xin <shixin@ihep.ac.cn>
# Created [2016-03-28 Mon 07:58]


usage() {
    printf "NAME\n\tsubmit.sh - Main driver to submit jobs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./submit.sh [OPTION]" 
    printf "\nOPTIONS\n" 
    printf "\n\t%-5s  %-40s\n"  "0.1"      "[Split data sample]" 
    printf "\n\t%-5s  %-40s\n"  "0.1.1"    "Split data_3810 sample with each group 10G" 
    printf "\n\t%-5s  %-40s\n"  "0.1.2"    "Split data_3890 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.3"    "Split data_3900 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.4"    "Split data_3950 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.5"    "Split data_3980 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.6"    "Split data_4010 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.7"    "Split data_4030 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.8"    "Split data_4040 sample with each group 10G" 
    printf "\n\t%-5s  %-40s\n"  "0.1.9"    "Split data_4055 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.10"    "Split data_4070 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.11"    "Split data_4090 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.12"    "Split data_4120 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.13"    "Split data_4140 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.14"    "Split data_4150 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.15"    "Split data_4170 sample with each group 10G" 
    printf "\n\t%-5s  %-40s\n"  "0.1.16"    "Split data_4190 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.17"    "Split data_4210 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.18"    "Split data_4220 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.19"    "Split data_4230 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.20"    "Split data_4245 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.21"    "Split data_4260 sample with each group 10G" 
    printf "\n\t%-5s  %-40s\n"  "0.1.22"    "Split data_4310 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.23"    "Split data_4360 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.24"    "Split data_4390 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.2"      "[run data sample]" # submit D0bar jobs
    printf "\n\t%-5s  %-40s\n"  "0.2.1"    "Run with a few samples"
    printf "\n\t%-5s  %-40s\n"  "0.2.2"    "Submit condor jobs on data_3810"
    printf "\n\t%-5s  %-40s\n"  "0.2.3"    "Submit condor jobs on data_3890" 
    printf "\n\t%-5s  %-40s\n"  "0.2.4"    "Submit condor jobs on data_3900"     
    printf "\n\t%-5s  %-40s\n"  "0.2.5"    "Submit condor jobs on data_3950"     
    printf "\n\t%-5s  %-40s\n"  "0.2.6"    "Submit condor jobs on data_3980"     
    printf "\n\t%-5s  %-40s\n"  "0.2.7"    "Submit condor jobs on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.2.8"    "Submit condor jobs on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.2.9"    "Submit condor jobs on data_4040"
    printf "\n\t%-5s  %-40s\n"  "0.2.10"    "Submit condor jobs on data_4055"
    printf "\n\t%-5s  %-40s\n"  "0.2.11"    "Submit condor jobs on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.2.12"    "Submit condor jobs on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.2.13"    "Submit condor jobs on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.2.14"    "Submit condor jobs on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.2.15"    "Submit condor jobs on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.2.16"    "Submit condor jobs on data_4170"
    printf "\n\t%-5s  %-40s\n"  "0.2.17"    "Submit condor jobs on data_4190"
    printf "\n\t%-5s  %-40s\n"  "0.2.18"    "Submit condor jobs on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.2.19"    "Submit condor jobs on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.2.20"    "Submit condor jobs on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.2.21"    "Submit condor jobs on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.2.22"    "Submit condor jobs on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.2.23"    "Submit condor jobs on data_4310"
    printf "\n\t%-5s  %-40s\n"  "0.2.24"    "Submit condor jobs on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.2.25"    "Submit condor jobs on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.3"      "[Check condor jobs]" 
    printf "\n\t%-5s  %-40s\n"  "0.3.1"    "Check condor jobs on data_3810" 
    printf "\n\t%-5s  %-40s\n"  "0.3.2"    "Check condor jobs on data_3890"
    printf "\n\t%-5s  %-40s\n"  "0.3.3"    "Check condor jobs on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.3.4"    "Check condor jobs on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.3.5"    "Check condor jobs on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.3.6"    "Check condor jobs on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.3.7"    "Check condor jobs on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.3.8"    "Check condor jobs on data_4040" 
    printf "\n\t%-5s  %-40s\n"  "0.3.9"    "Check condor jobs on data_4055"
    printf "\n\t%-5s  %-40s\n"  "0.3.10"    "Check condor jobs on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.3.11"    "Check condor jobs on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.3.12"    "Check condor jobs on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.3.13"    "Check condor jobs on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.3.14"    "Check condor jobs on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.3.15"    "Check condor jobs on data_4170" 
    printf "\n\t%-5s  %-40s\n"  "0.3.16"    "Check condor jobs on data_4190"
    printf "\n\t%-5s  %-40s\n"  "0.3.17"    "Check condor jobs on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.3.18"    "Check condor jobs on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.3.19"    "Check condor jobs on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.3.20"    "Check condor jobs on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.3.21"    "Check condor jobs on data_4260" 
    printf "\n\t%-5s  %-40s\n"  "0.3.22"    "Check condor jobs on data_4310"
    printf "\n\t%-5s  %-40s\n"  "0.3.23"    "Check condor jobs on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.3.24"    "Check condor jobs on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.4"      "[Merge events files]" 
    printf "\n\t%-5s  %-40s\n"  "0.4.1"    "Merge events files on data_3810" 
    printf "\n\t%-5s  %-40s\n"  "0.4.2"    "Merge events files on data_3890"
    printf "\n\t%-5s  %-40s\n"  "0.4.3"    "Merge events files on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.4.4"    "Merge events files on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.4.5"    "Merge events files on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.4.6"    "Merge events files on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.4.7"    "Merge events files on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.4.8"    "Merge events files on data_4040" 
    printf "\n\t%-5s  %-40s\n"  "0.4.9"    "Merge events files on data_4055"
    printf "\n\t%-5s  %-40s\n"  "0.4.10"    "Merge events files on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.4.11"    "Merge events files on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.4.12"    "Merge events files on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.4.13"    "Merge events files on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.4.14"    "Merge events files on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.4.15"    "Merge events files on data_4170" 
    printf "\n\t%-5s  %-40s\n"  "0.4.16"    "Merge events files on data_4190"
    printf "\n\t%-5s  %-40s\n"  "0.4.17"    "Merge events files on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.4.18"    "Merge events files on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.4.19"    "Merge events files on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.4.20"    "Merge events files on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.4.21"    "Merge events files on data_4260" 
    printf "\n\t%-5s  %-40s\n"  "0.4.22"    "Merge events files on data_4310"
    printf "\n\t%-5s  %-40s\n"  "0.4.23"    "Merge events files on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.4.24"    "Merge events files on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.5"      "[Select events]" 
    printf "\n\t%-5s  %-40s\n"  "0.5.1"    "Submit events selection jobs on data_3810" 
    printf "\n\t%-5s  %-40s\n"  "0.5.2"    "Submit events selection jobs on data_3890"
    printf "\n\t%-5s  %-40s\n"  "0.5.3"    "Submit events selection jobs on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.5.4"    "Submit events selection jobs on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.5.5"    "Submit events selection jobs on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.5.6"    "Submit events selection jobs on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.5.7"    "Submit events selection jobs on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.5.8"    "Submit events selection jobs on data_4040" 
    printf "\n\t%-5s  %-40s\n"  "0.5.9"    "Submit events selection jobs on data_4055"
    printf "\n\t%-5s  %-40s\n"  "0.5.10"    "Submit events selection jobs on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.5.11"    "Submit events selection jobs on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.5.12"    "Submit events selection jobs on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.5.13"    "Submit events selection jobs on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.5.14"    "Submit events selection jobs on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.5.15"    "Submit events selection jobs on data_4170" 
    printf "\n\t%-5s  %-40s\n"  "0.5.16"    "Submit events selection jobs on data_4190"
    printf "\n\t%-5s  %-40s\n"  "0.5.17"    "Submit events selection jobs on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.5.18"    "Submit events selection jobs on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.5.19"    "Submit events selection jobs on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.5.20"    "Submit events selection jobs on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.5.21"    "Submit events selection jobs on data_4260" 
    printf "\n\t%-5s  %-40s\n"  "0.5.22"    "Submit events selection jobs on data_4310"
    printf "\n\t%-5s  %-40s\n"  "0.5.23"    "Submit events selection jobs on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.5.24"    "Submit events selection jobs on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.6"      "[Generate MC samples]" # tag D0bar with K+ and Pi- 
    printf "\n\t%-5s  %-40s\n"  "0.6.1"    "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV" 
    printf "\n\t%-5s  %-40s\n"  "0.6.2"    "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.6.3"    "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.6.4"    "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3800 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.6.5"    "Generate D0barstarD0star_D0bargamma MC samples taken at 18 center-of-mass energies from 4030 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.6.6"    "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.7"      "[Plot summary]" 
    printf "\n\t%-5s  %-40s\n"  "0.7.1"    "Plot momentum distribution or ... distribution on data_3890" 
    printf "\n\t%-5s  %-40s\n"  "0.7.2"    "Plot momentum distribution or ... distribution on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.7.3"    "Plot momentum distribution or ... distribution on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.7.4"    "Plot momentum distribution or ... distribution on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.7.5"    "Plot momentum distribution or ... distribution on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.7.6"    "Plot momentum distribution or ... distribution on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.7.7"    "Plot momentum distribution or ... distribution on data_4040"
    printf "\n\t%-5s  %-40s\n"  "0.7.8"    "Plot momentum distribution or ... distribution on data_4055" 
    printf "\n\t%-5s  %-40s\n"  "0.7.9"    "Plot momentum distribution or ... distribution on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.7.10"    "Plot momentum distribution or ... distribution on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.7.11"    "Plot momentum distribution or ... distribution on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.7.12"    "Plot momentum distribution or ... distribution on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.7.13"    "Plot momentum distribution or ... distribution on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.7.14"    "Plot momentum distribution or ... distribution on data_4170"
    printf "\n\t%-5s  %-40s\n"  "0.7.15"    "Plot momentum distribution or ... distribution on data_4190" 
    printf "\n\t%-5s  %-40s\n"  "0.7.16"    "Plot momentum distribution or ... distribution on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.7.17"    "Plot momentum distribution or ... distribution on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.7.18"    "Plot momentum distribution or ... distribution on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.7.19"    "Plot momentum distribution or ... distribution on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.7.20"    "Plot momentum distribution or ... distribution on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.7.21"    "Plot momentum distribution or ... distribution on data_4310" 
    printf "\n\t%-5s  %-40s\n"  "0.7.22"    "Plot momentum distribution or ... distribution on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.7.23"    "Plot momentum distribution or ... distribution on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.8"      "[Generate MC samples for first iteration]" # tag D0bar with K+ and Pi- 
    printf "\n\t%-5s  %-40s\n"  "0.8.1"    "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV" 
    printf "\n\t%-5s  %-40s\n"  "0.8.2"    "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.8.3"    "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.8.4"    "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3800 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.8.5"    "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.9"      "[Plot summary in first iteration]" 
    printf "\n\t%-5s  %-40s\n"  "0.9.1"    "Plot momentum distribution or ... distribution on data_3890" 
    printf "\n\t%-5s  %-40s\n"  "0.9.2"    "Plot momentum distribution or ... distribution on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.9.3"    "Plot momentum distribution or ... distribution on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.9.4"    "Plot momentum distribution or ... distribution on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.9.5"    "Plot momentum distribution or ... distribution on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.9.6"    "Plot momentum distribution or ... distribution on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.9.7"    "Plot momentum distribution or ... distribution on data_4040"
    printf "\n\t%-5s  %-40s\n"  "0.9.8"    "Plot momentum distribution or ... distribution on data_4055" 
    printf "\n\t%-5s  %-40s\n"  "0.9.9"    "Plot momentum distribution or ... distribution on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.9.10"    "Plot momentum distribution or ... distribution on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.9.11"    "Plot momentum distribution or ... distribution on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.9.12"    "Plot momentum distribution or ... distribution on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.9.13"    "Plot momentum distribution or ... distribution on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.9.14"    "Plot momentum distribution or ... distribution on data_4170"
    printf "\n\t%-5s  %-40s\n"  "0.9.15"    "Plot momentum distribution or ... distribution on data_4190" 
    printf "\n\t%-5s  %-40s\n"  "0.9.16"    "Plot momentum distribution or ... distribution on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.9.17"    "Plot momentum distribution or ... distribution on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.9.18"    "Plot momentum distribution or ... distribution on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.9.19"    "Plot momentum distribution or ... distribution on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.9.20"    "Plot momentum distribution or ... distribution on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.9.21"    "Plot momentum distribution or ... distribution on data_4310" 
    printf "\n\t%-5s  %-40s\n"  "0.9.22"    "Plot momentum distribution or ... distribution on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.9.23"    "Plot momentum distribution or ... distribution on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.10"      "[Generate MC samples for second iteration]" # tag D0bar with K+ and Pi- 
    printf "\n\t%-5s  %-40s\n"  "0.10.1"    "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV" 
    printf "\n\t%-5s  %-40s\n"  "0.10.2"    "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.10.3"    "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.10.4"    "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3800 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.10.5"    "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.11"      "[Plot summary in second iteration]" 
    printf "\n\t%-5s  %-40s\n"  "0.11.1"    "Plot momentum distribution or ... distribution on data_3890" 
    printf "\n\t%-5s  %-40s\n"  "0.11.2"    "Plot momentum distribution or ... distribution on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.11.3"    "Plot momentum distribution or ... distribution on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.11.4"    "Plot momentum distribution or ... distribution on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.11.5"    "Plot momentum distribution or ... distribution on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.11.6"    "Plot momentum distribution or ... distribution on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.11.7"    "Plot momentum distribution or ... distribution on data_4040"
    printf "\n\t%-5s  %-40s\n"  "0.11.8"    "Plot momentum distribution or ... distribution on data_4055" 
    printf "\n\t%-5s  %-40s\n"  "0.11.9"    "Plot momentum distribution or ... distribution on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.11.10"    "Plot momentum distribution or ... distribution on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.11.11"    "Plot momentum distribution or ... distribution on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.11.12"    "Plot momentum distribution or ... distribution on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.11.13"    "Plot momentum distribution or ... distribution on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.11.14"    "Plot momentum distribution or ... distribution on data_4170"
    printf "\n\t%-5s  %-40s\n"  "0.11.15"    "Plot momentum distribution or ... distribution on data_4190" 
    printf "\n\t%-5s  %-40s\n"  "0.11.16"    "Plot momentum distribution or ... distribution on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.11.17"    "Plot momentum distribution or ... distribution on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.11.18"    "Plot momentum distribution or ... distribution on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.11.19"    "Plot momentum distribution or ... distribution on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.11.20"    "Plot momentum distribution or ... distribution on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.11.21"    "Plot momentum distribution or ... distribution on data_4310" 
    printf "\n\t%-5s  %-40s\n"  "0.11.22"    "Plot momentum distribution or ... distribution on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.11.23"    "Plot momentum distribution or ... distribution on data_4390"
    printf "\n\t%-5s  %-40s\n"  "0.12"      "[Generate MC samples for third iteration]" # tag D0bar with K+ and Pi- 
    printf "\n\t%-5s  %-40s\n"  "0.12.1"    "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV" 
    printf "\n\t%-5s  %-40s\n"  "0.12.2"    "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.12.3"    "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.12.4"    "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3800 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.12.5"    "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV"
    printf "\n\t%-5s  %-40s\n"  "0.13"      "[Plot summary in second iteration]" 
    printf "\n\t%-5s  %-40s\n"  "0.13.1"    "Plot momentum distribution or ... distribution on data_3890" 
    printf "\n\t%-5s  %-40s\n"  "0.13.2"    "Plot momentum distribution or ... distribution on data_3900"
    printf "\n\t%-5s  %-40s\n"  "0.13.3"    "Plot momentum distribution or ... distribution on data_3950"
    printf "\n\t%-5s  %-40s\n"  "0.13.4"    "Plot momentum distribution or ... distribution on data_3980"
    printf "\n\t%-5s  %-40s\n"  "0.13.5"    "Plot momentum distribution or ... distribution on data_4010"
    printf "\n\t%-5s  %-40s\n"  "0.13.6"    "Plot momentum distribution or ... distribution on data_4030"
    printf "\n\t%-5s  %-40s\n"  "0.13.7"    "Plot momentum distribution or ... distribution on data_4040"
    printf "\n\t%-5s  %-40s\n"  "0.13.8"    "Plot momentum distribution or ... distribution on data_4055" 
    printf "\n\t%-5s  %-40s\n"  "0.13.9"    "Plot momentum distribution or ... distribution on data_4070"
    printf "\n\t%-5s  %-40s\n"  "0.13.10"    "Plot momentum distribution or ... distribution on data_4090"
    printf "\n\t%-5s  %-40s\n"  "0.13.11"    "Plot momentum distribution or ... distribution on data_4120"
    printf "\n\t%-5s  %-40s\n"  "0.13.12"    "Plot momentum distribution or ... distribution on data_4140"
    printf "\n\t%-5s  %-40s\n"  "0.13.13"    "Plot momentum distribution or ... distribution on data_4150"
    printf "\n\t%-5s  %-40s\n"  "0.13.14"    "Plot momentum distribution or ... distribution on data_4170"
    printf "\n\t%-5s  %-40s\n"  "0.13.15"    "Plot momentum distribution or ... distribution on data_4190" 
    printf "\n\t%-5s  %-40s\n"  "0.13.16"    "Plot momentum distribution or ... distribution on data_4210"
    printf "\n\t%-5s  %-40s\n"  "0.13.17"    "Plot momentum distribution or ... distribution on data_4220"
    printf "\n\t%-5s  %-40s\n"  "0.13.18"    "Plot momentum distribution or ... distribution on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.13.19"    "Plot momentum distribution or ... distribution on data_4245"
    printf "\n\t%-5s  %-40s\n"  "0.13.20"    "Plot momentum distribution or ... distribution on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.13.21"    "Plot momentum distribution or ... distribution on data_4310" 
    printf "\n\t%-5s  %-40s\n"  "0.13.22"    "Plot momentum distribution or ... distribution on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.13.23"    "Plot momentum distribution or ... distribution on data_4390"
    printf "\n\n" 
}


if [[ $# -eq 0 ]]; then
    usage
fi


option=$1

case $option in 
    0.1) echo "Split data sample..."
	 ;;

    0.1.1) echo "Split data_3810 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/3810/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz3810.txt 10G
           # made 44 groups 
           ;;
    
    0.1.2) echo "Split data_3890 sample with each group 10G ..."
	   ./python/get_samples.py  3890MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3890.txt 10G
           # made 8 groups
	   ;;

    0.1.3) echo "Split data_3900 sample with each group 10G..."
           ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/3900/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz3900.txt 10G
           # made 42 groups
	   ;;

    0.1.4) echo "Split data_3950 sample with each group 10G..."
	   ./python/get_samples.py  3950MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3950.txt 10G
           # made 7 groups 
	   ;;
    
    0.1.5) echo  "Split data_3980 sample with each group 10G..."
           ./python/get_samples.py  3980MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3980.txt 10G
           # made 6 groups
	   ;; 

    0.1.6) echo "Split data_4010 sample with each group 10G..."
	   ./python/get_samples.py  /bes3fs/offline/data/664-1/4040/dst  $HOME/bes/kpi/v0.2/run/samples/data_664_xyz4010.txt 10G
           # made 529 groups
	   ;;

    0.1.7) echo "Split data_4030 sample with each group 10G..."
	   ./python/get_samples.py  4030MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4030.txt 10G
           # made 13 groups 
	   ;;

    0.1.8) echo  "Split data_4040 sample with each group 10G..."
	   ./python/get_samples.py  4040MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4040.txt 10G
           # made 5 groups
	   ;; 

    0.1.9) echo  "Split data_4055 sample with each group 10G..."
           ./python/get_samples.py  4055MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4055.txt 10G
           # made 5 groups
 	   ;; 
    0.1.10) echo "Split data_4070 sample with each group 10G ..."
	   ./python/get_samples.py  4070MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4070.txt 10G
           # made 5 groups
	   ;;
    0.1.11) echo "Split data_4090 sample with each group 10G..."
           ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4090/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4090.txt 10G
           # made 42 groups
	   ;;
    0.1.12) echo "Split data_4120 sample with each group 10G..."
	   ./python/get_samples.py  4120MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4120.txt 10G
           # made 6 groups 
	   ;;
    0.1.13) echo "Split data_4140 sample with each group 10G..."
	   ./python/get_samples.py  4140MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4140.txt 10G
           # made 6 groups 
	   ;;
    0.1.14) echo "Split data_4150 sample with each group 10G..."
	   ./python/get_samples.py  4150MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4150.txt 10G
           # made 6 groups  
	   ;;
    0.1.15) echo "Split data_4170 sample with each group 10G..."
	   ./python/get_samples.py  4170MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4170.txt 10G
           # made 18 groups
	   ;; 
    0.1.16) echo "Split data_4190 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4190/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4190.txt 10G
           # made 37 groups 
           ;;
    0.1.17) echo "Split data_4210 sample with each group 10G..."
           ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4210/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4210.txt 10G
           # made 36 groups
	   ;;
    0.1.18) echo "Split data_4220 sample with each group 10G..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4220/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4220.txt 10G
           # made 38 groups
	   ;;
    0.1.19) echo "Split data_4230 sample with each group 10G..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4230/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4230.txt 10G
           # made 751 groups
	   ;;
    0.1.20) echo "Split data_4245 sample with each group 10G..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4245/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4245.txt 10G
           # made 37 groups
	   ;;
    0.1.21) echo  "Split data_4260 sample with each group 10G..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4260.txt 10G
           # made 678 groups
	   ;; 
    0.1.22) echo "Split data_4310 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4310/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4310.txt 10G
           # made 38 groups
	   ;;
    0.1.23) echo "Split data_4360 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4360scan/4390/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4390.txt 10G
           # made 34 groups
	   ;;
    0.1.24) echo "Split data_4390 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4360scan/4390/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4390.txt 10G
           # made 34 groups
	   ;;


    
    0.2) echo "run data sample..."
	 ;;

    0.2.1) echo "Run with a few events ..."
	   boss.exe jobOptions_dd.txt
	   ;;

    0.2.2) echo "Submit condor jobs on data_3810 ..."
           mkdir run/log/data_3810 -p
	   ./condor/condor_submit_dd_data_xyz3810.sh 
	   ;;

    0.2.3) echo "Submit condor jobs on data_3900..."
           mkdir run/log/data_3900 -p
	   ./condor/condor_submit_dd_data_xyz3900.sh 
	   ;;

    0.2.4) echo "Submit condor jobs on data_3950..."
           mkdir run/log/data_3950 -p
	   ./condor/condor_submit_dd_data_xyz3950.sh 
	   ;;
    # ...... 
    # ......

    0.2.25) echo "Submit condor jobs on data_4390 ..."
           mkdir run/log/data_4390 -p
	   ./condor/condor_submit_dd_data_xyz4390.sh 
	   ;;



    0.3) echo "Check condor jobs..."
 	 ;;

    0.3.1) echo "Check condor jobs on data_3810 ..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_3810  44
	   ;;
    0.3.2) echo "Check condor jobs on data_3890 ..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_3890  8
	   ;;
    0.3.3) echo "Check condor jobs on data_3900 ..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_3900  42
	   ;;
    # ...... 
    # ......

    0.3.24) echo "Check condor jobs on data_4390 ..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_4390  34
           ;;

   

    0.4) echo "Merge events files..."
 	 ;;

    0.4.1) echo "Merge events files on data_3810 ..."
           cd  run/data_3810
           hadd dd_data_xyz3810_merged_1.root *.root 
           cd ../../
	   ;;
    0.4.2) echo "Merge events files on data_3890 ..."
           cd  run/data_3890
           hadd dd_data_xyz3890_merged_1.root *.root 
           cd ../../
	   ;;
    0.4.3) echo "Merge events files on data_3900 ..."
           cd  run/data_3900
           hadd dd_data_xyz3900_merged_1.root *.root 
           cd ../../
	   ;;
    # ...... 
    # ......

    0.4.24) echo "Merge events files on data_4390 ..."
           cd  run/data_4390
           hadd dd_data_xyz4390_merged_1.root *.root 
           cd ../../
	   ;;



    0.5) echo "Select events..."
 	 ;;

    0.5.1) echo "Submit events selection jobs on data_3810 ..."
           ./python/sel_data_events.py  run/data_3810/dd_data_xyz3810_merged_1.root  run/hist/data_3810/dd_data_xyz3810_merged_1.root
	   ;;

    0.5.2) echo "Submit events selection jobs on data_3890 ..."
           ./python/sel_data_events.py  run/data_3890/dd_data_xyz3890_merged_1.root  run/hist/data_3890/dd_data_xyz3890_merged_1.root
	   ;;

    0.5.3) echo "Submit events selection jobs on data_3900 ..."
           ./python/sel_data_events.py  run/data_3900/dd_data_xyz3900_merged_1.root  run/hist/data_3900/dd_data_xyz3900_merged_1.root
	   ;;
    # ...... 
    # ......

    0.5.24) echo "Submit events selection jobs on data_4390 ..."
           ./python/sel_data_events.py  run/data_4390/dd_data_xyz4390_merged_1.root  run/hist/data_4390/dd_data_xyz4390_merged_1.root
	   ;;
    

 
    0.6) echo "Generate MC samples..."
 	 ;;

    0.6.1) echo "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D0barD0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.6.2) echo "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D0barD0star_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.6.3) echo "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D0barstarD0_D0bargamma_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.6.4) echo "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D0barstarD0_D0barpi0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.6.5) echo "Generate D0barstarD0star_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D0barstarD0star_D0bargamma_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.6.6) echo "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/suym/run/ex_mc/D_starDz_D0barpi_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;



    0.7) echo "Plot summary..."
 	 ;;

    0.7.1) echo "Plot momentum distribution or ??? distribution on data_3890 ..."
           cd /besfs/groups/nphy/users/suym/run/mc/cpp/3890
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.7.2) echo "Plot momentum distribution or ??? distribution on data_3900 ..."
           cd /besfs/groups/nphy/users/suym/run/mc/cpp/3900
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.7.23) echo "Plot momentum distribution or ??? distribution on data_4390 ..."
           cd /besfs/groups/nphy/users/suym/run/mc/cpp/4390
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;
  


    0.8) echo "Generate MC samples for first iteration..."
 	 ;;

    0.8.1) echo "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/first_iteration_ex_mc/D0barD0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.8.2) echo "Generate D0barD0star MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/first_iteration_ex_mc/D0barD0star_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.8.3) echo "Generate D0barstarD0_D0bargamma MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/first_iteration_ex_mc/D0barstarD0_D0bargamma_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.8.4) echo "Generate D0barstarD0_D0barpi0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/first_iteration_ex_mc/D0barstarD0_D0barpi0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;

    0.8.5) echo "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/first_iteration_ex_mc/D_starDz_D0barpi_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;



    0.9) echo "Plot summary in first iteration..."
 	 ;;

    0.9.1) echo "Plot momentum distribution or ??? distribution on data_3890 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_first/3890
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.9.23) echo "Plot momentum distribution or ??? distribution on data_4390 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_first/4390
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
           ;;



    0.10) echo "Generate MC samples for second iteration..."
 	 ;;

    0.10.1) echo "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/second_iteration_ex_mc/D0barD0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.10.5) echo "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/second_iteration_ex_mc/D_starDz_D0barpi_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;
    


    0.11) echo "Plot summary in second iteration..."
 	 ;;

    0.11.1) echo "Plot momentum distribution or ??? distribution on data_3890 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_second/3890
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.11.23) echo "Plot momentum distribution or ??? distribution on data_4390 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_second/4390
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
           ;;



    0.12) echo "Generate MC samples for third iteration..."
 	 ;;

    0.12.1) echo "Generate D0barD0 MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/third_iteration_ex_mc/D0barD0_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.12.5) echo "Generate D_starDz_D0barpi MC samples taken at 23 center-of-mass energies from 3890 to 4390MeV ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/third_iteration_ex_mc/D_starDz_D0barpi_kpi
           ./qsub_dd_mc_psi.sh
           cd $HOME/bes/kpi/v0.2
	   ;;



    0.13) echo "Plot summary in third iteration..."
 	 ;;

    0.13.1) echo "Plot momentum distribution or ??? distribution on data_3890 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_third/3890
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
	   ;;
    # ...... 
    # ......

    0.13.23) echo "Plot momentum distribution or ??? distribution on data_4390 ..."
           cd /besfs/groups/nphy/users/xiaosy/yumo/cpp_third/4390
           root plt_sideband_bkg.cxx  # to get sideband parameters
           root plt_mom_fit.cxx  # fit data using MC momentum spectrum shape
           root born.cxx # calculate the Born cross section and efficiency 
           cd $HOME/bes/kpi/v0.2
           ;;



esac

