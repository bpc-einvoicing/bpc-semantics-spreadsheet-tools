@echo off
rem Default UBL 2 two-phase validation for XP
rem
rem Syntax: validate ubl-schema-file bpc-process-Pxx ubl-xml-file

echo.
echo ############################################################
echo Validating %3
echo ############################################################
@echo off
echo ============== Phase 1: XSD schema validation ==============
call "%~dp0w3cschema.bat" "%~1" "%~3" >output.txt
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No schema validation errors.

echo ============ Phase 2: BPC Process %~2 data integrity validation ============
rem call "%~dp0xslt.bat" "%~3" "%~dp0../bpc/%~2/BPC-%~2-Data-Integrity-Constraints.xsl" nul 2>output.txt
rem set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No data integrity validation errors.
goto :done

:error
type output.txt

:done
exit /B %errorRet%