#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4390/condor_sub_dd_data_xyz4390-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4390/jobOptions_dd_data_xyz4390-*.pbs -f

PBS_4390=${Work_Dir}/run/condor_pbs/data/4390
Sample_4390=${Work_Dir}/run/condor_samples/data/4390
Raw=${Work_Dir}/condor/raw
for num in {1..34}
do
    cp ${Raw}/condor_sub_dd_data_xyz4390.sh ${PBS_4390}/
    mv ${PBS_4390}/condor_sub_dd_data_xyz4390.sh ${PBS_4390}/condor_sub_dd_data_xyz4390-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4390.pbs/jobOptions_dd_data_xyz4390-${num}.pbs/g" ${PBS_4390}/condor_sub_dd_data_xyz4390-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4390.pbs ${Sample_4390}/
    sed -i "5s/data_664p01_xyz4390_10G.txt/data_664p01_xyz4390_10G-${num}.txt/g" ${Sample_4390}/jobOptions_dd_data_xyz4390.pbs
    sed -i "19s/dd_data_xyz4390.root/dd_data_xyz4390-${num}.root/g" ${Sample_4390}/jobOptions_dd_data_xyz4390.pbs
    mv ${Sample_4390}/jobOptions_dd_data_xyz4390.pbs  ${Sample_4390}/jobOptions_dd_data_xyz4390-${num}.pbs
    
    

done
