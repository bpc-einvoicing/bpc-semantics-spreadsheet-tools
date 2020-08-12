#!/bin/bash

if [ ! -d $targetdir ]; then mkdir $targetdir ; fi
if [ ! -d $targetdir/bpc-semantics-tools-$BPCversion-$dateTime ]; then 
mkdir     $targetdir/bpc-semantics-tools-$BPCversion-$dateTime
fi
if [ ! -d $targetdir/bpc-semantics-tools-$BPCversion-$dateTime/archive-only-not-in-final-distribution/ ]; then 
mkdir     $targetdir/bpc-semantics-tools-$BPCversion-$dateTime/archive-only-not-in-final-distribution/
fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile prepareBPCartefacts.xml "-Drawdir=$rawdir" "-Ddir=$targetdir" "-Dtitle=$title" "-DBPCversion=$BPCversion" "-DUBLversion=$UBLversion" "-DssGoogle=$ssGoogle" "-DdateTime=$dateTime" "-Dnumber-of-processes=$numberOfProcesses" | tee $targetdir/bpc-semantics-tools.console.$3.txt
serverReturn=${PIPESTATUS[0]}

mv $targetdir/bpc-semantics-tools.console.$3.txt $targetdir/bpc-semantics-tools-$BPCversion-$dateTime/archive-only-not-in-final-distribution/
echo $serverReturn >$targetdir/bpc-semantics-tools-$BPCversion-$dateTime/archive-only-not-in-final-distribution/bpc-semantics-tools.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
pushd $targetdir
if [ -f bpc-semantics-tools-$BPCversion-$dateTime.zip ]; then rm bpc-semantics-tools-$BPCversion-$dateTime.zip ; fi
7z a bpc-semantics-tools-$BPCversion-$dateTime.zip bpc-semantics-tools-$BPCversion-$dateTime
popd

if [ "$targetdir" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $targetdir/bpc-semantics-tools-$BPCversion-$dateTime.zip .
rm -r -f $targetdir

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
