#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, platform, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export platform=$2
export rawdir=raw
export targetdir="$1"
export title="BPC Semantics Group"
export BPCversion=0.6
export UBLversion=2.3-os
export dateTime=$3

export ssGoogle=https://docs.google.com/spreadsheets/d/1I3SesJiZYLp-VUk4xHB1VavKqxXc_Fz2Dx85z6gYClg

bash prepareBPCartefacts-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
