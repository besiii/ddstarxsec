#!/usr/bin/env bash


cd besenv/cmthome-6.6.5.p01
source setupCVS.sh
source setupCMT.sh
cmt config
source setup.sh

cd ../../TestRelease/TestRelease-00-00-81/cmt/
cmt config
source setup.sh
cd ../../../
