#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_4070


for num in {1..5} 
do
  Log_File=${Log_Dir}/dd_data_xyz4070.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz4070.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/4070/condor_sub_dd_data_xyz4070-${num}.sh

done




