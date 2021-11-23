@echo off
rem Default BPC 2 two-phase validation
rem
rem Syntax: validate ubl-schema-file customization-id document-type ubl-xml-file

echo.
echo ############################################################
echo Validating using customization "%~2": %~4
echo ############################################################

if exist "%~4.error.txt" del "%~4.error.txt"
if exist "%~4.svrl.xml" del "%~4.svrl.xml"

echo ===== Phase 1: XSD schema validation =====
call "%~dp0w3cschema.bat" "%~1" "%~4" > "%~4.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No schema validation errors.
del "%~4.error.txt"

echo ===== Phase 2: BPC customization "%~2" data integrity validation =====
call "%~dp0xslt.bat" "%~4" "%~dp0../bpc/%~2/BPC-%~2-%~3-Data-Integrity-Constraints.xsl" "%~4.svrl.xml" 2> "%~4.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
del "%~4.error.txt"

call "%~dp0xslt.bat" "%~4.svrl.xml" "%~dp0testSVRL4UBLerrors.xsl" nul 2>"%~4.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error

echo No data integrity validation errors.
del "%~4.svrl.xml"
del "%~4.error.txt"
goto :done

:error
type "%~4.error.txt"

:done
exit /B %errorRet%