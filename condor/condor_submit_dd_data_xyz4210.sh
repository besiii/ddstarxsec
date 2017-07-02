#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_4210


for num in {1..36} 
do
  Log_File=${Log_Dir}/dd_data_xyz4210.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyz4210.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/4210/condor_sub_dd_data_xyz4210-${num}.sh

done




