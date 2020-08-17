# Default UBL 2 two-phase validation for linux
#
# Syntax: validate ubl-schema-file ubl-xml-file

DP0=$( cd "$(dirname "$0")" ; pwd -P )
echo
echo "############################################################"
echo Validating $3
echo "############################################################"
echo ============== Phase 1: XSD schema validation ==============
sh "$DP0/w3cschema.sh" "$1" "$3" 2>&1 >output.txt
errorRet=$?
if [ $errorRet -eq 0 ]
then echo No schema validation errors.
else cat output.txt; exit $errorRet
fi
echo ============ Phase 2: BPC process $2 data integrity validation ============
sh "$DP0/xslt.sh" "$3" "$DP0/../bpc/$2/BPC-$2-Data-Integrity-Constraints.xsl" /dev/null 2>output.txt
errorRet=$?
if [ $errorRet -eq 0 ]
then echo No data integrity validation errors.
else cat output.txt; exit $errorRet
fi
