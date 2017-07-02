#!/bin/bash


date

hostname

cd $HOME/bes/kpi/v0.2
source  setup_702p01.sh 
cd run/condor_samples/data/new_4210/ 
boss.exe jobOptions_dd_data_xyznew_4210.pbs

date


