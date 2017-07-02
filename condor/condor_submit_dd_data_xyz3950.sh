#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_3950


for num in {1..7} 
do
  Log_File=${Log_Dir}/dd_data_xyz3950.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz3950.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/3950/condor_sub_dd_data_xyz3950-${num}.sh

done




