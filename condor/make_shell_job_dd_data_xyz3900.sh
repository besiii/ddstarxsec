#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/3900/condor_sub_dd_data_xyz3900-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/3900/jobOptions_dd_data_xyz3900-*.pbs -f

PBS_3900=${Work_Dir}/run/condor_pbs/data/3900
Sample_3900=${Work_Dir}/run/condor_samples/data/3900
Raw=${Work_Dir}/condor/raw
for num in {1..42}
do
    cp ${Raw}/condor_sub_dd_data_xyz3900.sh ${PBS_3900}/
    mv ${PBS_3900}/condor_sub_dd_data_xyz3900.sh ${PBS_3900}/condor_sub_dd_data_xyz3900-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz3900.pbs/jobOptions_dd_data_xyz3900-${num}.pbs/g" ${PBS_3900}/condor_sub_dd_data_xyz3900-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz3900.pbs ${Sample_3900}/
    sed -i "5s/data_664p01_xyz3900_10G.txt/data_664p01_xyz3900_10G-${num}.txt/g" ${Sample_3900}/jobOptions_dd_data_xyz3900.pbs
    sed -i "19s/dd_data_xyz3900.root/dd_data_xyz3900-${num}.root/g" ${Sample_3900}/jobOptions_dd_data_xyz3900.pbs
    mv ${Sample_3900}/jobOptions_dd_data_xyz3900.pbs  ${Sample_3900}/jobOptions_dd_data_xyz3900-${num}.pbs
    
    

done
