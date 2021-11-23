@echo off
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-good.xml
