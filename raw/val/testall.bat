@echo off
call validate   ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-bad-data-1.xml
call validate   ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-bad-data-2.xml
call validate   ..\ubl\xsd\maindoc\UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-good.xml

call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd core Invoice Invoice-test-good.xml

call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
call validate   ..\ubl\xsd\maindoc\UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-syntax.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-model.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-data.xml
call validate   ..\ubl\xsd\maindoc\UBL-Invoice-2.3.xsd extended Invoice Invoice-test-good.xml
