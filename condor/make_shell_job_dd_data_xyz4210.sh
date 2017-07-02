#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/4210/condor_sub_dd_data_xyz4210-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/4210/jobOptions_dd_data_xyz4210-*.pbs -f

PBS_4210=${Work_Dir}/run/condor_pbs/data/4210
Sample_4210=${Work_Dir}/run/condor_samples/data/4210
Raw=${Work_Dir}/condor/raw
for num in {1..36}
do
    cp ${Raw}/condor_sub_dd_data_xyz4210.sh ${PBS_4210}/
    mv ${PBS_4210}/condor_sub_dd_data_xyz4210.sh ${PBS_4210}/condor_sub_dd_data_xyz4210-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyz4210.pbs/jobOptions_dd_data_xyz4210-${num}.pbs/g" ${PBS_4210}/condor_sub_dd_data_xyz4210-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyz4210.pbs ${Sample_4210}/
    sed -i "5s/data_664p01_xyz4210_10G.txt/data_664p01_xyz4210_10G-${num}.txt/g" ${Sample_4210}/jobOptions_dd_data_xyz4210.pbs
    sed -i "19s/dd_data_xyz4210.root/dd_data_xyz4210-${num}.root/g" ${Sample_4210}/jobOptions_dd_data_xyz4210.pbs
    mv ${Sample_4210}/jobOptions_dd_data_xyz4210.pbs  ${Sample_4210}/jobOptions_dd_data_xyz4210-${num}.pbs
    
    

done
