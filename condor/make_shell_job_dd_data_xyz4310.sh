#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4310/condor_sub_dd_data_xyz4310-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4310/jobOptions_dd_data_xyz4310-*.pbs -f

PBS_4310=${Work_Dir}/run/condor_pbs/data/4310
Sample_4310=${Work_Dir}/run/condor_samples/data/4310
Raw=${Work_Dir}/condor/raw
for num in {1..38}
do
    cp ${Raw}/condor_sub_dd_data_xyz4310.sh ${PBS_4310}/
    mv ${PBS_4310}/condor_sub_dd_data_xyz4310.sh ${PBS_4310}/condor_sub_dd_data_xyz4310-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4310.pbs/jobOptions_dd_data_xyz4310-${num}.pbs/g" ${PBS_4310}/condor_sub_dd_data_xyz4310-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4310.pbs ${Sample_4310}/
    sed -i "5s/data_664p01_xyz4310_10G.txt/data_664p01_xyz4310_10G-${num}.txt/g" ${Sample_4310}/jobOptions_dd_data_xyz4310.pbs
    sed -i "19s/dd_data_xyz4310.root/dd_data_xyz4310-${num}.root/g" ${Sample_4310}/jobOptions_dd_data_xyz4310.pbs
    mv ${Sample_4310}/jobOptions_dd_data_xyz4310.pbs  ${Sample_4310}/jobOptions_dd_data_xyz4310-${num}.pbs
    
    

done
