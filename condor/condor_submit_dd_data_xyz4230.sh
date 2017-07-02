#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_4230


for num in {1..751} 
do
  Log_File=${Log_Dir}/dd_data_xyz4230.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz4230.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/4230/condor_sub_dd_data_xyz4230-${num}.sh

done




