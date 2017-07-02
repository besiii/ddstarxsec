#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4120/condor_sub_dd_data_xyz4120-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4120/jobOptions_dd_data_xyz4120-*.pbs -f

PBS_4120=${Work_Dir}/run/condor_pbs/data/4120
Sample_4120=${Work_Dir}/run/condor_samples/data/4120
Raw=${Work_Dir}/condor/raw
for num in {1..6}
do
    cp ${Raw}/condor_sub_dd_data_xyz4120.sh ${PBS_4120}/
    mv ${PBS_4120}/condor_sub_dd_data_xyz4120.sh ${PBS_4120}/condor_sub_dd_data_xyz4120-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4120.pbs/jobOptions_dd_data_xyz4120-${num}.pbs/g" ${PBS_4120}/condor_sub_dd_data_xyz4120-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4120.pbs ${Sample_4120}/
    sed -i "5s/data_665p01_xyz4120_10G.txt/data_665p01_xyz4120_10G-${num}.txt/g" ${Sample_4120}/jobOptions_dd_data_xyz4120.pbs
    sed -i "19s/dd_data_xyz4120.root/dd_data_xyz4120-${num}.root/g" ${Sample_4120}/jobOptions_dd_data_xyz4120.pbs
    mv ${Sample_4120}/jobOptions_dd_data_xyz4120.pbs  ${Sample_4120}/jobOptions_dd_data_xyz4120-${num}.pbs
    
    

done
