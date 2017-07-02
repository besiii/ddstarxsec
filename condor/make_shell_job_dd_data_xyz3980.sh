#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/3980/condor_sub_dd_data_xyz3980-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/3980/jobOptions_dd_data_xyz3980-*.pbs -f

PBS_3980=${Work_Dir}/run/condor_pbs/data/3980
Sample_3980=${Work_Dir}/run/condor_samples/data/3980
Raw=${Work_Dir}/condor/raw
for num in {1..6}
do
    cp ${Raw}/condor_sub_dd_data_xyz3980.sh ${PBS_3980}/
    mv ${PBS_3980}/condor_sub_dd_data_xyz3980.sh ${PBS_3980}/condor_sub_dd_data_xyz3980-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz3980.pbs/jobOptions_dd_data_xyz3980-${num}.pbs/g" ${PBS_3980}/condor_sub_dd_data_xyz3980-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz3980.pbs ${Sample_3980}/
    sed -i "5s/data_665p01_xyz3980_10G.txt/data_665p01_xyz3980_10G-${num}.txt/g" ${Sample_3980}/jobOptions_dd_data_xyz3980.pbs
    sed -i "19s/dd_data_xyz3980.root/dd_data_xyz3980-${num}.root/g" ${Sample_3980}/jobOptions_dd_data_xyz3980.pbs
    mv ${Sample_3980}/jobOptions_dd_data_xyz3980.pbs  ${Sample_3980}/jobOptions_dd_data_xyz3980-${num}.pbs
    
    

done
