#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_new_4200


for num in {1..370} 
do
  Log_File=${Log_Dir}/dd_data_xyznew_4200.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyznew_4200.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/new_4200/condor_sub_dd_data_xyznew_4200-${num}.sh

done




