@echo off
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice invoice-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice invoice-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice invoice-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice invoice-test-good.xml
