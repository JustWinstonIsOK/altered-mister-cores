#!/usr/bin/env bash
set -ex

QUARTUS_SH=/c/intelFPGA_lite/17.0/quartus/bin64/quartus_sh

mkdir -p out

for CORE_DIRECTORY in $(find cores/ -maxdepth 1 -type d -name "*_MiSTer"); do
    cd "$CORE_DIRECTORY"
    QPF_NAMES=($(ls *.qpf))
    RBF_NAME=$(basename ${QPF_NAMES[0]} .qpf)
    "$QUARTUS_SH" --flow compile "$RBF_NAME" > ../../out/"$RBF_NAME".log
    cp -f output_files/"$RBF_NAME".rbf ../../out
    cd ../..
done
