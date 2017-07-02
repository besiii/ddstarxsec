#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4150/condor_sub_dd_data_xyz4150-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4150/jobOptions_dd_data_xyz4150-*.pbs -f

PBS_4150=${Work_Dir}/run/condor_pbs/data/4150
Sample_4150=${Work_Dir}/run/condor_samples/data/4150
Raw=${Work_Dir}/condor/raw
for num in {1..6}
do
    cp ${Raw}/condor_sub_dd_data_xyz4150.sh ${PBS_4150}/
    mv ${PBS_4150}/condor_sub_dd_data_xyz4150.sh ${PBS_4150}/condor_sub_dd_data_xyz4150-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4150.pbs/jobOptions_dd_data_xyz4150-${num}.pbs/g" ${PBS_4150}/condor_sub_dd_data_xyz4150-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4150.pbs ${Sample_4150}/
    sed -i "5s/data_665p01_xyz4150_10G.txt/data_665p01_xyz4150_10G-${num}.txt/g" ${Sample_4150}/jobOptions_dd_data_xyz4150.pbs
    sed -i "19s/dd_data_xyz4150.root/dd_data_xyz4150-${num}.root/g" ${Sample_4150}/jobOptions_dd_data_xyz4150.pbs
    mv ${Sample_4150}/jobOptions_dd_data_xyz4150.pbs  ${Sample_4150}/jobOptions_dd_data_xyz4150-${num}.pbs
    
    

done
