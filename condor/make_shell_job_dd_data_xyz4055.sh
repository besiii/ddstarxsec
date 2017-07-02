#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4055/condor_sub_dd_data_xyz4055-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4055/jobOptions_dd_data_xyz4055-*.pbs -f

PBS_4055=${Work_Dir}/run/condor_pbs/data/4055
Sample_4055=${Work_Dir}/run/condor_samples/data/4055
Raw=${Work_Dir}/condor/raw
for num in {1..5}
do
    cp ${Raw}/condor_sub_dd_data_xyz4055.sh ${PBS_4055}/
    mv ${PBS_4055}/condor_sub_dd_data_xyz4055.sh ${PBS_4055}/condor_sub_dd_data_xyz4055-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4055.pbs/jobOptions_dd_data_xyz4055-${num}.pbs/g" ${PBS_4055}/condor_sub_dd_data_xyz4055-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4055.pbs ${Sample_4055}/
    sed -i "5s/data_665p01_xyz4055_10G.txt/data_665p01_xyz4055_10G-${num}.txt/g" ${Sample_4055}/jobOptions_dd_data_xyz4055.pbs
    sed -i "19s/dd_data_xyz4055.root/dd_data_xyz4055-${num}.root/g" ${Sample_4055}/jobOptions_dd_data_xyz4055.pbs
    mv ${Sample_4055}/jobOptions_dd_data_xyz4055.pbs  ${Sample_4055}/jobOptions_dd_data_xyz4055-${num}.pbs
    
    

done
