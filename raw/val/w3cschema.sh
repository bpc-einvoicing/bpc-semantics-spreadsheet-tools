DP0=$( cd "$(dirname "$0")" ; pwd -P )
java -jar "$DP0/xjparse.jar" -c "$DP0/catalog.xml" -S "$1" "$2"
errorRet=$?
exit $errorRet
