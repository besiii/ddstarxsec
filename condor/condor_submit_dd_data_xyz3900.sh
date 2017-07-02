#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_3900


for num in {1..42} 
do
  Log_File=${Log_Dir}/dd_data_xyz3900.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz3900.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/3900/condor_sub_dd_data_xyz3900-${num}.sh

done




