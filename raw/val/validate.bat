@echo off
rem Default BPC 2 two-phase validation
rem
rem Syntax: validate customization-id document-type ubl-xml-file

if not "a%~4" == "a" goto :args
if     "a%~3" == "a" goto :args

if not exist "%~dp0../ubl/xsd/maindoc/UBL-%~2-2.3.xsd" goto :badtype

if not exist "%~dp0../bpc/%~1/BPC-%~1-%~2-Data-Integrity-Constraints.xsl" goto :badcust

if not exist "%~3" goto :badxml

echo.
echo ############################################################
echo Validating using customization "%~1" and type "%~2": "%~3"
echo ############################################################

if exist "%~3.error.txt" del "%~3.error.txt"
if exist "%~3.svrl.xml" del "%~3.svrl.xml"

echo ===== Phase 1: XSD schema validation =====
call "%~dp0w3cschema.bat" "%~dp0../ubl/xsd/maindoc/UBL-%~2-2.3.xsd" "%~3" > "%~3.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No schema validation errors.
del "%~3.error.txt"

echo ===== Phase 2: BPC customization "%~1" data integrity validation =====
call "%~dp0xslt.bat" "%~3" "%~dp0../bpc/%~1/BPC-%~1-%~2-Data-Integrity-Constraints.xsl" "%~3.svrl.xml" 2> "%~3.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
del "%~3.error.txt"

call "%~dp0xslt.bat" "%~3.svrl.xml" "%~dp0testSVRL4UBLerrors.xsl" nul 2>"%~3.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error

echo No data integrity validation errors.
del "%~3.svrl.xml"
del "%~3.error.txt"
goto :done

:args
echo Syntax:  validate.bat  customization-id  document-type  ubl-xml-file
goto :done

:badtype
echo Unexpected document type: "%~2"
goto :done

:badcust
echo Unexpected customization: "%~1"
goto :done

:badxml
echo Input XML file not found: "%~3"
goto :done

:error
type "%~3.error.txt"

:done
exit /B %errorRet%