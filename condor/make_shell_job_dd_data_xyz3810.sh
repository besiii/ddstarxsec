#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/3810/condor_sub_dd_data_xyz3810-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/3810/jobOptions_dd_data_xyz3810-*.pbs -f

PBS_3810=${Work_Dir}/run/condor_pbs/data/3810
Sample_3810=${Work_Dir}/run/condor_samples/data/3810
Raw=${Work_Dir}/condor/raw
for num in {1..44}
do
    cp ${Raw}/condor_sub_dd_data_xyz3810.sh ${PBS_3810}/
    mv ${PBS_3810}/condor_sub_dd_data_xyz3810.sh ${PBS_3810}/condor_sub_dd_data_xyz3810-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz3810.pbs/jobOptions_dd_data_xyz3810-${num}.pbs/g" ${PBS_3810}/condor_sub_dd_data_xyz3810-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz3810.pbs ${Sample_3810}/
    sed -i "5s/data_664p01_xyz3810_10G.txt/data_664p01_xyz3810_10G-${num}.txt/g" ${Sample_3810}/jobOptions_dd_data_xyz3810.pbs
    sed -i "19s/dd_data_xyz3810.root/dd_data_xyz3810-${num}.root/g" ${Sample_3810}/jobOptions_dd_data_xyz3810.pbs
    mv ${Sample_3810}/jobOptions_dd_data_xyz3810.pbs  ${Sample_3810}/jobOptions_dd_data_xyz3810-${num}.pbs
    
    

done
