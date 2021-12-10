@echo off
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-good.xml
