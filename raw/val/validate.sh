# Default UBL 2 two-phase validation for linux
#
# Syntax: validate ubl-schema-file ubl-xml-file

DP0=$( cd "$(dirname "$0")" ; pwd -P )
echo
echo "############################################################"
echo Validating $3
echo "############################################################"

if [ -f "$3.error.txt" ]; then rm "$3.error.txt" ; fi
if [ -f "$3.svrl.xml" ];  then rm "$3.svrl.xml"  ; fi

echo ============== Phase 1: XSD schema validation ==============
sh "$DP0/w3cschema.sh" "$1" "$3" 2>&1 >"$3.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then echo No schema validation errors. ; rm "$3.error.txt"
else cat "$3.error.txt"; exit $errorRet
fi

echo ============ Phase 2: BPC process $2 data integrity validation ============
sh "$DP0/xslt.sh" "$3" "$DP0/../bpc/$2/BPC-$2-Data-Integrity-Constraints.xsl" "$3.svrl.xml" 2>"$3.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then
sh "$DP0/xslt.sh" "$3.svrl.xml" "$DP0/testSVRL4UBLerrors.xsl" /dev/null 2>"$3.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then echo No data integrity validation errors. ; rm "$3.svrl.xml" "$3.error.txt"
else cat "$3.error.txt"; exit $errorRet

fi #end of check of massaged SVRL

else cat "$3.error.txt"; exit $errorRet

fi #end of check of raw SVRL
