#!/bin/bash


date

hostname

cd $HOME/bes/kpi/v0.2
source setup_665p01.sh 
cd run/condor_samples/data/4070/ 
boss.exe jobOptions_dd_data_xyz4070.pbs

date


