#!/bin/bash
echo "started ZMM 13TeV Run2 MC wf 1330.0"
runTheMatrix.py -l 1330.0 --useInput all --command="-n 600 --customise Validation/Performance/TimeMemoryInfo.py --lazy_download" --ibeos >& run1330.0_600.log