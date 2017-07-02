#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

rm  ${Work_Dir}/run/condor_pbs/data/4010/condor_sub_dd_data_xyz4010-*.sh -f
rm  ${Work_Dir}/run/condor_samples/data/4010/jobOptions_dd_data_xyz4010-*.pbs -f

for num in {1..529}
do
    cp ${Work_Dir}/condor/raw/condor_sub_dd_data_xyz4010.sh ${Work_Dir}/run/condor_pbs/data/4010/
    mv ${Work_Dir}/run/condor_pbs/data/4010/condor_sub_dd_data_xyz4010.sh ${Work_Dir}/run/condor_pbs/data/4010/condor_sub_dd_data_xyz4010-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4010.pbs/jobOptions_dd_data_xyz4010-${num}.pbs/g" ${Work_Dir}/run/condor_pbs/data/4010/condor_sub_dd_data_xyz4010-${num}.sh

    cp ${Work_Dir}/condor/raw/jobOptions_dd_data_xyz4010.pbs ${Work_Dir}/run/condor_samples/data/4010/
    sed -i "5s/data_664_xyz4010_10G.txt/data_664_xyz4010_10G-${num}.txt/g" ${Work_Dir}/run/condor_samples/data/4010/jobOptions_dd_data_xyz4010.pbs
    sed -i "19s/dd_data_xyz4010.root/dd_data_xyz4010-${num}.root/g" ${Work_Dir}/run/condor_samples/data/4010/jobOptions_dd_data_xyz4010.pbs
    mv ${Work_Dir}/run/condor_samples/data/4010/jobOptions_dd_data_xyz4010.pbs  ${Work_Dir}/run/condor_samples/data/4010/jobOptions_dd_data_xyz4010-${num}.pbs
    
    

done
