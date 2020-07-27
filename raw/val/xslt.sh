DP0=$( cd "$(dirname "$0")" ; pwd -P )
java -jar "$DP0/saxon.jar" -o "$3" "$1" "$2"
errorRet=$?
exit $errorRet
