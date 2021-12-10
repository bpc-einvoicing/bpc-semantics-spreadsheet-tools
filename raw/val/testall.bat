@echo off
call validate  ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd Minimum ApplicationResponse ApplicationResponse-test-bad-data-1.xml
call validate  ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd Minimum ApplicationResponse ApplicationResponse-test-bad-data-2.xml
call validate  ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd Minimum ApplicationResponse ApplicationResponse-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
call validate  ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
call validate  ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
call validate  ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Core Invoice Invoice-Core-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Minimum Invoice Invoice-Minimum-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Minimum Invoice Invoice-Minimum-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Minimum Invoice Invoice-Minimum-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Minimum Invoice Invoice-Minimum-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Extended Invoice Invoice-Extended-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Extended Invoice Invoice-Extended-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Extended Invoice Invoice-Extended-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd Extended Invoice Invoice-Extended-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Core CreditNote CreditNote-Core-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Core CreditNote CreditNote-Core-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Core CreditNote CreditNote-Core-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Core CreditNote CreditNote-Core-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Minimum CreditNote CreditNote-Minimum-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Minimum CreditNote CreditNote-Minimum-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Minimum CreditNote CreditNote-Minimum-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Minimum CreditNote CreditNote-Minimum-test-good.xml

call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Extended CreditNote CreditNote-Extended-test-bad-syntax.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Extended CreditNote CreditNote-Extended-test-bad-model.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Extended CreditNote CreditNote-Extended-test-bad-data.xml
call validate  ..\ubl\xsd\maindoc\UBL-CreditNote-2.3.xsd Extended CreditNote CreditNote-Extended-test-good.xml
