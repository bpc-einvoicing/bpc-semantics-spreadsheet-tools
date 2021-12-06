sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-bad-data-1.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-bad-data-2.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd minimum ApplicationResponse ApplicationResponse-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd invoiceStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-syntax.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-model.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd core Invoice Invoice-test-bad-data.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd core Invoice Invoice-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd otherStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-syntax.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-model.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd extended Invoice Invoice-test-bad-data.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd extended Invoice Invoice-test-good.xml
