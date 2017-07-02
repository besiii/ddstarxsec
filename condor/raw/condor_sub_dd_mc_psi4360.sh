#!/bin/bash


date

hostname

cd $HOME/bes/kpi/v0.2
source setup.sh 
cd run/condor_samples/mc/4360/ 
boss.exe jobOptions_dd_mc_psi4360.pbs

date


