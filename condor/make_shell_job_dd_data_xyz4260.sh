#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4260/condor_sub_dd_data_xyz4260-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4260/jobOptions_dd_data_xyz4260-*.pbs -f

PBS_4260=${Work_Dir}/run/condor_pbs/data/4260
Sample_4260=${Work_Dir}/run/condor_samples/data/4260
Raw=${Work_Dir}/condor/raw
for num in {1..678}
do
    cp ${Raw}/condor_sub_dd_data_xyz4260.sh ${PBS_4260}/
    mv ${PBS_4260}/condor_sub_dd_data_xyz4260.sh ${PBS_4260}/condor_sub_dd_data_xyz4260-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4260.pbs/jobOptions_dd_data_xyz4260-${num}.pbs/g" ${PBS_4260}/condor_sub_dd_data_xyz4260-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4260.pbs ${Sample_4260}/
    sed -i "5s/data_664p01_xyz4260_10G.txt/data_664p01_xyz4260_10G-${num}.txt/g" ${Sample_4260}/jobOptions_dd_data_xyz4260.pbs
    sed -i "19s/dd_data_xyz4260.root/dd_data_xyz4260-${num}.root/g" ${Sample_4260}/jobOptions_dd_data_xyz4260.pbs
    mv ${Sample_4260}/jobOptions_dd_data_xyz4260.pbs  ${Sample_4260}/jobOptions_dd_data_xyz4260-${num}.pbs
    
    

done
