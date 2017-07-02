#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

rm  ${Work_Dir}/run/condor_pbs/data/4220/condor_sub_dd_data_xyz4220-*.sh -f
rm  ${Work_Dir}/run/condor_samples/data/4220/jobOptions_dd_data_xyz4220-*.pbs -f

for num in {1..38}
do
    cp ${Work_Dir}/condor/raw/condor_sub_dd_data_xyz4220.sh ${Work_Dir}/run/condor_pbs/data/4220/
    mv ${Work_Dir}/run/condor_pbs/data/4220/condor_sub_dd_data_xyz4220.sh ${Work_Dir}/run/condor_pbs/data/4220/condor_sub_dd_data_xyz4220-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4220.pbs/jobOptions_dd_data_xyz4220-${num}.pbs/g" ${Work_Dir}/run/condor_pbs/data/4220/condor_sub_dd_data_xyz4220-${num}.sh

    cp ${Work_Dir}/condor/raw/jobOptions_dd_data_xyz4220.pbs ${Work_Dir}/run/condor_samples/data/4220/
    sed -i "5s/data_664p01_xyz4220_10G.txt/data_664p01_xyz4220_10G-${num}.txt/g" ${Work_Dir}/run/condor_samples/data/4220/jobOptions_dd_data_xyz4220.pbs
    sed -i "19s/dd_data_xyz4220.root/dd_data_xyz4220-${num}.root/g" ${Work_Dir}/run/condor_samples/data/4220/jobOptions_dd_data_xyz4220.pbs
    mv ${Work_Dir}/run/condor_samples/data/4220/jobOptions_dd_data_xyz4220.pbs  ${Work_Dir}/run/condor_samples/data/4220/jobOptions_dd_data_xyz4220-${num}.pbs
    
    

done
