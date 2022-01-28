# Default UBL 2 two-phase validation for linux
#
# Syntax: validate customization-id document-type ubl-xml-file

DP0=$( cd "$(dirname "$0")" ; pwd -P )

if [ "a$4" != "a" ] || [ "a$3" == "a" ]
then
echo Syntax:  sh validate.sh  customization-id  document-type  ubl-xml-file
exit 1
fi

if [ ! -f "$DP0/../ubl/xsd/maindoc/UBL-$2-2.3.xsd" ]
then
echo Unexpected document type: \"$2\"
exit 1
fi

if [ ! -f "$DP0/../bpc/$1/BPC-$1-$2-Data-Integrity-Constraints.xsl" ]
then
echo Unexpected customization: \"$1\"
exit 1
fi

if [ ! -f "$3" ]
then
echo Input XML file not found: \"$3\"
exit 1
fi

echo
echo "############################################################"
echo Validating using customization \"$1\" and type \"$2\": \"$3\"
echo "############################################################"

if [ -f "$3.error.txt" ]; then rm "$3.error.txt" ; fi
if [ -f "$3.svrl.xml" ];  then rm "$3.svrl.xml"  ; fi

echo ===== Phase 1: XSD schema validation =====
sh "$DP0/w3cschema.sh" "$DP0/../ubl/xsd/maindoc/UBL-$2-2.3.xsd" "$3" 2>&1 >"$3.error.txt"
errorRet=$?

if [ $errorRet -eq 0 ]
then echo No schema validation errors. ; rm "$3.error.txt"
else cat "$3.error.txt"; exit $errorRet
fi

echo ===== Phase 2: BPC customization \"$1\" data integrity validation =====
sh "$DP0/xslt.sh" "$3" "$DP0/../bpc/$1/BPC-$1-$2-Data-Integrity-Constraints.xsl" "$3.svrl.xml" 2>"$3.error.txt"
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
