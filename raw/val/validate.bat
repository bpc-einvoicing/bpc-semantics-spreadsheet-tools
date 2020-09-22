@echo off
rem Default UBL 2 two-phase validation for XP
rem
rem Syntax: validate ubl-schema-file bpc-process-Pxx ubl-xml-file

echo.
echo ############################################################
echo Validating %3
echo ############################################################

if exist "%~3.error.txt" del "%~3.error.txt"
if exist "%~3.svrl.xml" del "%~3.svrl.xml"

echo ============== Phase 1: XSD schema validation ==============
call "%~dp0w3cschema.bat" "%~1" "%~3" > "%~3.error.txt"
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No schema validation errors.
del "%~3.error.txt"

echo ============ Phase 2: BPC Process %~2 data integrity validation ============
call "%~dp0xslt.bat" "%~3" "%~dp0../bpc/%~2/BPC-%~2-Data-Integrity-Constraints.xsl" "%~3.svrl.xml" 2> "%~3.error.txt"
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

:error
type "%~3.error.txt"

:done
exit /B %errorRet%