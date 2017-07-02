#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4245/condor_sub_dd_data_xyz4245-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4245/jobOptions_dd_data_xyz4245-*.pbs -f

PBS_4245=${Work_Dir}/run/condor_pbs/data/4245
Sample_4245=${Work_Dir}/run/condor_samples/data/4245
Raw=${Work_Dir}/condor/raw
for num in {1..37}
do
    cp ${Raw}/condor_sub_dd_data_xyz4245.sh ${PBS_4245}/
    mv ${PBS_4245}/condor_sub_dd_data_xyz4245.sh ${PBS_4245}/condor_sub_dd_data_xyz4245-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4245.pbs/jobOptions_dd_data_xyz4245-${num}.pbs/g" ${PBS_4245}/condor_sub_dd_data_xyz4245-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4245.pbs ${Sample_4245}/
    sed -i "5s/data_664p01_xyz4245_10G.txt/data_664p01_xyz4245_10G-${num}.txt/g" ${Sample_4245}/jobOptions_dd_data_xyz4245.pbs
    sed -i "19s/dd_data_xyz4245.root/dd_data_xyz4245-${num}.root/g" ${Sample_4245}/jobOptions_dd_data_xyz4245.pbs
    mv ${Sample_4245}/jobOptions_dd_data_xyz4245.pbs  ${Sample_4245}/jobOptions_dd_data_xyz4245-${num}.pbs
    
    

done
