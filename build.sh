#!/usr/bin/env bash
set -x

QUARTUS_SH=/opt/intelFPGA_lite/17.0/quartus/bin/quartus_sh

mkdir -p out

for CORE_DIRECTORY in $(ls cores); do
    cd "cores/$CORE_DIRECTORY"
    RBF_NAME=$(basename "$CORE_DIRECTORY" _MiSTer)
    "$QUARTUS_SH" --clean "$RBF_NAME" > ../../out/"$RBF_NAME".log
    "$QUARTUS_SH" --flow compile "$RBF_NAME" >> ../../out/"$RBF_NAME".log
    cp -f output_files/"$RBF_NAME".rbf ../../out
    cd ../..
done
