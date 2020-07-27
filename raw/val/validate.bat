@echo off
rem Default UBL 2 two-phase validation for XP
rem
rem Syntax: validate ubl-schema-file ubl-xml-file

echo.
echo ############################################################
echo Validating %2
echo ############################################################
@echo off
echo ============== Phase 1: XSD schema validation ==============
call "%~dp0w3cschema.bat" "%~1" "%~2" >output.txt
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No schema validation errors.

echo ============ Phase 2: XSLT code list validation ============
call "%~dp0xslt.bat" "%~2" "%~dp0UBL-DefaultDTQ-2.3.xsl" nul 2>output.txt
set errorRet=%errorlevel%
if %errorRet% neq 0 goto :error
echo No code list validation errors.
goto :done

:error
type output.txt

:done
exit /B %errorRet%