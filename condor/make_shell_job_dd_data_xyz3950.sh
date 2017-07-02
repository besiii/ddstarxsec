#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/3950/condor_sub_dd_data_xyz3950-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/3950/jobOptions_dd_data_xyz3950-*.pbs -f

PBS_3950=${Work_Dir}/run/condor_pbs/data/3950
Sample_3950=${Work_Dir}/run/condor_samples/data/3950
Raw=${Work_Dir}/condor/raw
for num in {1..7}
do
    cp ${Raw}/condor_sub_dd_data_xyz3950.sh ${PBS_3950}/
    mv ${PBS_3950}/condor_sub_dd_data_xyz3950.sh ${PBS_3950}/condor_sub_dd_data_xyz3950-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz3950.pbs/jobOptions_dd_data_xyz3950-${num}.pbs/g" ${PBS_3950}/condor_sub_dd_data_xyz3950-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz3950.pbs ${Sample_3950}/
    sed -i "5s/data_665p01_xyz3950_10G.txt/data_665p01_xyz3950_10G-${num}.txt/g" ${Sample_3950}/jobOptions_dd_data_xyz3950.pbs
    sed -i "19s/dd_data_xyz3950.root/dd_data_xyz3950-${num}.root/g" ${Sample_3950}/jobOptions_dd_data_xyz3950.pbs
    mv ${Sample_3950}/jobOptions_dd_data_xyz3950.pbs  ${Sample_3950}/jobOptions_dd_data_xyz3950-${num}.pbs
    
    

done
