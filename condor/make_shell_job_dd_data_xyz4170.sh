#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4170/condor_sub_dd_data_xyz4170-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4170/jobOptions_dd_data_xyz4170-*.pbs -f

PBS_4170=${Work_Dir}/run/condor_pbs/data/4170
Sample_4170=${Work_Dir}/run/condor_samples/data/4170
Raw=${Work_Dir}/condor/raw
for num in {1..18}
do
    cp ${Raw}/condor_sub_dd_data_xyz4170.sh ${PBS_4170}/
    mv ${PBS_4170}/condor_sub_dd_data_xyz4170.sh ${PBS_4170}/condor_sub_dd_data_xyz4170-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4170.pbs/jobOptions_dd_data_xyz4170-${num}.pbs/g" ${PBS_4170}/condor_sub_dd_data_xyz4170-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4170.pbs ${Sample_4170}/
    sed -i "5s/data_665p01_xyz4170_10G.txt/data_665p01_xyz4170_10G-${num}.txt/g" ${Sample_4170}/jobOptions_dd_data_xyz4170.pbs
    sed -i "19s/dd_data_xyz4170.root/dd_data_xyz4170-${num}.root/g" ${Sample_4170}/jobOptions_dd_data_xyz4170.pbs
    mv ${Sample_4170}/jobOptions_dd_data_xyz4170.pbs  ${Sample_4170}/jobOptions_dd_data_xyz4170-${num}.pbs
    
    

done
