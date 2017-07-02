#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_4260


for num in {1..678} 
do
  Log_File=${Log_Dir}/dd_data_xyz4260.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz4260.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/4260/condor_sub_dd_data_xyz4260-${num}.sh

done




