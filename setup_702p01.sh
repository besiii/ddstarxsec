#!/usr/bin/env bash


cd besenv/cmthome-7.0.2.p01
source setupCVS.sh
source setupCMT.sh
cmt config
source setup.sh

cd ../../TestRelease/TestRelease-00-00-84/cmt/
cmt config
source setup.sh
cd ../../../



