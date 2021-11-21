# Default UBL 2 two-phase validation for linux
#
# Syntax: validate ubl-schema-file process-id document-type ubl-xml-file

DP0=$( cd "$(dirname "$0")" ; pwd -P )
echo
echo "############################################################"
echo Validating using process \"$2\": $4
echo "############################################################"

if [ -f "$4.error.txt" ]; then rm "$4.error.txt" ; fi
if [ -f "$4.svrl.xml" ];  then rm "$4.svrl.xml"  ; fi

echo ============== Phase 1: XSD schema validation ==============
sh "$DP0/w3cschema.sh" "$1" "$4" 2>&1 >"$4.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then echo No schema validation errors. ; rm "$4.error.txt"
else cat "$4.error.txt"; exit $errorRet
fi

echo ============ Phase 2: BPC process $2 data integrity validation ============
sh "$DP0/xslt.sh" "$4" "$DP0/../bpc/$2/BPC-$2-$3-Data-Integrity-Constraints.xsl" "$4.svrl.xml" 2>"$4.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then
sh "$DP0/xslt.sh" "$4.svrl.xml" "$DP0/testSVRL4UBLerrors.xsl" /dev/null 2>"$4.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then echo No data integrity validation errors. ; rm "$4.svrl.xml" "$4.error.txt"
else cat "$4.error.txt"; exit $errorRet

fi #end of check of massaged SVRL

else cat "$4.error.txt"; exit $errorRet

fi #end of check of raw SVRL
