#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4040/condor_sub_dd_data_xyz4040-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4040/jobOptions_dd_data_xyz4040-*.pbs -f

PBS_4040=${Work_Dir}/run/condor_pbs/data/4040
Sample_4040=${Work_Dir}/run/condor_samples/data/4040
Raw=${Work_Dir}/condor/raw
for num in {1..5}
do
    cp ${Raw}/condor_sub_dd_data_xyz4040.sh ${PBS_4040}/
    mv ${PBS_4040}/condor_sub_dd_data_xyz4040.sh ${PBS_4040}/condor_sub_dd_data_xyz4040-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4040.pbs/jobOptions_dd_data_xyz4040-${num}.pbs/g" ${PBS_4040}/condor_sub_dd_data_xyz4040-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4040.pbs ${Sample_4040}/
    sed -i "5s/data_665p01_xyz4040_10G.txt/data_665p01_xyz4040_10G-${num}.txt/g" ${Sample_4040}/jobOptions_dd_data_xyz4040.pbs
    sed -i "19s/dd_data_xyz4040.root/dd_data_xyz4040-${num}.root/g" ${Sample_4040}/jobOptions_dd_data_xyz4040.pbs
    mv ${Sample_4040}/jobOptions_dd_data_xyz4040.pbs  ${Sample_4040}/jobOptions_dd_data_xyz4040-${num}.pbs
    
    

done
