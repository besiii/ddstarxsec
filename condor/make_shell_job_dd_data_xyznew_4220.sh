#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/new_4220/condor_sub_dd_data_xyznew_4220-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/new_4220/jobOptions_dd_data_xyznew_4220-*.pbs -f

PBS_new_4220=${Work_Dir}/run/condor_pbs/data/new_4220
Sample_new_4220=${Work_Dir}/run/condor_samples/data/new_4220
Raw=${Work_Dir}/condor/raw
for num in {1..95}
do
    cp ${Raw}/condor_sub_dd_data_xyznew_4220.sh ${PBS_new_4220}/
    mv ${PBS_new_4220}/condor_sub_dd_data_xyznew_4220.sh ${PBS_new_4220}/condor_sub_dd_data_xyznew_4220-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyznew_4220.pbs/jobOptions_dd_data_xyznew_4220-${num}.pbs/g" ${PBS_new_4220}/condor_sub_dd_data_xyznew_4220-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyznew_4220.pbs ${Sample_new_4220}/
    sed -i "5s/data_702p01_xyznew_4220_10G.txt/data_702p01_xyznew_4220_10G-${num}.txt/g" ${Sample_new_4220}/jobOptions_dd_data_xyznew_4220.pbs
    sed -i "19s/dd_data_xyznew_4220.root/dd_data_xyznew_4220-${num}.root/g" ${Sample_new_4220}/jobOptions_dd_data_xyznew_4220.pbs
    mv ${Sample_new_4220}/jobOptions_dd_data_xyznew_4220.pbs  ${Sample_new_4220}/jobOptions_dd_data_xyznew_4220-${num}.pbs
    
    

done
