#!/bin/bash

if [ ! -d $targetdir ]; then mkdir $targetdir ; fi
if [ ! -d $targetdir/bpc-semantics-$version ]; then 
mkdir     $targetdir/bpc-semantics-$version
fi
if [ ! -d $targetdir/bpc-semantics-$version/archive-only-not-in-final-distribution/ ]; then 
mkdir     $targetdir/bpc-semantics-$version/archive-only-not-in-final-distribution/
fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile prepareBPCartefacts.xml "-Drawdir=$rawdir" "-Ddir=$targetdir" "-Dtitle=$title" "-DUBLversion=$UBLversion" "-DssGoogle=$ssGoogle" "-Dversion=$version"  | tee $targetdir/bpc-semantics.console.$3.txt
serverReturn=${PIPESTATUS[0]}

mv $targetdir/bpc-semantics.console.$3.txt $targetdir/bpc-semantics-$version/archive-only-not-in-final-distribution/
echo $serverReturn >$targetdir/bpc-semantics-$version/archive-only-not-in-final-distribution/bpc-semantics.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
pushd $targetdir
if [ -f bpc-semantics-$version.zip ]; then rm bpc-semantics-$version.zip ; fi
7z a bpc-semantics-$version.zip bpc-semantics-$version
popd

if [ "$targetdir" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $targetdir/bpc-semantics-$version.zip .
rm -r -f $targetdir

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
