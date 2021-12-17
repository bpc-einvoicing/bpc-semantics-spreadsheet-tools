# Dependencies
#
ant=../utilities/ant
saxon=../utilities/saxon9he/saxon9he.jar
xjparse=../utilities/xjparse/xjparse.jar

if [ "$3" == "" ]
then 
echo Missing BPC version, dateZ and date arguments
exit
fi

if [ ! -e "master-code-list-BPC-$1.xml" ]
then
echo Missing input file: master-code-list-BPC-$1.xml
exit
fi

rm -r work
rm -r out
rm -r results

java -jar $saxon -xsl:Crane-list2ant.xsl -s:master-code-list-BPC-$1.xml -o:make-code-list.ant.xml "raw-uri-prefix=raw/" "intermediate-uri-prefix=work/" "output-uri-prefix=out/"

if [ "$?" != "0" ]; then exit ; fi

echo Building packager...
java -Dant.home=$ant -classpath $xjparse:$ant/lib/ant-launcher.jar:$saxon:. org.apache.tools.ant.launch.Launcher -buildfile make-code-list.ant.xml

if [ "$?" != "0" ]; then exit ; fi

#echo Packaging package...
#java -Dant.home=$ant -classpath $ant/lib/ant-launcher.jar:$saxon:. org.apache.tools.ant.launch.Launcher -buildfile package-BPC-distribution.xml -Ddir=results/ -Dversion=$2 -Ddatetimelocal=$3 -DBPC=$1

rm -r work

b
b
