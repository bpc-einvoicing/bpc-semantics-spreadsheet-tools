DP0=$( cd "$(dirname "$0")" ; pwd -P )
java -jar "$DP0/saxon9he.jar" "-o:$3" "-s:$1" "-xsl:$2"
errorRet=$?
exit $errorRet
