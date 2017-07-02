#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4070/condor_sub_dd_data_xyz4070-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4070/jobOptions_dd_data_xyz4070-*.pbs -f

PBS_4070=${Work_Dir}/run/condor_pbs/data/4070
Sample_4070=${Work_Dir}/run/condor_samples/data/4070
Raw=${Work_Dir}/condor/raw
for num in {1..5}
do
    cp ${Raw}/condor_sub_dd_data_xyz4070.sh ${PBS_4070}/
    mv ${PBS_4070}/condor_sub_dd_data_xyz4070.sh ${PBS_4070}/condor_sub_dd_data_xyz4070-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4070.pbs/jobOptions_dd_data_xyz4070-${num}.pbs/g" ${PBS_4070}/condor_sub_dd_data_xyz4070-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4070.pbs ${Sample_4070}/
    sed -i "5s/data_665p01_xyz4070_10G.txt/data_665p01_xyz4070_10G-${num}.txt/g" ${Sample_4070}/jobOptions_dd_data_xyz4070.pbs
    sed -i "19s/dd_data_xyz4070.root/dd_data_xyz4070-${num}.root/g" ${Sample_4070}/jobOptions_dd_data_xyz4070.pbs
    mv ${Sample_4070}/jobOptions_dd_data_xyz4070.pbs  ${Sample_4070}/jobOptions_dd_data_xyz4070-${num}.pbs
    
    

done
