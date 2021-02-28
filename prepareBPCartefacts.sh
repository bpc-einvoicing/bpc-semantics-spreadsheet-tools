#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, platform, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export platform=$2
export rawdir=raw
export targetdir="$1"
export title="BPC Semantics Group"
export BPCversion=0.1
export UBLversion=2.3-csprd03
export dateTime=$3
export numberOfProcesses=5

export ssGoogle=https://docs.google.com/spreadsheets/d/1nK4Rt2ucNmxJCFCtWLlBTxzyRijEWrCVcO2cO7durvY

bash prepareBPCartefacts-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
