#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4360/condor_sub_dd_data_xyz4360-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4360/jobOptions_dd_data_xyz4360-*.pbs -f

for num in {1..367}
do
    cp ${Work_Dir}/condor/raw/condor_sub_dd_data_xyz4360.sh ${Work_Dir}/run/condor_pbs/data/4360/
    mv ${Work_Dir}/run/condor_pbs/data/4360/condor_sub_dd_data_xyz4360.sh ${Work_Dir}/run/condor_pbs/data/4360/condor_sub_dd_data_xyz4360-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4360.pbs/jobOptions_dd_data_xyz4360-${num}.pbs/g" ${Work_Dir}/run/condor_pbs/data/4360/condor_sub_dd_data_xyz4360-${num}.sh

    cp ${Work_Dir}/condor/raw/jobOptions_dd_data_xyz4360.pbs ${Work_Dir}/run/condor_samples/data/4360/
    sed -i "5s/data_664p01_xyz4360_10G.txt/data_664p01_xyz4360_10G-${num}.txt/g" ${Work_Dir}/run/condor_samples/data/4360/jobOptions_dd_data_xyz4360.pbs
    sed -i "19s/dd_data_xyz4360.root/dd_data_xyz4360-${num}.root/g" ${Work_Dir}/run/condor_samples/data/4360/jobOptions_dd_data_xyz4360.pbs
    mv ${Work_Dir}/run/condor_samples/data/4360/jobOptions_dd_data_xyz4360.pbs  ${Work_Dir}/run/condor_samples/data/4360/jobOptions_dd_data_xyz4360-${num}.pbs
    
    

done
