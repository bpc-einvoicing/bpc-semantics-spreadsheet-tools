@echo off
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.2.xsd P01 invoice-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.2.xsd P01 invoice-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.2.xsd P01 invoice-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.2.xsd P01 invoice-test-good.xml
