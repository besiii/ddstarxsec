#!/bin/bash

Work_Dir=$HOME/bes/kpi/v0.2

Log_Dir=${Work_Dir}/run/log/data_new_4210

declare -a array=(400 401 407 412 182 186 402 188 184 413 181 198 191 411 189 195 197 187 193 405 409 406 185 399 408 196 404 199 190 200 397 183 410 403 192 398 194)

for num in ${array[@]} 
do
  Log_File=${Log_Dir}/dd_data_xyznew_4210.log-${num}
  eLog_File=${Log_Dir}/dd_data_xyznew_4210.err-${num}

  hep_sub -g physics -o ${Log_File}  -e ${eLog_File}  ${Work_Dir}/run/condor_pbs/data/new_4210/condor_sub_dd_data_xyznew_4210-${num}.sh

done




