#!/bin/bash


Work_Dir=$HOME/bes/kpi/v0.2

#rm  ${Work_Dir}/run/condor_pbs/data/new_4200/condor_sub_dd_data_xyznew_4200-*.sh -f
#rm  ${Work_Dir}/run/condor_samples/data/new_4200/jobOptions_dd_data_xyznew_4200-*.pbs -f

PBS_new_4200=${Work_Dir}/run/condor_pbs/data/new_4200
Sample_new_4200=${Work_Dir}/run/condor_samples/data/new_4200
Raw=${Work_Dir}/condor/raw
for num in {1..370}
do
    cp ${Raw}/condor_sub_dd_data_xyznew_4200.sh ${PBS_new_4200}/
    mv ${PBS_new_4200}/condor_sub_dd_data_xyznew_4200.sh ${PBS_new_4200}/condor_sub_dd_data_xyznew_4200-${num}.sh
    sed -i "11s/jobOptions_dd_data_xyznew_4200.pbs/jobOptions_dd_data_xyznew_4200-${num}.pbs/g" ${PBS_new_4200}/condor_sub_dd_data_xyznew_4200-${num}.sh

    cp ${Raw}/jobOptions_dd_data_xyznew_4200.pbs ${Sample_new_4200}/
    sed -i "5s/data_702p01_xyznew_4200_10G.txt/data_702p01_xyznew_4200_10G-${num}.txt/g" ${Sample_new_4200}/jobOptions_dd_data_xyznew_4200.pbs
    sed -i "19s/dd_data_xyznew_4200.root/dd_data_xyznew_4200-${num}.root/g" ${Sample_new_4200}/jobOptions_dd_data_xyznew_4200.pbs
    mv ${Sample_new_4200}/jobOptions_dd_data_xyznew_4200.pbs  ${Sample_new_4200}/jobOptions_dd_data_xyznew_4200-${num}.pbs
    
    

done
