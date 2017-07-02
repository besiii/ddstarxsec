#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4140/condor_sub_dd_data_xyz4140-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4140/jobOptions_dd_data_xyz4140-*.pbs -f

PBS_4140=${Work_Dir}/run/condor_pbs/data/4140
Sample_4140=${Work_Dir}/run/condor_samples/data/4140
Raw=${Work_Dir}/condor/raw
for num in {1..6}
do
    cp ${Raw}/condor_sub_dd_data_xyz4140.sh ${PBS_4140}/
    mv ${PBS_4140}/condor_sub_dd_data_xyz4140.sh ${PBS_4140}/condor_sub_dd_data_xyz4140-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4140.pbs/jobOptions_dd_data_xyz4140-${num}.pbs/g" ${PBS_4140}/condor_sub_dd_data_xyz4140-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4140.pbs ${Sample_4140}/
    sed -i "5s/data_665p01_xyz4140_10G.txt/data_665p01_xyz4140_10G-${num}.txt/g" ${Sample_4140}/jobOptions_dd_data_xyz4140.pbs
    sed -i "19s/dd_data_xyz4140.root/dd_data_xyz4140-${num}.root/g" ${Sample_4140}/jobOptions_dd_data_xyz4140.pbs
    mv ${Sample_4140}/jobOptions_dd_data_xyz4140.pbs  ${Sample_4140}/jobOptions_dd_data_xyz4140-${num}.pbs
    
    

done
