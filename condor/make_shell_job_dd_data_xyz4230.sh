#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4230/condor_sub_dd_data_xyz4230-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4230/jobOptions_dd_data_xyz4230-*.pbs -f

PBS_4230=${Work_Dir}/run/condor_pbs/data/4230
Sample_4230=${Work_Dir}/run/condor_samples/data/4230
Raw=${Work_Dir}/condor/raw
for num in {1..751}
do
    cp ${Raw}/condor_sub_dd_data_xyz4230.sh ${PBS_4230}/
    mv ${PBS_4230}/condor_sub_dd_data_xyz4230.sh ${PBS_4230}/condor_sub_dd_data_xyz4230-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4230.pbs/jobOptions_dd_data_xyz4230-${num}.pbs/g" ${PBS_4230}/condor_sub_dd_data_xyz4230-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4230.pbs ${Sample_4230}/
    sed -i "5s/data_664p01_xyz4230_10G.txt/data_664p01_xyz4230_10G-${num}.txt/g" ${Sample_4230}/jobOptions_dd_data_xyz4230.pbs
    sed -i "19s/dd_data_xyz4230.root/dd_data_xyz4230-${num}.root/g" ${Sample_4230}/jobOptions_dd_data_xyz4230.pbs
    mv ${Sample_4230}/jobOptions_dd_data_xyz4230.pbs  ${Sample_4230}/jobOptions_dd_data_xyz4230-${num}.pbs
    
    

done
