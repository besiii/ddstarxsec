#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4090/condor_sub_dd_data_xyz4090-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4090/jobOptions_dd_data_xyz4090-*.pbs -f

PBS_4090=${Work_Dir}/run/condor_pbs/data/4090
Sample_4090=${Work_Dir}/run/condor_samples/data/4090
Raw=${Work_Dir}/condor/raw
for num in {1..42}
do
    cp ${Raw}/condor_sub_dd_data_xyz4090.sh ${PBS_4090}/
    mv ${PBS_4090}/condor_sub_dd_data_xyz4090.sh ${PBS_4090}/condor_sub_dd_data_xyz4090-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4090.pbs/jobOptions_dd_data_xyz4090-${num}.pbs/g" ${PBS_4090}/condor_sub_dd_data_xyz4090-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4090.pbs ${Sample_4090}/
    sed -i "5s/data_664p01_xyz4090_10G.txt/data_664p01_xyz4090_10G-${num}.txt/g" ${Sample_4090}/jobOptions_dd_data_xyz4090.pbs
    sed -i "19s/dd_data_xyz4090.root/dd_data_xyz4090-${num}.root/g" ${Sample_4090}/jobOptions_dd_data_xyz4090.pbs
    mv ${Sample_4090}/jobOptions_dd_data_xyz4090.pbs  ${Sample_4090}/jobOptions_dd_data_xyz4090-${num}.pbs
    
    

done
