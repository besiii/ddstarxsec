#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_4140


for num in {1..6} 
do
  Log_File=${Log_Dir}/dd_data_xyz4140.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz4140.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/4140/condor_sub_dd_data_xyz4140-${num}.sh

done




