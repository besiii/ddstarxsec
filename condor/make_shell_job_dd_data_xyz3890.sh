#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/3890/condor_sub_dd_data_xyz3890-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/3890/jobOptions_dd_data_xyz3890-*.pbs -f

PBS_3890=${Work_Dir}/run/condor_pbs/data/3890
Sample_3890=${Work_Dir}/run/condor_samples/data/3890
Raw=${Work_Dir}/condor/raw
for num in {1..8}
do
    cp ${Raw}/condor_sub_dd_data_xyz3890.sh ${PBS_3890}/
    mv ${PBS_3890}/condor_sub_dd_data_xyz3890.sh ${PBS_3890}/condor_sub_dd_data_xyz3890-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz3890.pbs/jobOptions_dd_data_xyz3890-${num}.pbs/g" ${PBS_3890}/condor_sub_dd_data_xyz3890-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz3890.pbs ${Sample_3890}/
    sed -i "5s/data_665p01_xyz3890_10G.txt/data_665p01_xyz3890_10G-${num}.txt/g" ${Sample_3890}/jobOptions_dd_data_xyz3890.pbs
    sed -i "19s/dd_data_xyz3890.root/dd_data_xyz3890-${num}.root/g" ${Sample_3890}/jobOptions_dd_data_xyz3890.pbs
    mv ${Sample_3890}/jobOptions_dd_data_xyz3890.pbs  ${Sample_3890}/jobOptions_dd_data_xyz3890-${num}.pbs
    
    

done
