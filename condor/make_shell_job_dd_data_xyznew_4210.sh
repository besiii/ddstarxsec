#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/new_4210/condor_sub_dd_data_xyznew_4210-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/new_4210/jobOptions_dd_data_xyznew_4210-*.pbs -f

PBS_new_4210=${Work_Dir}/run/condor_pbs/data/new_4210
Sample_new_4210=${Work_Dir}/run/condor_samples/data/new_4210
Raw=${Work_Dir}/condor/raw
for num in {1..413}
do
    cp ${Raw}/condor_sub_dd_data_xyznew_4210.sh ${PBS_new_4210}/
    mv ${PBS_new_4210}/condor_sub_dd_data_xyznew_4210.sh ${PBS_new_4210}/condor_sub_dd_data_xyznew_4210-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyznew_4210.pbs/jobOptions_dd_data_xyznew_4210-${num}.pbs/g" ${PBS_new_4210}/condor_sub_dd_data_xyznew_4210-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyznew_4210.pbs ${Sample_new_4210}/
    sed -i "5s/data_702p01_xyznew_4210_10G.txt/data_702p01_xyznew_4210_10G-${num}.txt/g" ${Sample_new_4210}/jobOptions_dd_data_xyznew_4210.pbs
    sed -i "19s/dd_data_xyznew_4210.root/dd_data_xyznew_4210-${num}.root/g" ${Sample_new_4210}/jobOptions_dd_data_xyznew_4210.pbs
    mv ${Sample_new_4210}/jobOptions_dd_data_xyznew_4210.pbs  ${Sample_new_4210}/jobOptions_dd_data_xyznew_4210-${num}.pbs
    
    

done
