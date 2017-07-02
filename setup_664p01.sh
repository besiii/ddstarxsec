#!/usr/bin/env bash


cd besenv/cmthome-6.6.4.p01
source setupCVS.sh
source setupCMT.sh
cmt config
source setup.sh

cd ../../TestRelease/TestRelease-00-00-80/cmt/
cmt config
source setup.sh
cd ../../../
