#!/usr/bin/env bash

# Main driver to submit jobs 
# Author SHI Xin <shixin@ihep.ac.cn>
# Created [2016-03-28 Mon 07:58]


usage() {
    printf "NAME\n\tsubmit.sh - Main driver to submit jobs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./submit.sh [OPTION]" 
    printf "\nOPTIONS\n" 
    printf "\n\t%-5s  %-40s\n"  "0.1"      "[run data sample]" 
    printf "\n\t%-5s  %-40s\n"  "0.1.1"    "Run with a few samples" 
    printf "\n\t%-5s  %-40s\n"  "0.1.2"    "Split data_4260 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.3"    "Submit PBS jobs on data_4260"
    printf "\n\t%-5s  %-40s\n"  "0.1.4"    "Check PBS jobs on data_4260."
    printf "\n\t%-5s  %-40s\n"  "0.1.5"    "Select events."
    printf "\n\t%-5s  %-40s\n"  "0.1.6"    "Submit events selection jobs on data_4260."
    printf "\n\t%-5s  %-40s\n"  "0.1.7"    "Check events jobs on data_4260."
    printf "\n\t%-5s  %-40s\n"  "0.1.8"    "Merge events files." 
    printf "\n\t%-5s  %-40s\n"  "0.1.9"    "Plot momentum distribution with data_4260."
    printf "\n\t%-5s  %-40s\n"  "0.1.10"    "Split data_4360 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.11"    "Submit PBS jobs on data_4360"
    printf "\n\t%-5s  %-40s\n"  "0.1.12"    "Check events jobs on data_4360."
    printf "\n\t%-5s  %-40s\n"  "0.1.13"    "Submit events selection jobs on data_4360."
    printf "\n\t%-5s  %-40s\n"  "0.1.14"    "Check events jobs on data_4360."
    printf "\n\t%-5s  %-40s\n"  "0.1.15"    "Merge events files." 
    printf "\n\t%-5s  %-40s\n"  "0.1.16"    "Split data_4230 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.17"    "Submit PBS jobs on data_4230"
    printf "\n\t%-5s  %-40s\n"  "0.1.18"    "Check events jobs on data_4230."
    printf "\n\t%-5s  %-40s\n"  "0.1.19"    "Submit events selection jobs on data_4230."
    printf "\n\t%-5s  %-40s\n"  "0.1.20"    "Check events jobs on data_4230."
    printf "\n\t%-5s  %-40s\n"  "0.1.21"    "Merge events files." 
    printf "\n\t%-5s  %-40s\n"  "0.1.22"    "Split data_4010 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.23"    "Split data_4220 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.24"    "Split data_3810 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.25"    "Split data_3900 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.26"    "Split data_4090 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.27"    "Split data_4190 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.28"    "Split data_4210 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.29"    "Split data_4245 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.30"    "Split data_4310 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.31"    "Split data_4390 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.32"    "Split data_3890 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.33"    "Split data_3950 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.34"    "Split data_3980 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.35"    "Split data_new_4190 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.36"    "Split data_new_4200 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.37"    "Split data_new_4210 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.38"    "Split data_new_4220 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.39"    "Split data_4030 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.40"    "Split data_4040 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.41"    "Split data_4055 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.42"    "Split data_4070 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.43"    "Split data_4120 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.44"    "Split data_4140 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.45"    "Split data_4150 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.1.46"    "Split data_4170 sample with each group 10G"
    printf "\n\t%-5s  %-40s\n"  "0.2"      "[run on MC sample]"
    printf "\n\t%-5s  %-40s\n"  "0.2.1"    "Run with a few samples"
    printf "\n\t%-5s  %-40s\n"  "0.2.2"    "Split psi4260 MC sample with each group 4G"
    printf "\n\t%-5s  %-40s\n"  "0.2.3"    "Submit PBS jobs on psi4260 MC sample"     
    printf "\n\t%-5s  %-40s\n"  "0.2.4"    "Check PBS jobs on psi4260 MC sample"     
    printf "\n\t%-5s  %-40s\n"  "0.2.5"    "Select events on psi4260 MC sample"     
    printf "\n\t%-5s  %-40s\n"  "0.2.6"    "Submit PBS jobs to select events on psi4260 MC sample"     
    printf "\n\t%-5s  %-40s\n"  "0.2.7"    "Check events selection jobs on psi4260 MC"
    printf "\n\t%-5s  %-40s\n"  "0.2.8"    "Merge events files on psi4260 MC"
    printf "\n\t%-5s  %-40s\n"  "0.2.9"    "Plot background momentum distribution with psi4260 MC"
    printf "\n\t%-5s  %-40s\n"  "0.2.10"    "Plot momentum distribution with psi4260 MC"
    printf "\n\t%-5s  %-40s\n"  "0.2.11"    "Plot stack momentum distribution with psi4260 MC"
    printf "\n\t%-5s  %-40s\n"  "0.2.12"    "Plot fitting momentum distribution with psi4260 MC--lowmom"
    printf "\n\t%-5s  %-40s\n"  "0.2.13"    "Plot fitting momentum distribution with psi4260 MC--highmom"
    printf "\n\t%-5s  %-40s\n"  "0.2.14"    "Split psi4360 MC sample with each group 4G"
    printf "\n\n" 
}


if [[ $# -eq 0 ]]; then
    usage
fi


option=$1

case $option in 
    0.1) echo "Running on data sample..."
	 ;;

    0.1.1) echo "Run with a few events ..."
	   boss.exe jobOptions_dd.txt
	   ;;
    
    0.1.2) echo "Split data_4260 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4260.txt 10G
	   # made 678 groups 
	   ;;

    0.1.3) echo "Submit PBS jobs on data_4260..."
           mkdir run/data_4260
           mkdir run/log/data_4260
           qsub pbs/qsub_dd_data_xyz4260.sh
	   ;;

    0.1.4) echo "Check PBS jobs on data_4260..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_4260  678 
	   ;;
    
    0.1.5) echo  "Select events on data_4260..."
           mkdir run/events/data_4260
           for i in {1..678}
           do
               echo "processing run/data_4260/dd_data_xyz4260-$i.root ..."
               ./python/sel_data_events.py  run/data_4260/dd_data_xyz4260-$i.root  run/events/data_4260/dd_data_xyz4260-$i.root
           done

	   ;; 

    0.1.6) echo "Submit selection PBS jobs on data_4260..."
	   mkdir run/events/data_4260
	   mkdir run/log/events/data_4260  
	   qsub pbs/qsub_dd_events_data_xyz4260.sh  
	   ;;

    0.1.7) echo "Check PBS jobs on events data_4260..."
	   ./python/chk_pbsjobs.py run/events/data_4260  678 
	   ;;

    0.1.8) echo  "Merge root files..."
	   mkdir run/hist/data_4260
	   ./python/mrg_rootfiles.py  run/events/data_4260  run/hist/data_4260 
	   ;; 

    0.1.9) echo  "Plot momentum distribution with data_4260..."
           cd cpp
           root ./plt_data4260_mom.cxx          
 	   ;; 
    0.1.10) echo "Split data_4360 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4360/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4360.txt 10G
	   # made 367 groups 
	   ;;
    0.1.11) echo "Submit PBS jobs on data_4360..."
           mkdir run/data_4360
           mkdir run/log/data_4360
           qsub pbs/qsub_dd_data_xyz4360.sh
	   ;;
    0.1.12) echo "Check PBS jobs on data_4360..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_4360  367 
	   ;;
    0.1.13) echo "Submit selection PBS jobs on data_4360..."
	   mkdir run/events/data_4360
	   mkdir run/log/events/data_4360  
	   qsub pbs/qsub_dd_events_data_xyz4360.sh  
	   ;;
    0.1.14) echo "Check PBS jobs on events data_4360..."
	   ./python/chk_pbsjobs.py run/events/data_4360  367 
	   ;;
    0.1.15) echo  "Merge root files..."
	   mkdir run/hist/data_4360
	   ./python/mrg_rootfiles.py  run/events/data_4360  run/hist/data_4360 
	   ;; 
    0.1.16) echo "Split data_4230 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4230/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4230.txt 10G
	   # made 751 groups 
	   ;;
    0.1.17) echo "Submit PBS jobs on data_4230..."
           mkdir run/data_4230
           mkdir run/log/data_4230
           qsub pbs/qsub_dd_data_xyz4230.sh
	   ;;
    0.1.18) echo "Check PBS jobs on data_4230..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/data_4230  751 
	   ;;
    0.1.19) echo "Submit selection PBS jobs on data_4230..."
	   mkdir run/events/data_4230
	   mkdir run/log/events/data_4230  
	   qsub pbs/qsub_dd_events_data_xyz4230.sh  
	   ;;
    0.1.20) echo "Check PBS jobs on events data_4230..."
	   ./python/chk_pbsjobs.py run/events/data_4230  751 
	   ;;
    0.1.21) echo  "Merge root files..."
	   mkdir run/hist/data_4230
	   ./python/mrg_rootfiles.py  run/events/data_4230  run/hist/data_4230 
	   ;; 
    0.1.22) echo "Split data_4010 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664-1/4040/dst  $HOME/bes/kpi/v0.2/run/samples/data_664_xyz4010.txt 10G
	   # made 529 groups 
	   ;;
    0.1.23) echo "Split data_4220 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4220/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4220.txt 10G
	   # made 38 groups 
	   ;;
    0.1.24) echo "Split data_3810 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/3810/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz3810.txt 10G
	   # made 44 groups 
	   ;;
    0.1.25) echo "Split data_3900 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/3900/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz3900.txt 10G
	   # made 42 groups 
	   ;;
    0.1.26) echo "Split data_4090 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4090/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4090.txt 10G
	   # made 42 groups 
	   ;;
    0.1.27) echo "Split data_4190 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4190/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4190.txt 10G
	   # made 37 groups 
	   ;;
    0.1.28) echo "Split data_4210 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4210/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4210.txt 10G
	   # made 36 groups 
	   ;;
    0.1.29) echo "Split data_4245 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4245/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4245.txt 10G
	   # made 37 groups 
	   ;;
    0.1.30) echo "Split data_4310 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4260scan/4310/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4310.txt 10G
	   # made 38 groups 
	   ;;
    0.1.31) echo "Split data_4390 sample with each group 10G ..."
	   ./python/get_samples.py  /bes3fs/offline/data/664p01/xyz/4360scan/4390/dst  $HOME/bes/kpi/v0.2/run/samples/data_664p01_xyz4390.txt 10G
	   # made 34 groups 
	   ;;
    0.1.32) echo "Split data_3890 sample with each group 10G ..."
	   ./python/get_samples.py  3890MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3890.txt 10G
	   # made 8 groups 
	   ;;
    0.1.33) echo "Split data_3950 sample with each group 10G ..."
	   ./python/get_samples.py  3950MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3950.txt 10G
	   # made 7 groups 
	   ;;
    0.1.34) echo "Split data_3980 sample with each group 10G ..."
	   ./python/get_samples.py  3980MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz3980.txt 10G
	   # made 6 groups 
	   ;;
    0.1.35) echo "Split data_new_4190 sample with each group 10G ..."
	   ./python/get_samples.py       /besfs/offline/data/702p01/xyz/4190/dst   $HOME/bes/kpi/v0.2/run/samples/data_702p01_xyznew_4190.txt 10G
	   # made 397 groups 
	   ;;
    0.1.36) echo "Split data_new_4200 sample with each group 10G ..."
	   ./python/get_samples.py       /besfs/offline/data/702p01/xyz/4200/dst   $HOME/bes/kpi/v0.2/run/samples/data_702p01_xyznew_4200.txt 10G
	   # made 370 groups 
	   ;;
    0.1.37) echo "Split data_new_4210 sample with each group 10G ..."
	   ./python/get_samples.py       /besfs/offline/data/702p01/xyz/4210/dst   $HOME/bes/kpi/v0.2/run/samples/data_702p01_xyznew_4210.txt 10G
	   # made 413 groups 
	   ;;
    0.1.38) echo "Split data_new_4220 sample with each group 10G ..."
	   ./python/get_samples.py       /besfs/offline/data/702p01/xyz/4220/dst   $HOME/bes/kpi/v0.2/run/samples/data_702p01_xyznew_4220.txt 10G
	   # made 95 groups 
	   ;;
    0.1.39) echo "Split data_4030 sample with each group 10G ..."
	   ./python/get_samples.py  4030MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4030.txt 10G
	   # made 13 groups 
	   ;;
    0.1.40) echo "Split data_4040 sample with each group 10G ..."
	   ./python/get_samples.py  4040MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4040.txt 10G
	   # made 5 groups 
	   ;;
    0.1.41) echo "Split data_4055 sample with each group 10G ..."
	   ./python/get_samples.py  4055MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4055.txt 10G
	   # made 5 groups 
	   ;;
    0.1.42) echo "Split data_4070 sample with each group 10G ..."
	   ./python/get_samples.py  4070MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4070.txt 10G
	   # made 5 groups 
	   ;;
    0.1.43) echo "Split data_4120 sample with each group 10G ..."
	   ./python/get_samples.py  4120MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4120.txt 10G
	   # made 6 groups 
	   ;;
    0.1.44) echo "Split data_4140 sample with each group 10G ..."
	   ./python/get_samples.py  4140MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4140.txt 10G
	   # made 6 groups 
	   ;;
    0.1.45) echo "Split data_4150 sample with each group 10G ..."
	   ./python/get_samples.py  4150MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4150.txt 10G
	   # made 6 groups 
	   ;;
    0.1.46) echo "Split data_4170 sample with each group 10G ..."
	   ./python/get_samples.py  4170MeV    /bes3fs/offline/data/665p01/rscan/dst   $HOME/bes/kpi/v0.2/run/samples/data_665p01_xyz4170.txt 10G
	   # made 18 groups 
	   ;;


    
    0.2) echo "Running on MC sample..."
	 ;;

    0.2.1) echo "Run with a few events ..."
	   boss.exe jobOptions_dd.txt
	   ;;
    0.2.2) echo "Split psi4260 MC sample with each group 4G ..."
	   ./python/get_samples.py  /besfs/groups/psip/psipgroup/664p01-MC/4260/res/DD $HOME/bes/kpi/v0.2/run/samples/mc_664p01_psi4260_DD.txt 4G
	   # made 20 groups 
	   ;;

    0.2.3) echo "Submit PBS jobs on psi4260 MC sample..."
	   mkdir run/mc_psi4260
	   mkdir run/log/mc_psi4260  
	   qsub pbs/qsub_dd_mc_psi4260.sh
	   ;;

    0.2.4) echo "Check PBS jobs on psi4260 MC sample..."
	   ./python/chk_pbsjobs.py $HOME/bes/kpi/v0.2/run/mc_psi4260  20 
	   ;;

    0.2.5) echo  "Select events on psi4260 MC sample..."
	   mkdir run/events/mc_psi4260  
	   for i in {1..20}  
	   do  
	       echo "processing run/mc_psi4260/dd_mc_psi4260-$i.root ..."
	       ./python/sel_mc_events.py  run/mc_psi4260/dd_mc_psi4260-$i.root  run/events/mc_psi4260/dd_mc_psi4260-$i.root
	   done   
	   ;; 

    0.2.6) echo "Submit selection PBS jobs on psi4260 sample..."
	   mkdir run/events/mc_psi4260
	   mkdir run/log/events/mc_psi4260  
	   qsub pbs/qsub_dd_events_mc_psi4260.sh  
	   ;;

    0.2.7) echo "Check events selection jobs on psi4260 MC sample..."
	   ./python/chk_pbsjobs.py run/events/mc_psi4260  20 
	   ;;
    
    0.2.8) echo  "Merge events files..."
	   mkdir run/hist/mc_psi4260
	   ./python/mrg_rootfiles.py  run/events/mc_psi4260 run/hist/mc_psi4260 
	   ;; 

    0.2.9) echo  "Plot background momentum distribution with psi4260 MC ..."
           cd cpp
	   root ./plt_bkg.cxx 
	   ;;
    0.2.10) echo  "Plot momentum distribution with psi4260 MC ..."
           cd cpp
	   root ./plt_mom.cxx 
	   ;;
    0.2.11) echo  "Plot stack momentum distribution with psi4260 MC ..."
           cd cpp
	   root ./plt_stack_mom.cxx 
	   ;;
    0.2.12) echo  "Plot fitting momentum distribution with psi4260 MC ..."
           cd cpp
	   root ./plt_mc_lowmom_fit.cxx 
	   ;;
    0.2.13) echo  "Plot fitting momentum distribution with psi4260 MC ..."
           cd cpp
	   root ./plt_mc_highmom_fit.cxx 
	   ;;
    0.2.14) echo "Split psi4360 MC sample with each group 4G ..."
	   ./python/get_samples.py  /besfs/groups/nphy/users/suym/run/mc/mc/4360 $HOME/bes/kpi/v0.2/run/samples/mc_664p01_psi4360_DD.txt 4G
	   # made 3 groups 
	   ;;

esac

